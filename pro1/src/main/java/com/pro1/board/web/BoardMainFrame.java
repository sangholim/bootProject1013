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

import java.util.List;

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
	model.addAttribute("userUid",userAuth.getUid());

	return Constant.MAIN;
    }

    @RequestMapping(value = "/{cafe_url}/{board}")
    public String getBoardView(Authentication authetication, @PathVariable String cafe_url, @PathVariable String board,
	    Model model) throws Exception {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	model.addAttribute("userUid",userAuth.getUid());


	//List<UserCafeBoardVO> boardPostList = boardManager.getBoardPostList(8);
	//model.addAttribute("postList",boardPostList);

	return Constant.MAIN;
    }

    @RequestMapping(value = "/insert_post.json", method= RequestMethod.POST)
	public void insertPosts(Authentication authentication,@RequestBody UserCafeBoardVO userCafeBoardVO) throws Exception {

		CustomAuthentication userAuth = (CustomAuthentication) authentication;

		boardManager.addPosts(userCafeBoardVO);
	}

	@RequestMapping(value = "/boardCenter" , method= RequestMethod.GET)
	public void boardCenter(Authentication authentication,Model model) throws Exception {

		CustomAuthentication userAuth = (CustomAuthentication) authentication;
		List<UserCafeBoardVO> boardPostList = boardManager.getBoardPostList(8);
		model.addAttribute("postList",boardPostList);

		System.out.println("eee");

	}
}
