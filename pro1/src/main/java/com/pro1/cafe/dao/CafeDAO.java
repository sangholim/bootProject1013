package com.pro1.cafe.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
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

    public List<UserCafeVO> getCafeListByUserUid(long userUid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectList("getCafeListByUserUid");
	}

	DbSessionInfo sessionInfo = processHibernateSession(CafeVO.class, null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {

	    // TEST SELECT * FROM cafe c JOIN user_cafe uc ON c.uid = uc.cafeUid where
	    // uc.userUid = 26 \G;
	    // Query<UserCafeVO> query = session.createQuery("from cafe c join c.user_cafe
	    // uc where uc.userUid = :userUid",
	    // UserCafeVO.class);
	    Query<UserCafeVO> query = session.createQuery(
		    "select NEW UserCafeVO(0l, 0l, uc.cafeLevel, uc.cafeFav, uc.cafe) from UserCafeVO uc join uc.cafe c where uc.userUid = :userUid",
		    UserCafeVO.class);
	    // Query<UserCafeVO> query = session
	    // .createQuery("select uc.cafe, uc.cafeLevel, uc.cafeFav from UserCafeVO uc
	    // join uc.cafe c where uc.userUid = :userUid", UserCafeVO.class);
	    query.setParameter("userUid", userUid);
	    // CriteriaBuilder builder = sessionInfo.getCriteriaBuilder();
	    // CriteriaQuery<UserCafeVO> criteria = builder.createQuery(UserCafeVO.class);
	    // "from cafe c join c.user_cafe uc"
	    // Root<UserCafeVO> ucRoot = criteria.from(UserCafeVO.class);
	    // ucRoot.alias("uc");
	    // ucRoot.join("cafe",JoinType.INNER);
	    // criteria.select(ucRoot);
	    // criteria.multiselect(ucRoot.get("cafe"));
	    // criteria.where(builder.equal(ucRoot.get("userUid"), userUid));
	    return query.getResultList();

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
