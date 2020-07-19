package com.pro1.board.dao;

import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class UserCafeBoardDAO extends CommonDBSession {

    // UserCafeBoardJpaRepository boardJpaRepository;

    DbSessionInfo sessionInfo;

    //private final String findCafeAdminUser = "select NEW UserCafeVO (uc.userUid, uc.cafeUid, uc.cafeLevel, uc.cafeNicName) "
    //	    + "from UserCafeVO  uc where uc.cafeUid = :cafeUid AND uc.userRole = 7";

    private final String getCafeUser = "select NEW UserCafeVO (uc.userUid, uc.cafeUid, uc.cafeLevel, uc.userRole, uc.cafeNicName, uc.user.userNickName) "
	    + "from UserCafeVO  uc join uc.user c";

    private final String UserCafeCnt = "select count(uc.userUid) from UserCafeVO uc";
    // 유저 role 조건
    private final String userRole_con = "uc.userRole = :userRole"; 
    // userUid 조건
    private final String userUid_con = "uc.userUid = :userUid";
    // cafeUid 조건
    private final String cafeUid_con = "uc.cafeUid = :cafeUid";
    
     
    private final String findCafeJoinUserUid = "SELECT count(uc.userUid) FROM UserCafeVO uc WHERE uc.cafeUid= :cafeUid AND uc.userUid= :userUid";

    public long getCountCafeMember(long cafeUid) {

	return 0;
    }

    public UserCafeVO getCafeUserMig(Session session, long cafe_uid, long user_uid, int userRole) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getCafeUser");
	}
	StringBuilder queryBuilder = new StringBuilder(getCafeUser);
	queryBuilder.append(" where ").append(cafeUid_con).append(" and ");
	Query<UserCafeVO> query = null;
	if (userRole == 7) {
	    query = session.createQuery(queryBuilder.append(userRole_con).toString(), UserCafeVO.class);
	    query.setParameter("userRole", userRole);
		
	} else {
	    query = session.createQuery(queryBuilder.append(userUid_con).toString(), UserCafeVO.class);
	    query.setParameter("userUid", user_uid);
		    
	}
 	query.setParameter("cafeUid", cafe_uid);
 	
	return (query.getResultList().isEmpty())? null : query.getSingleResult();

    }
    /*
    public UserCafeVO getAdminUserMig(Session session, long cafe_uid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getAdminUser");
	}

	Query<UserCafeVO> query = session.createQuery(findCafeAdminUser, UserCafeVO.class);
	query.setParameter("cafeUid", cafe_uid);
	return query.getSingleResult();

    }
	*/
    
    public Long getCafeUserCnt(long cafe_uid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getAdminUser");
	}

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);

	try (Session session = sessionInfo.getSession()) {

	    Query<Long> query = session.createQuery(UserCafeCnt, Long.class);
	    query.setParameter("cafeUid", cafe_uid);
	    return query.getSingleResult();

	} catch (Exception e) {
	    e.printStackTrace();
	    return -1l;
	}

    }

    public Long getCafeUserCntMig(Session session, long cafe_uid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getAdminUser");
	}

	Query<Long> query = session.createQuery(UserCafeCnt + " where " + cafeUid_con, Long.class);
	query.setParameter("cafeUid", cafe_uid);
	return query.getSingleResult();

    }

    /**
     * 카페 회원인지 체크 로직
     * @param session
     * @param userUid
     * @param cafeUid
     * @return
     * @throws Exception
     */
    public boolean isCafeUser(Session session, Object userUid, Object cafeUid) throws Exception {

	boolean result = false;

	// Query<Long> query = session.createQuery(findCafeJoinUserUid, Long.class);
	Query<Long> query = session.createQuery(findCafeJoinUserUid, Long.class);
	query.setParameter("cafeUid", Long.parseLong(cafeUid.toString()));
	query.setParameter("userUid", Long.parseLong(userUid.toString()));

	if (query.getSingleResult() > 0) {
	    return !result;
	}

	return result;
    }

}
