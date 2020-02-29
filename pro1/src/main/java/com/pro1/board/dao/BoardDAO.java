package com.pro1.board.dao;

import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.Entity;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class BoardDAO extends CommonDBSession {

    DbSessionInfo sessionInfo;
    //select NEW UserCafeVO(0l, 0l, uc.cafeOfficial, uc.cafe.uid, uc.cafe.name, uc.cafe.icon, uc.cafe.url, uc.cafe.desc, uc.cafe.title_mainSort, uc.cafe.memberCnt) from UserCafeVO uc join uc.cafe c where uc.userUid != :userUid";
//    private final String cafeBoardJoin = "SELECT NEW UserCafeBoardVO(cb.subject, cb.content, cb.writer, cb.addfile, cb.modifiedDate) " +
//                                         "FROM UserCafeBoardVO cb WHERE cb.userUid = :cafeUid";

    private final String cafeBoardJoin = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate) " +
                                             "from UserCafeBoardVO cb where cb.cafeUid = :cafeUid";

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
}