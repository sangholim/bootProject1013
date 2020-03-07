package com.pro1.board.web;

import com.pro1.board.param.BoardVO;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.board.service.BoardManager;
import com.pro1.cafe.web.CafeMainAsync;
import com.pro1.security.CustomAuthentication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.pro1.common.constant.Constant;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
@Lazy
public class BoardMainFrame {

	@Autowired
	BoardManager boardManager;

	private static final Logger logger = LoggerFactory.getLogger(BoardMainFrame.class);

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

    @ResponseBody
    @RequestMapping(value = "/insert_post.json", method= RequestMethod.POST)
	public Map<String,Object> insertPosts(Authentication authentication,@RequestBody UserCafeBoardVO userCafeBoardVO) throws Exception {

		Map<String, Object> resultMap = new HashMap<>();

		String code = "code";
		String result = "result";

		resultMap.put(code, 500);
		resultMap.put(result, "카페 생성중 문제 발생!");

		CustomAuthentication userAuth = (CustomAuthentication) authentication;


		userCafeBoardVO.setCreateDate(System.currentTimeMillis());
		userCafeBoardVO.setModifiedDate(System.currentTimeMillis());

		try {
			boardManager.addPosts(userCafeBoardVO);
		} catch (Exception e) {
			logger.error("ERROR insert_post.json : {}", e.getMessage());
			return resultMap;
		}

		resultMap.put(code, 200);
		resultMap.put(result, "정상적으로 게시글이 생성되었습니다.");

		return resultMap;
	}

	@RequestMapping(value = "/boardCenter" , method= RequestMethod.GET)
	public void boardCenter(Authentication authentication,Model model) throws Exception {

		CustomAuthentication userAuth = (CustomAuthentication) authentication;
		List<UserCafeBoardVO> boardPostList = boardManager.getBoardPostList(8);
		model.addAttribute("postList",boardPostList);

	}

	@RequestMapping(value = "/boardCenter/{boardUid}" , method= RequestMethod.GET)
	public String boardCenter(Authentication authentication,@PathVariable("boardUid") long boardUid,Model model) throws Exception {

		CustomAuthentication userAuth = (CustomAuthentication) authentication;
		UserCafeBoardVO post = boardManager.getOneBoardInfo(boardUid);
		model.addAttribute("post",post);

		return "/board/boardPostView";
	}
}
