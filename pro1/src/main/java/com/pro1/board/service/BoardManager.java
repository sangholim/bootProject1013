package com.pro1.board.service;

import com.pro1.board.dao.BoardDAO;
import com.pro1.board.dao.UserCafeBoardDAO;
import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.CafeVO;
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
        //long cafeMemberCnt = userCafeBoardDAO.getCountCafeMember(cafeUid);
        CommonUserVO userVO = userDAO.userUidFindUser(userCafeVO.getUserUid());

        BoardSimpleInfoForm boardSimpleInfoForm = new BoardSimpleInfoForm();

        /*
            관리자 닉네임,카페레벨 담기
         */
        boardSimpleInfoForm.setAdminUserNicName(userVO.getUserNickName());
        boardSimpleInfoForm.setCafeLevel(userCafeVO.getCafeLevel());

        return boardSimpleInfoForm;
    }

}
