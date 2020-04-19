package com.pro1.cafe.dao;

import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;

public class CafeDAO extends CommonDBSession {

    private static final Logger logger = LoggerFactory.getLogger(CafeDAO.class);

    /**
     * User가 가입한 카페에 필요한 정보 카페레벨,즐겨찾기, 카페이름,카페아이콘
     */
    private final String userCafeJoin = "select NEW UserCafeVO(0l, 0l, uc.cafeLevel, uc.cafeFav, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url) from UserCafeVO uc join uc.cafe c where uc.userUid = :userUid";

    /**
     * 추천하는 카페에 필요한 정보 카페이름,카페아이콘, 멤버수, 랭킹점수 (todo)
     */
    private final String cafeList = "select NEW UserCafeVO(0l, 0l, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url, uc.cafe.desc, uc.cafe.title_mainSort, uc.cafe.title_subSort, uc.cafe.region_mainSort, uc.cafe.memberCnt) from \n"
	    + "UserCafeVO uc join uc.cafe c ";

    private final String cafeListCount = "select count(c) from \n" + "UserCafeVO uc join uc.cafe c ";

    // private final String cafeUrlForm1 = "select NEW cafe(cv.uid, cv.name, cv.icon, cv.url) from cafe cv where cv.url = :url";

    // private final String cafeConditionForm1 = "where %s != %s and %s = %s order
    // by createDate";
    private final String cafeCondition = "where uc.userUid != %s and %s = %s order by createDate";

    /**
     * 유저가 로그인후 볼수있는 cafe들을 추출 (추천 카페들 , 내가 가입한 카페들)
     * 
     * @param userUid
     * @return
     * @throws Exception
     */
    public void getCafeMapByUserUid(long userUid, String urlType, CafeForm cafeForm) throws Exception {
	/*
	 * if (sqlSession != null) { return
	 * sqlSession.selectList("getCafeListByUserUid"); }
	 */

	DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CafeVO cafeVO = cafeForm.getCafeVO();
	    Query query = null;
	    if(userUid != -1) {
		query = session.createQuery(userCafeJoin, UserCafeVO.class);
		query.setParameter("userUid", userUid);
		cafeForm.setUserCafeList(query.getResultList());
	    }

	    String condition = (urlType.toLowerCase().equals("sub_area"))
		    ? String.format(cafeCondition, userUid, "uc.cafe.region_mainSort", cafeVO.getRegion_mainSort())
		    : String.format(cafeCondition, userUid, "uc.cafe.title_mainSort", cafeVO.getTitle_mainSort());

	    /*
	     * 
	     * 1. 카페 페이지는 최대 총 10페이지로 구성한다. 2. 카페 페이지에 보여주는 내용은 8개 3. 최신순으로 카페페이지를 뽑아낸다.
	     * select count(*) from cafe where title_mainSort = #{title_mainSort}
	     * 
	     */
	    query = session.createQuery(cafeListCount + condition);
	    // 존재하는 카페 리스트 총 갯수 구하기
	    List resultList = query.getResultList();
	    long maxPageCount = 0;
	    if(!resultList.isEmpty()) {
		maxPageCount = (long) resultList.get(0);
		maxPageCount = (maxPageCount % cafeForm.getShowPageNumCount() == 0)
			? maxPageCount / cafeForm.getShowPageNumCount()
			: maxPageCount / cafeForm.getShowPageNumCount() + 1;

	    }
	   
	    // 총 카운트가 0보다 작거나 같으면, 카페리스트를 호출하지 않음
	    if (maxPageCount <= 0) {
		return;
	    }
	    
	    // 총 페이지수가 정해져 있지 않으면 설정
	    if (cafeForm.getMaxPageCount() <= 0) {
		cafeForm.setMaxPageCount(maxPageCount);
	    }
	    
	    int getShowPageMaximumCount = cafeForm.getShowPageMinimumCount() * cafeForm.getShowPageNumCount();
	    getShowPageMaximumCount = (getShowPageMaximumCount > (int) maxPageCount) ? (int) maxPageCount
		    : getShowPageMaximumCount;
	    // UI에서 보여지는 페이지중 마지막 페이지
	    cafeForm.setShowPageMaximumCount(getShowPageMaximumCount);
	    
	    // 카페리스트 호출
	    query = session.createQuery(cafeList + condition);
	    // UI상에서 페이지
	    // (현재페이지 -1)*(페이지당 보여줄 리스트 개수)
	    query.setFirstResult((cafeForm.getSelectedPageNum()-1) * cafeForm.getShowDataListCount());
	    // setMaxResults 검색 시작 데이터로부터 + count 만큼 조회
	    query.setMaxResults(cafeForm.getShowDataListCount());
	    cafeForm.setShowCafeList(query.getResultList());

	} catch (Exception e) {
	    e.printStackTrace();
	}

    }

    public List<CafeVO> getCafeList() throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectList("selectCafeList");
	}

	DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CriteriaBuilder builder = sessionInfo.getCriteriaBuilder();
	    CriteriaQuery<CafeVO> criteria = builder.createQuery(CafeVO.class);
	    Root<CafeVO> root = criteria.from(CafeVO.class);
	    criteria.select(root);

	    return session.createQuery(criteria).getResultList();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}

    }

        /**
         * @author ued123
         * @brief 카페 url을 통해서 카페 정보들을 얻기위해
         */
	public CafeVO getCafeUrlinfo(String cafe_url) throws Exception {

		if (sqlSession != null) {
			return sqlSession.selectOne("getCafeUrlinfo");
		}

		DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);

		try (Session session = sessionInfo.getSession()) {

			//Query<CafeVO> query = session.createQuery(cafeUrlForm1, CafeVO.class);
			//query.setParameter("url", cafe_url);
			CafeVO vo = session.byNaturalId(CafeVO.class).using("url",cafe_url).load();

			return vo;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}


    /**
     * CAFE 추가 , UserCafe 테이블 추가한다.
     * 
     * @param cafeVO
     * @param userCafeVO
     * @return
     * @throws Exception
     */
    public boolean addCafe(CafeVO cafeVO, UserCafeVO userCafeVO) throws Exception {

	boolean result = false;
	if (sqlSession != null) {
	    sqlSession.insert("addCafe");
	}
	Session currentSession = null;
	try {
	    currentSession = openSession();
	    result = processHibernateSession(currentSession, DBQueryType.INSERT, cafeVO);

	    /*
	     * 정상적으로 카페 데이터가 추가되면 카페 유저 관계도도 추가.
	     */
	    if (result) {
		userCafeVO.setCafeUid(cafeVO.getUid());
		result = processHibernateSession(currentSession, DBQueryType.INSERT, userCafeVO);
	    }

	} catch (Exception e) {
	    logger.error("Error Transaction Cafe, UserCafe tables > {}", e.getMessage(), e);
	} finally {
	    if (currentSession != null) {
		currentSession.close();
	    }
	}

	return result;
    }

}
