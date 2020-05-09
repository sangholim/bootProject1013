package com.pro1.board.dao;

import com.pro1.board.param.UserCafeBoardId;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.vo.UserCafeId;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class BoardDAO extends CommonDBSession {

    DbSessionInfo sessionInfo;
    //select NEW UserCafeVO(0l, 0l, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url, uc.cafe.desc, uc.cafe.title_mainSort, uc.cafe.memberCnt) from UserCafeVO uc join uc.cafe c where uc.userUid != :userUid";

    private final String cafeBoardJoin = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate) " +
                                             "from UserCafeBoardVO cb where cb.cafeUid = :cafeUid";

    private final String oneBoardView = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate) " +
                                        "from UserCafeBoardVO cb where cb.boardUid = :boardUid";

    public void InsertPost (UserCafeBoardVO vo) throws Exception {

        sessionInfo = processHibernateSession(UserCafeBoardVO.class, vo, DBQueryType.INSERT);
    }

    public List<UserCafeBoardVO> getBoardPostList(long cafeUid) throws Exception {

        if (sqlSession != null) {
            return sqlSession.selectList("getBoardPostList");
        }

        sessionInfo = processHibernateSession(UserCafeBoardVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {

            Query<UserCafeBoardVO> query = session.createQuery(cafeBoardJoin, UserCafeBoardVO.class);
            query.setParameter("cafeUid", cafeUid);
            return query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public UserCafeBoardVO getOneBoardInfo(long boardUid) throws Exception{

        if (sqlSession != null) {
            return sqlSession.selectOne("getOneBoardInfo");
        }

        sessionInfo = processHibernateSession(UserCafeBoardVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {

            Query<UserCafeBoardVO> query = session.createQuery(oneBoardView, UserCafeBoardVO.class);
            query.setParameter("boardUid", boardUid);
            return query.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void deletePost(UserCafeBoardVO userCafeBoardVO) throws Exception {

        if (sqlSession != null) {
             sqlSession.delete("deletePost");
        }

        sessionInfo = processHibernateSession(UserCafeBoardVO.class, userCafeBoardVO, DBQueryType.DELETE);
 //       Session session = sessionFactory.openSession();

//        UserCafeBoardVO vo = session.find(UserCafeBoardVO.class, userCafeBoardVO.getBoardUid());
//
//        session.delete(vo);


    }

    public void updatePost(UserCafeBoardVO userCafeBoardVO) throws Exception {

        if (sqlSession != null) {
            sqlSession.update("updatePost");
        }

        sessionInfo = processHibernateSession(UserCafeBoardVO.class, null, DBQueryType.SELECT);

        try (Session session = sessionInfo.getSession()) {
            Query<UserCafeBoardVO> query = session.createQuery(oneBoardView, UserCafeBoardVO.class);
            query.setParameter("boardUid", userCafeBoardVO.getBoardUid());
            UserCafeBoardVO vo = query.getSingleResult();

            vo.setSubject(userCafeBoardVO.getSubject());
            vo.setContent(userCafeBoardVO.getContent());

            sessionInfo = processHibernateSession(UserCafeBoardVO.class, vo, DBQueryType.UPDATE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //       Session session = sessionFactory.openSession();

//        UserCafeBoardVO vo = session.find(UserCafeBoardVO.class, userCafeBoardVO.getBoardUid());
//
//        session.delete(vo);


    }
}