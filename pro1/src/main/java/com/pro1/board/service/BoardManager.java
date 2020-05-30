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
import com.pro1.common.vo.DbSessionInfo;
import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.CommonUserVO;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

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
    * @param vo
    * @throws Exception
    */
    public void addPosts(UserCafeBoardVO vo) throws Exception {

	boardDAO.InsertPost(vo);
    }

    /**
     * 게시글 수정
     * @param vo
     * @throws Exception
     */
    public void modifyPost(UserCafeBoardVO vo) throws Exception {

	boardDAO.updatePost(vo);
    }

    /**
     * 게시글 리스트
     * @param cafeUid
     * @return
     * @throws Exception
     */
    public List<UserCafeBoardVO> getBoardPostList(long cafeUid) throws Exception {

	return boardDAO.getBoardPostList(cafeUid);
    }

    public void getOneBoardInfo(long boardUid, Model model) throws Exception {

	model.addAttribute("post", boardDAO.getOneBoardInfo(boardUid));
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
	    boolean isCafeUser = userCafeBoardDAO.isCafeUser(session, userUid,cafeUid);
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

    public void deletePost(UserCafeBoardVO userCafeBoardVO) throws Exception {
	boardDAO.deletePost(userCafeBoardVO);
    }
    
    
    public void cafeSignUp(UserCafeVO vo) throws Exception {
	userCafeBoardDAO.cafeSignUp(vo);
    }
}
