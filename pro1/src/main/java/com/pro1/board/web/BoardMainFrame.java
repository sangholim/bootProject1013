package com.pro1.board.web;

import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.board.service.BoardManager;
import com.pro1.security.CustomAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
@Lazy
public class BoardMainFrame {

	@Autowired
	BoardManager boardManager;

    @RequestMapping(value = "/{cafe_url}")
    public String getBoardMain(Authentication authetication, @PathVariable String cafe_url, Model model) {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	return Constant.MAIN;
    }

    @RequestMapping(value = "/{cafe_url}/{board}")
    public String getBoardView(Authentication authetication, @PathVariable String cafe_url, @PathVariable String board,
	    Model model) {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

    @RequestMapping(value = "/insert_post.json", method= RequestMethod.POST)
	public void insertPosts(@RequestBody UserCafeBoardVO userCafeBoardVO) throws Exception {

		boardManager.addPosts(userCafeBoardVO);
	}
 
}
