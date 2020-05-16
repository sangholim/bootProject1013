package com.pro1.board.web;

import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.board.service.BoardManager;
import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.UserCafeId;
import com.pro1.cafe.vo.UserCafeVO;
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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/board")
@Lazy
public class BoardMainFrame {

    @Autowired
    private BoardManager boardManager;

    @Autowired
    private CafeManager cafeManager;

    private static final Logger logger = LoggerFactory.getLogger(BoardMainFrame.class);

    @RequestMapping(value = "/{cafe_url}")
    public String getBoardMain(Authentication authetication, @PathVariable String cafe_url, Model model)
	    throws Exception {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;

	Long loginUid = userAuth.getUid();

	// 메인에 카페정보에 넣을 관리자정보와, 카페 심플정보들.
	BoardSimpleInfoForm boardSimpleInfoForm = boardManager.getCafeUrlInfo(cafe_url);
	model.addAttribute("boardSimpleInfo", boardSimpleInfoForm);
	model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	// model.addAttribute(Constant.PAGE_SUB_TYPE, Constant.MAIN);
    model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	model.addAttribute("userUid", userAuth.getUid());
	model.addAttribute("cafe_url", cafe_url);
	
	UserCafeId userCafeId = new UserCafeId();
	userCafeId.setUserUid(loginUid);
	userCafeId.setCafeUid(boardSimpleInfoForm.getCafeUid());
	boolean hasInfo = boardManager.isMemberCafeLoginUser(userCafeId);

	if (hasInfo) {
	    model.addAttribute("boardMainBtn", "카페 글쓰기");
	    model.addAttribute("isMemberCafeLoginUser", true); // 로그인한 사용자가 카페 가입을 한것인지 flag
	} else {
	    model.addAttribute("boardMainBtn", "카페 가입하기");
	    model.addAttribute("isMemberCafeLoginUser", false);
	}

	return Constant.MAIN;
    }

    @RequestMapping(value = "/{cafe_url}/{boardUid}")
    public String getBoardView(Authentication authetication, @PathVariable String cafe_url,
	    @PathVariable String boardUid, Model model) throws Exception {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	model.addAttribute("userUid", userAuth.getUid());
	model.addAttribute("boardUid", boardUid);

	return Constant.MAIN;
    }

    @RequestMapping(value = "/d/delete_post", method = RequestMethod.POST)
    public String deletePost(Authentication authentication, @RequestParam(value = "boardUid") long boardUid)
	    throws Exception {
	
	// TODO: 소스 로직 변경
	// UserCafeBoardVO vo = boardManager.getOneBoardInfo(boardUid);
	//boardManager.deletePost(vo);
	// test
	return "redirect:" + "/board/boardCenter/" + 1;
    }

    @RequestMapping(value = "/d/update_post", method = RequestMethod.GET)
    public String updateGET(Authentication authentication, UserCafeBoardVO vo, Model model) throws Exception {

	boardManager.getOneBoardInfo(vo.getBoardUid(), model);
	model.addAttribute("postInfo", vo);
	return "/board/commonBoardUpdate";
    }

    @ResponseBody
    @RequestMapping(value = "/d/update_post.json", method = RequestMethod.POST)
    public Map<String, Object> updatePost(Authentication authentication, @RequestBody UserCafeBoardVO vo, Model model)
	    throws Exception {

	Map<String, Object> resultMap = new HashMap<>();

	String code = "code";
	String result = "result";
	String boardUid = "boardUid";

	resultMap.put(code, 500);
	resultMap.put(result, "게시글 수정중 문제 발생!");

	// CustomAuthentication userAuth = (CustomAuthentication) authentication;

	vo.setCreateDate(System.currentTimeMillis());
	vo.setModifiedDate(System.currentTimeMillis());

	try {
	    boardManager.modifyPost(vo);
	} catch (Exception e) {
	    logger.error("ERROR d/update_post.json : {}", e.getMessage());
	    return resultMap;
	}

	resultMap.put(code, 200);
	resultMap.put(result, "정상적으로 게시글이 수정되었습니다.");
	resultMap.put(boardUid, vo.getBoardUid());

	return resultMap;
    }

    /*
     * 카페에 게시글 쓰기
     */
    @ResponseBody
    @RequestMapping(value = "/insert_post.json", method = RequestMethod.POST)
    public Map<String, Object> insertPosts(Authentication authentication, @RequestBody UserCafeBoardVO userCafeBoardVO)
	    throws Exception {

	Map<String, Object> resultMap = new HashMap<>();

	String code = "code";
	String result = "result";
	String cafeUrl = "cafeUrl";

	resultMap.put(code, 500);
	resultMap.put(result, "게시글 생성중 문제 발생!");

	// CustomAuthentication userAuth = (CustomAuthentication) authentication;

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
	resultMap.put(cafeUrl, userCafeBoardVO.getCafeUrl());

	return resultMap;
    }

    /**
     * 카페 중앙의 카페 게시글 리스트 불러오기
     * @param authentication
     * @param model
     * @param cafeUid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/boardCenter/{cafeUid}", method = RequestMethod.GET)
    public String boardCenter(Authentication authentication, Model model, @PathVariable("cafeUid") long cafeUid)
	    throws Exception {

	// CustomAuthentication userAuth = (CustomAuthentication) authentication;
	List<UserCafeBoardVO> boardPostList = boardManager.getBoardPostList(cafeUid);

	/*
	 * long형 date를 원하는 문자열 형으로 변경하기 위해 로직짬.
	 */
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	for (UserCafeBoardVO vo : boardPostList) {

	    date.setTime(vo.getModifiedDate());
	    String strDate = format.format(date);

	    vo.setCreateDateStr(strDate);
	    vo.setModifiedDateStr(strDate);
	}

	model.addAttribute("postList", boardPostList);

	return "/board/boardCenter";

    }

    
    /**
     * 카페 중앙의 카페 게시글 리스트 불러오기
     * @param authentication
     * @param model
     * @param cafe_url
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/commonBoardJoin/{cafe_url}", method = RequestMethod.GET)
    public String boardJoin(Authentication authentication, Model model, @PathVariable String cafe_url)
	    throws Exception {

	// CustomAuthentication userAuth = (CustomAuthentication) authentication;
	BoardSimpleInfoForm boardSimpleInfoForm = boardManager.getCafeUrlInfo(cafe_url);

	model.addAttribute("BoardSimpleInfoForm", boardSimpleInfoForm);
	System.out.println(boardSimpleInfoForm.toString());

	return "/board/commonBoardJoin";
    }

    /**
     * 게시판 리스트 클릭시 내용 보기 이벤트
     * 
     * @param authentication
     * @param boardUid
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/boardCenter/p/{boardUid}", method = RequestMethod.GET)
    public String boardCenter(Authentication authentication, @PathVariable("boardUid") long boardUid, Model model,
	    HttpServletRequest request) throws Exception {
	boardManager.getOneBoardInfo(boardUid, model);

	return "/board/boardPostView";
    }

    /*
     * 카페 가입하기
     */
    @ResponseBody
    @RequestMapping(value = "/MemberJoin.json", method = RequestMethod.POST)
    public Map CafeJoinPost(Authentication authetication, @RequestBody UserCafeVO userCafeVO) throws Exception {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;

	Map<String, Object> resultMap = new HashMap<>();

	String code = "code";
	String result = "result";
	String cafeUrl = "cafeUrl";

	resultMap.put(code, 500);
	resultMap.put(result, "카페 가입중 문제 발생!");

	userCafeVO.setUserUid(userAuth.getUid());
	boardManager.cafeSignUp(userCafeVO);

	resultMap.put(code, 200);
	resultMap.put(result, "정상적으로 카페에 가입되었습니다.");
	// resultMap.put(cafeUrl,userCafeVO.getCafeUrl());

	return resultMap;
    }
}
