package com.pro1.cafe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
    private final String userCafeJoin = "select NEW UserCafeVO(0l, 0l, uc.cafeLevel, uc.cafeFav, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url) from UserCafeVO uc join uc.cafe c where uc.userUid = :userUid";

    /**
     * 추천하는 카페에 필요한 정보 카페이름,카페아이콘, 멤버수, 랭킹점수 (todo)
     */
    private final String recommandCafeJoin = "select NEW UserCafeVO(0l, 0l, uc.cafe.uid, uc.cafe.name, uc.cafe.icon,uc.cafe.memberCnt) from UserCafeVO uc join uc.cafe c where uc.userUid != :userUid";

    public List<UserCafeVO> getCafeListByUserUid(long userUid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectList("getCafeListByUserUid");
	}

	DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {

	    Query<UserCafeVO> query = session.createQuery(userCafeJoin, UserCafeVO.class);
	    query.setParameter("userUid", userUid);
	    return query.getResultList();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}

    }

    /**
     * 유저가 로그인후 볼수있는 cafe들을 추출 (추천 카페들 , 내가 가입한 카페들)
     * @param userUid
     * @return
     * @throws Exception
     */
    public Map<String, List<UserCafeVO>> getCafeMapByUserUid(long userUid) throws Exception {
	/*
	if (sqlSession != null) {
	    return sqlSession.selectList("getCafeListByUserUid");
	}
	*/
	Map<String, List<UserCafeVO>> userCafeMap = new HashMap<>();
	
	DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {

	    Query<UserCafeVO> query = session.createQuery(userCafeJoin, UserCafeVO.class);
	    query.setParameter("userUid", userUid);
	    userCafeMap.put("userCafeList", query.getResultList());
	    
	    //추천 카페 데이터
	    query = session.createQuery(recommandCafeJoin, UserCafeVO.class);
	    query.setParameter("userUid", userUid);
	    userCafeMap.put("recommandCafeList", query.getResultList());
	    
	    return userCafeMap;

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
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
