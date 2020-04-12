package com.pro1.board.dao;

import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.UserCafeId;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.user.vo.UserVO;
import org.apache.catalina.User;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

public class UserCafeBoardDAO extends CommonDBSession {

    // UserCafeBoardJpaRepository boardJpaRepository;

    DbSessionInfo sessionInfo;

    private static final Logger logger = LoggerFactory.getLogger(UserCafeBoardDAO.class);

    //private final String cafeUrlForm1 = "select NEW CafeVO(0l, cv.name, cv.icon, cv.url) " +
    //         "from CafeVO cv where cv.url = :url";

    private final String findCafeAdminUser = "select NEW UserCafeVO (uc.userUid, uc.cafeUid, uc.cafeLevel) " +
            "from UserCafeVO  uc where uc.cafeUid = :cafeUid AND uc.userRole = 7";

    private final String UserCafeCnt = "select count(uc.userUid) from UserCafeVO uc where uc.cafeUid = :cafeUid";

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
     * @author skydrive860
     * @brief
     * 로그인한 유저가 카페 멤버인지 확인하는 메서드
     * 로그인한 userUid로 user_cafe를 조회함.
     */
    public boolean isCafeMemberLoginUser(UserCafeId userCafeId) throws Exception {

        //전체를 긁어


        sessionInfo = processHibernateSession(UserCafeVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {

            //그중에서 찾는다.
            UserCafeVO vo = (UserCafeVO)session.load(UserCafeVO.class,userCafeId);
            if(vo.getCafeLevel() == null) {
                return false;
            }
            else {
                return true;
            }

        } catch (ObjectNotFoundException e) { //row 가없으면 objectnotfoundexption이 발생함.
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }


}



