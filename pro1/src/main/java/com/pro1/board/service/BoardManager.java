package com.pro1.board.service;

import com.pro1.board.dao.BoardDAO;
import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardManager {

    @Autowired
    BoardDAO boardDAO;

    public void addPosts(UserCafeBoardVO vo) throws Exception {

        boardDAO.InsertPost(vo);
    }

}
