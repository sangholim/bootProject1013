package com.pro1.cafe.dao;

import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeManageForm;
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
    private final String userCafeJoin = "select NEW UserCafeVO(0l, uc.cafeUid, uc.userRole, uc.cafeFav, uc.cafeNicName, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url, uc.cafeLeaveDate) from UserCafeVO uc join uc.cafe c where uc.userUid = :userUid";

    private final String userRole_condition = " and uc.userRole=";
    
    private final String cafeFav_condition = " and uc.cafeFav=";
    
    private final String cafeUrl_condition = "  c.url='";
    
    private final String cafeUid_condition = "  c.uid=";

    private final String userCafe_userUid_condition = "  uc.userUid=";

    private final String userCafe_cafeUid_condition = "  uc.cafeUid=";
    
    private final String userCafeBoardQuery = "select NEW UserCafeBoardVO(ucb.boardUid, ucb.subject, ucb.writer, ucb.createDate) from UserCafeBoardVO ucb where ucb.cafeUid = :cafeUid  Order By createDate desc";

    /**
     * 추천하는 카페에 필요한 정보 카페이름,카페아이콘, 멤버수, 랭킹점수 (todo)
     */
    private final String cafeList = "select NEW UserCafeVO(0l, 0l, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url, uc.cafe.desc, uc.cafe.title_mainSort, uc.cafe.title_subSort, uc.cafe.region_mainSort, uc.cafe.memberCnt) from \n"
	    + "UserCafeVO uc join uc.cafe c ";

    private final String cafeListCount = "select count(c) from \n" + "UserCafeVO uc join uc.cafe c ";

    private final String cafeMainCondition = "where uc.userUid != %s %s order by createDate";

    private final String cafeUrlForm1 = "select NEW cafe(cv.uid, cv.name, cv.icon, cv.url) from cafe cv where cv.url = :url";

    private final String getCafeQuery = "select c from cafe c where ";
    
    private final String getUserCafeQuery = "select uc from UserCafeVO uc where ";
    
    private final String updateUserCafeQuery = "update UserCafeVO set ";
    
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

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CafeVO cafeVO = cafeForm.getCafeVO();
	    Query query = null;
	    if (userUid != -1) {
		// 유저가 가입한 카페리스트 출력
		query = session.createQuery(userCafeJoin+" and userRole != -2", UserCafeVO.class);
		query.setParameter("userUid", userUid);
		cafeForm.setUserCafeList(query.getResultList());
		List<UserCafeVO> userCafeList = cafeForm.getUserCafeList();

		// 유저가 가입한 카페중 글출력
		if (userCafeList != null && !userCafeList.isEmpty()) {
		    for (UserCafeVO userCafe : userCafeList) {
			// 유저가 가입한 카페가 존재하는지 질의
			query = session.createQuery(userCafeBoardQuery, UserCafeBoardVO.class);
			query.setParameter("cafeUid", userCafe.getCafeUid());
			query.setFirstResult(0);
			query.setMaxResults(3);
			userCafe.setUserCafeBoardList(query.getResultList());
		    }
		}

	    }

	    int cafeType = -1;
	    int cafeSubType = -1;
	    String condition = "";
	    String subCondition = "";
	    if (urlType.toLowerCase().equals("sub_area")) {
		cafeType = cafeVO.getRegion_mainSort();
		// 부조건 생성
		subCondition = " and uc.cafe.region_mainSort = " + cafeType;
		cafeSubType = cafeVO.getRegion_subSort();
		if (cafeSubType > -1) {
		    subCondition += " and uc.cafe.region_subSort = " + cafeSubType;
		}
	    } else {
		cafeType = cafeVO.getTitle_mainSort();
		// 부조건 생성
		subCondition = " and uc.cafe.title_mainSort = " + cafeType;
		cafeSubType = cafeVO.getTitle_subSort();
		if (cafeSubType > -1) {
		    subCondition += " and uc.cafe.title_subSort = " + cafeSubType;
		}
	    }

	    // 주분류, 소분류가 없다면 카페 리스트 가져오지 않음
	    if (cafeType == -1) {
		return;
	    }

	    condition = String.format(cafeMainCondition, userUid, subCondition);

	    /*
	     * 1. 카페 페이지는 최대 총 10페이지로 구성한다. 2. 카페 페이지에 보여주는 내용은 8개 3. 최신순으로 카페페이지를 뽑아낸다.
	     * select count(*) from cafe where title_mainSort = #{title_mainSort}
	     *
	     */
	    query = session.createQuery(cafeListCount + condition);
	    // 존재하는 카페 리스트 총 갯수 구하기
	    List resultList = query.getResultList();
	    long maxPageCount = 0;
	    if (!resultList.isEmpty()) {
		maxPageCount = (long) resultList.get(0);
		maxPageCount = (maxPageCount % cafeForm.getShowDataListCount() == 0)
			? maxPageCount / cafeForm.getShowDataListCount()
			: maxPageCount / cafeForm.getShowDataListCount() + 1;

	    }

	    // 총 카운트가 0보다 작거나 같으면, 카페리스트를 호출하지 않음
	    if (maxPageCount <= 0) {
		return;
	    }

	    // 총 페이지수 = maxPageCount
	    if (cafeForm.getMaxPageCount() <= 0) {
		cafeForm.setMaxPageCount(maxPageCount);
	    }

	    // UI나타나는 최대 페이지수 [ex: 총 페이지수 : 20, UI에서 보여줄 페이지 묶음:6 일때, 현재 1페이지면 최대 페이지는
	    // 6페이지이다.]
	    int getShowPageMaximumCount = cafeForm.getShowPageMinimumCount() * cafeForm.getShowPageNumCount();
	    getShowPageMaximumCount = (getShowPageMaximumCount > (int) maxPageCount) ? (int) maxPageCount
		    : getShowPageMaximumCount;
	    // UI에서 보여지는 페이지중 마지막 페이지
	    cafeForm.setShowPageMaximumCount(getShowPageMaximumCount);

	    // 카페리스트 호출
	    query = session.createQuery(cafeList + condition);
	    // UI상에서 페이지
	    // (현재페이지 -1)*(페이지당 보여줄 리스트 개수)
	    query.setFirstResult((cafeForm.getSelectedPageNum() - 1) * cafeForm.getShowDataListCount());
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

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
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

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);

	try (Session session = sessionInfo.getSession()) {

	    Query<CafeVO> query = session.createQuery(cafeUrlForm1, CafeVO.class);
	    query.setParameter("url", cafe_url);

	    return query.getSingleResult();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

    
    /**
     * @author ued123
     * @brief 카페 url을 통해서 카페 정보들을 얻기위해
     */
    public CafeVO getCafeUrlinfoMig(Session session, String cafe_url) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getCafeUrlinfo");
	}

	Query<CafeVO> query = session.createQuery(cafeUrlForm1, CafeVO.class);
	query.setParameter("url", cafe_url);

	return query.getSingleResult();

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
	    cafeVO.setCreateDate(System.currentTimeMillis());
	    result = processHibernateSession(currentSession, DBQueryType.INSERT, cafeVO);

	    /*
	     * 정상적으로 카페 데이터가 추가되면 카페 유저 관계도도 추가.
	     */
	    if (result) {
		userCafeVO.setCafeUid(cafeVO.getUid());
		userCafeVO.setUserRole(6);
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

    public CafeVO getCafeQuery(Session session, long cafeUid, String url) throws Exception {

	StringBuilder stringBuilder = new StringBuilder(getCafeQuery);
	if(url != null) {
	    stringBuilder.append(cafeUrl_condition).append(url).append("'");   
	}
	
	if (cafeUid != -1) {
	    if (url != null) {
		stringBuilder.append(" and ");
	    }
	    stringBuilder.append(cafeUid_condition).append(cafeUid);
	}
	
	return session.createQuery(stringBuilder.toString(), CafeVO.class).getSingleResult();
    }
    
    public UserCafeVO getUserCafeQuery(Session session, long cafeUid, long userUid) throws Exception {

	return session.createQuery(getUserCafeQueryBuilder(cafeUid, userUid).toString(), UserCafeVO.class).getSingleResult();
    }
    
    public StringBuilder getUserCafeQueryBuilder(long cafeUid, long userUid) throws Exception {

	StringBuilder stringBuilder = new StringBuilder(getUserCafeQuery);
	if(userUid != -1) {
	    stringBuilder.append(userCafe_userUid_condition).append(userUid);   
	}
	
	if (cafeUid != -1) {
	    if (userUid != -1) {
		stringBuilder.append(" and ");
	    }
	    stringBuilder.append(userCafe_cafeUid_condition).append(cafeUid);
	}
	
	return stringBuilder;
    }
    
    public int updateUserCafeQuery(Session session, long cafeUid, long userUid, int cafeFav) throws Exception {
	// update userCafe set 
	StringBuilder stringBuilder = new StringBuilder(updateUserCafeQuery);
	
	// need to update
	if (cafeFav != -1) {
	    stringBuilder.append(" cafeFav=" + cafeFav);
	}

	if (userUid != -1 || cafeUid != -1) {
	    stringBuilder.append(" where ");
	}
	
	if(userUid != -1) {
	    stringBuilder.append(" userUid=").append(userUid);   
	}
	
	if (cafeUid != -1) {
	    if (userUid != -1) {
		stringBuilder.append(" and ");
	    }
	    stringBuilder.append(" cafeUid=").append(cafeUid);
	}
	
	return session.createQuery(stringBuilder.toString()).executeUpdate();
    }
    
    public int updateUserCafeUserRole(Session session, long cafeUid, long userUid, int userRole) throws Exception {
	// update userCafe set 
	StringBuilder stringBuilder = new StringBuilder(updateUserCafeQuery);
	
	// need to update
	// 카페 탈퇴시에 탈퇴시간도 추가한다.
	if (userRole == -2) {
	    stringBuilder.append(" cafeLeaveDate=" + System.currentTimeMillis()).append(",");
	}
	stringBuilder.append(" userRole=" + userRole);
	stringBuilder.append(" where ");
	stringBuilder.append(" userUid=").append(userUid);   
	stringBuilder.append(" and ");
	stringBuilder.append(" cafeUid=").append(cafeUid);
	
	return session.createQuery(stringBuilder.toString()).executeUpdate();
    }
    
    /**
     * 로그인후 내 카페관리 탭에 의해서 질의 ..
     *
     * @param userUid
     * @param cafeFav 
     * @param userRole 
     * @return
     * @throws Exception
     */
    public void getMyCafeConditions(Session session, CafeManageForm cafeManageForm, long userUid, int userRole,
	    int cafeFav) {

	// 유저가 가입한 카페리스트 출력
	StringBuilder queryBuilder = new StringBuilder(userCafeJoin);
	String default_userRole_condition = " and uc.userRole!=-2";
	if (userRole != -100) {
	    default_userRole_condition = userRole_condition + userRole;
	}
	
	queryBuilder.append(default_userRole_condition);
	
	if (cafeFav == 1) {
	    queryBuilder.append(cafeFav_condition).append(cafeFav);
	}

	Query<UserCafeVO> query = session.createQuery(queryBuilder.toString(), UserCafeVO.class).setParameter("userUid", userUid);
	
	    // 존재하는 카페 리스트 총 갯수 구하기
	    List resultList = query.getResultList();
	    long maxPageCount = 0;
	    
	    if (!resultList.isEmpty()) {
		maxPageCount = (long) resultList.size();
		maxPageCount = (maxPageCount % cafeManageForm.getShowDataListCount() == 0)
			? maxPageCount / cafeManageForm.getShowDataListCount()
			: maxPageCount / cafeManageForm.getShowDataListCount() + 1;

	    }

	    // 총 카운트가 0보다 작거나 같으면, 카페리스트를 호출하지 않음
	    if (maxPageCount <= 0) {
		return;
	    }

	    // 총 페이지수 = maxPageCount
	    if (cafeManageForm.getMaxPageCount() <= 0) {
		cafeManageForm.setMaxPageCount(maxPageCount);
	    }

	    // UI나타나는 최대 페이지수 [ex: 총 페이지수 : 20, UI에서 보여줄 페이지 묶음:6 일때, 현재 1페이지면 최대 페이지는
	    // 6페이지이다.]
	    int getShowPageMaximumCount = cafeManageForm.getShowPageMinimumCount() * cafeManageForm.getShowPageNumCount();
	    getShowPageMaximumCount = (getShowPageMaximumCount > (int) maxPageCount) ? (int) maxPageCount
		    : getShowPageMaximumCount;
	    // UI에서 보여지는 페이지중 마지막 페이지
	    cafeManageForm.setShowPageMaximumCount(getShowPageMaximumCount);

	    // 카페리스트 호출
	    // UI상에서 페이지
	    // (현재페이지 -1)*(페이지당 보여줄 리스트 개수)
	    query.setFirstResult((cafeManageForm.getSelectedPageNum() - 1) * cafeManageForm.getShowDataListCount());
	    // setMaxResults 검색 시작 데이터로부터 + count 만큼 조회
	    query.setMaxResults(cafeManageForm.getShowDataListCount());
	    cafeManageForm.setUserCafeList(query.getResultList());
    }

}
