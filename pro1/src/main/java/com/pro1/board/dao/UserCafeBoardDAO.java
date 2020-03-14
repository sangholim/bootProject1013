package com.pro1.board.dao;

import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserCafeBoardDAO extends CommonDBSession {

    DbSessionInfo sessionInfo;

    private static final Logger logger = LoggerFactory.getLogger(UserCafeBoardDAO.class);

    //private final String cafeUrlForm1 = "select NEW CafeVO(0l, cv.name, cv.icon, cv.url) " +
   //         "from CafeVO cv where cv.url = :url";

    private final String findCafeAdminUser = "select NEW UserCafeVO (uc.userUid, uc.cafeUid, uc.cafeLevel) " +
            "from UserCafeVO  uc where uc.cafeUid = :cafeUid AND uc.userRole = 7";

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

}
