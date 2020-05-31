package com.pro1.board.dao;

import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.common.utils.CommonDBSession;
import org.hibernate.Session;
import org.hibernate.query.Query;
import java.util.List;

public class BoardDAO extends CommonDBSession {

    private final String cafeBoardJoin = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate, cb.viewCnt) "
	    + "from UserCafeBoardVO cb where cb.cafeUid = :cafeUid order by cb.createDate desc";

    private final String oneBoardView = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate, cb.viewCnt) "
	    + "from UserCafeBoardVO cb where cb.boardUid = :boardUid";

    private final String getCafeBoardCnt = "select count(cb.boardUid) from UserCafeBoardVO cb where cb.cafeUid = :cafeUid";

    public List<UserCafeBoardVO> getBoardPostList(Session session, long cafeUid) throws Exception {

	Query<UserCafeBoardVO> query = session.createQuery(cafeBoardJoin, UserCafeBoardVO.class);
	query.setParameter("cafeUid", cafeUid);
	return query.getResultList();
    }

    // 게시글 정보 호출
    public UserCafeBoardVO getBoardInfo(Session session, long boardUid) throws Exception {
	return session.createQuery(oneBoardView, UserCafeBoardVO.class).setParameter("boardUid", boardUid)
		.getSingleResult();
    }

    public long getCafeBoardCnt(Session session, long cafeUid) throws Exception {

	Query<Long> query = session.createQuery(getCafeBoardCnt, Long.class);
	query.setParameter("cafeUid", cafeUid);
	return query.getSingleResult();

    }

}