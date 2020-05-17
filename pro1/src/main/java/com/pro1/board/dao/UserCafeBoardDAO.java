package com.pro1.board.dao;

import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserCafeBoardDAO extends CommonDBSession {

    // UserCafeBoardJpaRepository boardJpaRepository;

    DbSessionInfo sessionInfo;

    private static final Logger logger = LoggerFactory.getLogger(UserCafeBoardDAO.class);

    //private final String cafeUrlForm1 = "select NEW CafeVO(0l, cv.name, cv.icon, cv.url) " +
    //         "from CafeVO cv where cv.url = :url";

    private final String findCafeAdminUser = "select NEW UserCafeVO (uc.userUid, uc.cafeUid, uc.cafeLevel) " +
            "from UserCafeVO  uc where uc.cafeUid = :cafeUid AND uc.userRole = 7";

    private final String UserCafeCnt = "select count(uc.userUid) from UserCafeVO uc where uc.cafeUid = :cafeUid";

    private final String findCafeJoinUserUid = "SELECT count(uc.userUid) FROM UserCafeVO uc WHERE uc.cafeUid= :cafeUid AND uc.userUid= :userUid";

    public long getCountCafeMember(long cafeUid) {

        return 0;
    }

    public UserCafeVO getAdminUser(long cafe_uid) throws Exception {

        if (sqlSession != null) {
            return sqlSession.selectOne("getAdminUser");
        }

        sessionInfo = processHibernateSession(UserCafeVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {

            Query<UserCafeVO> query = session.createQuery(findCafeAdminUser, UserCafeVO.class);
            query.setParameter("cafeUid", cafe_uid);
            return query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public Long getCafeUserCnt(long cafe_uid) throws Exception {

        if (sqlSession != null) {
            return sqlSession.selectOne("getAdminUser");
        }

        sessionInfo = processHibernateSession(UserCafeVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {

            Query<Long> query = session.createQuery(UserCafeCnt, Long.class);
            query.setParameter("cafeUid", cafe_uid);
            return query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
            return -1l;
        }

    }

    /**
     * @author ued123
     * @brief
     * 로그인한 유저가 카페 멤버인지 확인하는 메서드
     * 로그인한 userUid로 user_cafe를 조회함.
     */
    public boolean isCafeMemberLoginUser(Object userUid, Object cafeUid) throws Exception {

	// 전체를 긁어
	sessionInfo = processHibernateSession(UserCafeVO.class, null, DBQueryType.SELECT);
	boolean result = false;
	try (Session session = sessionInfo.getSession()) {

	    // Query<Long> query = session.createQuery(findCafeJoinUserUid, Long.class);
	    Query<Long> query = session.createQuery(findCafeJoinUserUid, Long.class);
	    query.setParameter("cafeUid", Long.parseLong(cafeUid.toString()));
	    query.setParameter("userUid", Long.parseLong(userUid.toString()));
	    
	    if (query.getSingleResult() > 0) {
		return !result;
	    }

	} catch (Exception e) {
	    logger.warn("ERROR QUERYING USERCAFEBOARD TBL > Cause: {}", e.getMessage(), e);
	}

	return result;
    }

    /**
     * @author ued123
     * @brief
     * 카페 가입하기
     */
    public void cafeSignUp(UserCafeVO vo) throws Exception {

        sessionInfo = processHibernateSession(UserCafeVO.class,vo,DBQueryType.INSERT);

    }


}



