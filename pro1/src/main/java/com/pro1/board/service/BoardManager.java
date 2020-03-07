package com.pro1.board.service;

import com.pro1.board.dao.BoardDAO;
import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BoardManager {

    @Autowired
    BoardDAO boardDAO;

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

}
