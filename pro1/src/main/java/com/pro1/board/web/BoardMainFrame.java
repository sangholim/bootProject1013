package com.pro1.board.web;

import com.pro1.security.CustomAuthentication;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;

@Controller
@RequestMapping("/board")
public class BoardMainFrame {

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
 
}
