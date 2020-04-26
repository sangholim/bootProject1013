package com.pro1.board.service;

import com.pro1.board.dao.BoardDAO;
import com.pro1.board.dao.UserCafeBoardDAO;
import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeId;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.CommonUserVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BoardManager {

    @Autowired
    BoardDAO boardDAO;

    @Autowired
    CafeDAO cafeDAO;

    @Autowired
    UserCafeBoardDAO userCafeBoardDAO;

    @Autowired
    UserDAO userDAO;

    //게시글 추가
    public void addPosts(UserCafeBoardVO vo) throws Exception {

        boardDAO.InsertPost(vo);
    }

    public List<UserCafeBoardVO> getBoardPostList(long cafeUid) throws Exception {

        return boardDAO.getBoardPostList(cafeUid);
    }

    public UserCafeBoardVO getOneBoardInfo(long boardUid) throws Exception {

        return boardDAO.getOneBoardInfo(boardUid);
    }

    public BoardSimpleInfoForm getCafeUrlInfo(String cafe_Url) throws Exception {
        CafeVO cafeVO = cafeDAO.getCafeUrlinfo(cafe_Url);

        long cafeUid = cafeVO.getUid();

        UserCafeVO userCafeVO = userCafeBoardDAO.getAdminUser(cafeUid);
        long MemberCnt = userCafeBoardDAO.getCafeUserCnt(cafeUid);
        //long cafeMemberCnt = userCafeBoardDAO.getCountCafeMember(cafeUid);
        CommonUserVO userVO = userDAO.userUidFindUser(userCafeVO.getUserUid());

        /*
            관리자 닉네임,카페레벨 담기
         */
        BoardSimpleInfoForm boardSimpleInfoForm = new BoardSimpleInfoForm();
        boardSimpleInfoForm.setAdminUserNicName(userVO.getUserNickName());
        boardSimpleInfoForm.setCafeLevel(userCafeVO.getCafeLevel());
        boardSimpleInfoForm.setCafeMemberCnt(MemberCnt);
        boardSimpleInfoForm.setCafeUid(cafeUid);
        boardSimpleInfoForm.setDesc(cafeVO.getDesc());
        boardSimpleInfoForm.setUserNickName(userVO.getUserNickName());

        return boardSimpleInfoForm;
    }

    public void deletePost(UserCafeBoardVO userCafeBoardVO) throws Exception {
        boardDAO.deletePost(userCafeBoardVO);
    }

    /*
     * 해당 VO는 idclass로 복합키를 가지므로 조인할때 키를 다넣어줘야함.
     */
    public boolean isMemberCafeLoginUser(UserCafeId userCafeId) throws Exception {

        return userCafeBoardDAO.isCafeMemberLoginUser(userCafeId);
    }

    public void cafeSignUp(UserCafeVO vo) throws Exception {
        userCafeBoardDAO.cafeSignUp(vo);
    }
}

