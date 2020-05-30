package com.pro1.board.dao;

import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.utils.CommonUtils;
import com.pro1.common.vo.DbSessionInfo;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Date;
import java.util.List;

public class BoardDAO extends CommonDBSession {

    private DbSessionInfo sessionInfo;

    private final String cafeBoardJoin = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate) "
	    + "from UserCafeBoardVO cb where cb.cafeUid = :cafeUid order by cb.createDate desc";

    private final String getCafeInfo = "select c from cafe c where c.uid = :cafeUid";

    private final String oneBoardView = "select NEW UserCafeBoardVO(cb.boardUid,cb.userUid,cb.cafeUid, cb.subject, cb.content, cb.writer, cb.addfile, cb.createDate, cb.modifiedDate) "
	    + "from UserCafeBoardVO cb where cb.boardUid = :boardUid";

    private final String getCafeBoardCnt = "select count(cb.boardUid) from UserCafeBoardVO cb where cb.cafeUid = :cafeUid";

    private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);

    public void InsertPost(UserCafeBoardVO vo) throws Exception {

	sessionInfo = processHibernateSession(vo, DBQueryType.INSERT);
    }

    public List<UserCafeBoardVO> getBoardPostList(long cafeUid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectList("getBoardPostList");
	}

	sessionInfo = processHibernateSession(null, DBQueryType.SELECT);

	try (Session session = sessionInfo.getSession()) {

	    Query<UserCafeBoardVO> query = session.createQuery(cafeBoardJoin, UserCafeBoardVO.class);
	    query.setParameter("cafeUid", cafeUid);
	    return query.getResultList();

	} catch (Exception e) {
	    e.printStackTrace();
	    return null;
	}
    }

    public BoardSimpleInfoForm getOneBoardInfo(long boardUid) throws Exception {

	if (sqlSession != null) {
	    return sqlSession.selectOne("getOneBoardInfo");
	}

	sessionInfo = processHibernateSession(null, DBQueryType.SELECT);

	try (Session session = sessionInfo.getSession()) {
	    BoardSimpleInfoForm boardForm = new BoardSimpleInfoForm();

	    // 1. 해당 게시글정보 호출
	    UserCafeBoardVO userCafeBoardVo = session.createQuery(oneBoardView, UserCafeBoardVO.class)
		    .setParameter("boardUid", boardUid).getSingleResult();

	    if (userCafeBoardVo == null) {
		logger.debug("NOT FOUND ONE BOARD INFO IN 'usercafeboard TBL' > boardUid: {}", boardUid);
		return null;
	    }
	    long createDate = userCafeBoardVo.getCreateDate();
	    userCafeBoardVo.setCreateDateStr(CommonUtils.simpleDateFormat.format(new Date(createDate)));
	    boardForm.setUserCafeBoardVO(userCafeBoardVo);
	    // 2. 해당 게시글이 있는 카페 정도 호출
	    CafeVO cafevo = session.createQuery(getCafeInfo, CafeVO.class)
		    .setParameter("cafeUid", userCafeBoardVo.getCafeUid()).getSingleResult();

	    if (cafevo == null) {
		logger.debug("NOT FOUND CAFE INFO IN 'CAFE TBL' > cafeUid: {}", userCafeBoardVo.getCafeUid());
		return null;
	    }

	    // hostName/board/cafe_url/boardUid 형태 생성
	    // hostName/board/cafe_url/cafeUid_boardUid form 생성
	    boardForm
		    .setCafeBoardUrl("/board/" + cafevo.getUrl() + '/' + userCafeBoardVo.getCafeUid() + '_' + boardUid);

	    return boardForm;

	} catch (Exception e) {
	    logger.warn("ERROR IN GETTING ONE BOARD INFO > MSG: {}", e.getMessage(), e);
	    return null;
	}
    }

    public void deletePost(UserCafeBoardVO userCafeBoardVO) throws Exception {

	if (sqlSession != null) {
	    sqlSession.delete("deletePost");
	}

	sessionInfo = processHibernateSession(userCafeBoardVO, DBQueryType.DELETE);

    }

    public void updatePost(UserCafeBoardVO userCafeBoardVO) throws Exception {

	if (sqlSession != null) {
	    sqlSession.update("updatePost");
	}

	sessionInfo = processHibernateSession(null, DBQueryType.SELECT);

	try (Session session = sessionInfo.getSession()) {
	    Query<UserCafeBoardVO> query = session.createQuery(oneBoardView, UserCafeBoardVO.class);
	    query.setParameter("boardUid", userCafeBoardVO.getBoardUid());
	    UserCafeBoardVO vo = query.getSingleResult();

	    vo.setSubject(userCafeBoardVO.getSubject());
	    vo.setContent(userCafeBoardVO.getContent());

	    sessionInfo = processHibernateSession(vo, DBQueryType.UPDATE);
	} catch (Exception e) {
	    e.printStackTrace();
	}

    }

    public long getCafeBoardCnt(Session session, long cafeUid) throws Exception {

	Query<Long> query = session.createQuery(getCafeBoardCnt, Long.class);
	query.setParameter("cafeUid", cafeUid);
	return query.getSingleResult();

    }

}