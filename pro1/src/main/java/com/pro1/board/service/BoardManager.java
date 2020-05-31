package com.pro1.board.service;

import com.pro1.board.dao.BoardDAO;
import com.pro1.board.dao.UserCafeBoardDAO;
import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.DBQueryType;
import com.pro1.common.utils.CommonDBSession;
import com.pro1.common.utils.CommonUtils;
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.CommonUserVO;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardManager extends CommonDBSession {

    private static final Logger logger = LoggerFactory.getLogger(BoardManager.class);

    @Autowired
    private BoardDAO boardDAO;

    @Autowired
    private CafeDAO cafeDAO;

    @Autowired
    private UserCafeBoardDAO userCafeBoardDAO;

    @Autowired
    private UserDAO userDAO;

    /**
     * 게시글 추가
     * 
     * @param vo
     * @throws Exception
     */
    public void addPosts(UserCafeBoardVO userCafeBoard) throws Exception {

	processHibernateSession(userCafeBoard, DBQueryType.INSERT);
    }

    /**
     * 게시글 수정
     * 
     * @param vo
     * @throws Exception
     */
    public void modifyPost(UserCafeBoardVO userCafeBoard) throws Exception {

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	UserCafeBoardVO userCafeBoardDB = null;
	try (Session session = sessionInfo.getSession()) {
	    userCafeBoardDB = boardDAO.getBoardInfo(session, userCafeBoard.getBoardUid());
	    userCafeBoardDB.setContent(userCafeBoard.getContent());
	    userCafeBoardDB.setSubject(userCafeBoard.getSubject());
	    userCafeBoardDB.setModifiedDate(userCafeBoard.getModifiedDate());
	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Select Query > {}", e.getMessage(), e);
	}

	if (userCafeBoardDB == null) {
	    return;
	}

	processHibernateSession(userCafeBoardDB, DBQueryType.UPDATE);

    }

    /**
     * 게시글 리스트
     * 
     * @param cafeUid
     * @return
     * @throws Exception
     */
    public List<UserCafeBoardVO> getBoardPostList(long cafeUid) throws Exception {

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	List<UserCafeBoardVO> userCafeBoardList = null;
	try (Session session = sessionInfo.getSession()) {
	    userCafeBoardList = boardDAO.getBoardPostList(session, cafeUid);
	    // long형 date를 원하는 문자열 형으로 변경하기 위해 로직짬.
	    Date date = new Date();
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    for (UserCafeBoardVO userCafeBoard : userCafeBoardList) {
		date.setTime(userCafeBoard.getCreateDate());
		String strDate = format.format(date);
		userCafeBoard.setCreateDateStr(strDate);
		userCafeBoard.setModifiedDateStr(strDate);
	    }

	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Query > {}", e.getMessage(), e);
	}

	return userCafeBoardList;
    }

    public BoardSimpleInfoForm getSelectedBoard(long boardUid) throws Exception {
	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	BoardSimpleInfoForm boardSimpleInfoForm = null;
	UserCafeBoardVO selectedBoardInfo = null;
	try (Session session = sessionInfo.getSession()) {

	    selectedBoardInfo = boardDAO.getBoardInfo(session, boardUid);

	    if (selectedBoardInfo == null) {
		logger.debug("NOT FOUND ONE BOARD INFO IN 'usercafeboard TBL' > boardUid: {}", boardUid);
		return null;
	    }

	    // 작성 날짜 형태 변경[timestamp -> Date 양식]
	    boardSimpleInfoForm = new BoardSimpleInfoForm();
	    long createDate = selectedBoardInfo.getCreateDate();
	    selectedBoardInfo.setCreateDateStr(CommonUtils.simpleDateFormat.format(new Date(createDate)));
	    boardSimpleInfoForm.setUserCafeBoardVO(selectedBoardInfo);

	    // 카페의 url 호출
	    CafeVO cafeInfo = cafeDAO.getCafeQuery(session, selectedBoardInfo.getCafeUid());
	    if (cafeInfo == null) {
		logger.debug("NOT FOUND CAFE INFO IN 'CAFE TBL' > cafeUid: {}", selectedBoardInfo.getCafeUid());
		return null;
	    }
	    // cafeUrl 재생성 hostName/board/cafe_url/cafeUid_boardUid form 생성
	    boardSimpleInfoForm.setCafeBoardUrl(
		    "/board/" + cafeInfo.getUrl() + '/' + selectedBoardInfo.getCafeUid() + '_' + boardUid);

	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Query > {}", e.getMessage(), e);
	}

	// 정상적으로 카페 리스트가 호출되었을때, 게시글 조회수를 증가시킨다.
	selectedBoardInfo.setViewCnt(selectedBoardInfo.getViewCnt() +1);
	processHibernateSession(selectedBoardInfo, DBQueryType.UPDATE);
	return boardSimpleInfoForm;

    }

    public BoardSimpleInfoForm getCafeBasicInfo(String cafe_url, long userUid) throws Exception {

	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	BoardSimpleInfoForm boardSimpleInfoForm = null;
	try (Session session = sessionInfo.getSession()) {

	    // 카페 정보 추출
	    CafeVO cafeVO = cafeDAO.getCafeUrlinfoMig(session, cafe_url);
	    long cafeUid = cafeVO.getUid();

	    // 카페의 관리자 정보 추출
	    UserCafeVO userCafeVO = userCafeBoardDAO.getAdminUserMig(session, cafeUid);
	    // 카페 멤버수 추출
	    long MemberCnt = userCafeBoardDAO.getCafeUserCntMig(session, cafeUid);
	    // 카페의 유저인지 체크
	    CommonUserVO userVO = userDAO.userUidFindUserMig(session, userCafeVO.getUserUid());
	    // 카페의 글 총 갯수 추출
	    long cafeBoardCnt = boardDAO.getCafeBoardCnt(session, cafeUid);
	    // 카페 유저 인지 체크
	    boolean isCafeUser = userCafeBoardDAO.isCafeUser(session, userUid, cafeUid);
	    // 관리자 닉네임,카페레벨 담기
	    boardSimpleInfoForm = new BoardSimpleInfoForm();
	    boardSimpleInfoForm.setAdminUserNicName(userVO.getUserNickName());
	    boardSimpleInfoForm.setCafeLevel(userCafeVO.getCafeLevel());
	    boardSimpleInfoForm.setCafeMemberCnt(MemberCnt);
	    boardSimpleInfoForm.setCafeUid(cafeUid);
	    boardSimpleInfoForm.setDesc(cafeVO.getDesc());
	    boardSimpleInfoForm.setUserNickName(userVO.getUserNickName());
	    boardSimpleInfoForm.setCafeBoardCnt(cafeBoardCnt);
	    boardSimpleInfoForm.setCafeUser(isCafeUser);
	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Query > {}", e.getMessage(), e);
	}

	return boardSimpleInfoForm;
    }

    public BoardSimpleInfoForm isCafeUser(long userUid, Object cafeUid) throws Exception {
	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	BoardSimpleInfoForm boardSimpleInfoForm = null;
	try (Session session = sessionInfo.getSession()) {
	    // 카페 유저 인지 체크
	    boolean isCafeUser = userCafeBoardDAO.isCafeUser(session, userUid, cafeUid);
	    boardSimpleInfoForm = new BoardSimpleInfoForm();
	    boardSimpleInfoForm.setCafeUser(isCafeUser);
	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Query > {}", e.getMessage(), e);
	}

	return boardSimpleInfoForm;

    };
    
    /**
     * 게시글 삭제후 카페 메인 페이지로 이동
     * @param userCafeBoardVO
     * @throws Exception
     */
    public String deletePost(long boardUid, long cafeUid) throws Exception {

	String result = null;
	// 카페 게시글 삭제
	UserCafeBoardVO userCafeBoard = new UserCafeBoardVO();
	userCafeBoard.setBoardUid(boardUid);
	processHibernateSession(userCafeBoard, DBQueryType.DELETE);

	// 카페 uid를 통해 url 정보를 얻는다.
	DbSessionInfo sessionInfo = processHibernateSession(null, DBQueryType.SELECT);
	try (Session session = sessionInfo.getSession()) {
	    CafeVO cafeResult = cafeDAO.getCafeQuery(session, cafeUid);
	    result = cafeResult.getUrl();
	} catch (Exception e) {
	    logger.warn("ERROR WHILE Excuete Database Query > {}", e.getMessage(), e);
	}

	return result;
    }

    /**
     * 카페 ??
     * 
     * @param vo
     * @throws Exception
     */
    public void cafeSignUp(UserCafeVO userCafe) throws Exception {
	processHibernateSession(userCafe, DBQueryType.UPDATE);
    }
}
