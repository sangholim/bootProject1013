package com.pro1.board.web;

import com.pro1.board.param.BoardSimpleInfoForm;
import com.pro1.board.param.UserCafeBoardVO;
import com.pro1.board.service.BoardManager;
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

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/board")
@Lazy
public class BoardMainFrame {

    @Autowired
    private BoardManager boardManager;

    private static final Logger logger = LoggerFactory.getLogger(BoardMainFrame.class);

    /**
     * 정의 되지 않은 경로는 redirect 처리 (/)
     * 
     * @param authetication
     * @param cafe_url
     * @param model
     */
    @RequestMapping(value = { "/", "" })
    public String undefinedPath(Model model) {

	return "redirect:/";
    }

    @RequestMapping(value = "/{cafe_url}")
    public String getBoardMain(Authentication authetication, @PathVariable String cafe_url, Model model)
	    throws Exception {

	boolean isSuccess = false;
	try {
	    CustomAuthentication userAuth = (CustomAuthentication) authetication;

	    // 메인에 카페정보에 넣을 관리자정보와, 카페 심플정보들.
	    BoardSimpleInfoForm boardSimpleInfoForm = boardManager.getCafeBasicInfo(cafe_url, userAuth.getUid(),
		    userAuth.getAuthUser().getUserNickName());
	    // 카페 url를 통하여 카페정보를 찾지 못할경우는 카페 메인 페이지 로 이동
	    if (boardSimpleInfoForm == null) {
		throw new Exception("NOT FOUND CAFE INFO BY CAFE_URL: " + cafe_url);
	    }
	    model.addAttribute("boardSimpleInfo", boardSimpleInfoForm);
	    model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	    model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	    model.addAttribute("userUid", userAuth.getUid());
	    model.addAttribute("cafe_url", cafe_url);
	    isSuccess = true;
	} catch (Exception e) {
	    logger.warn("ERROR GETTING CAFE BOARD MAIN > MSG: {}", e.getMessage(), e);
	}

	return (isSuccess) ? Constant.MAIN : "redirect:/cafe/sub_main/";
    }

    @RequestMapping(value = "/{cafe_url}/{uids}")
    public String getBoardView(Authentication authetication, @PathVariable String cafe_url, @PathVariable String uids,
	    Model model) throws Exception {
	String[] uidList = null;
	boolean isSuccess = false;
	try {
	    // 카페 상세보기시 uids 유형: (cafeUid)_(boardUid)
	    uidList = uids.split("_");

	    // 요청양식이 맞지 않을때는 카페 메인 페이지로 이동
	    if (uids.length() < 2) {
		throw new Exception("NOT MATCHES UID FORM ");
	    }

	    CustomAuthentication userAuth = (CustomAuthentication) authetication;
	    model.addAttribute(Constant.PAGE_TYPE, Constant.BOARD_TYPE);
	    model.addAttribute("boardSimpleInfo", boardManager.getCafeBasicInfo(cafe_url, userAuth.getUid(),
		    userAuth.getAuthUser().getUserNickName()));
	    model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	    model.addAttribute("userUid", userAuth.getUid());
	    model.addAttribute("boardUid", uidList[1]);

	    isSuccess = true;
	} catch (Exception e) {
	    logger.warn("ERROR GETTING CAFE ONE BOARD VIEW > MSG: {}", e.getMessage(), e);
	}

	return (isSuccess) ? Constant.MAIN : "redirect:/cafe/sub_main/";
    }

    @RequestMapping(value = "/d/delete_post", method = { RequestMethod.POST, RequestMethod.GET })
    public void deletePost(HttpServletResponse response, Authentication authentication,
	    @RequestParam(value = "boardUid") long boardUid, @RequestParam(value = "cafeUid") long cafeUid)
	    throws Exception {
	PrintWriter responeWriter = null;

	try {
	    responeWriter = response.getWriter();
	    response.setContentType("text/html; charset=UTF-8");
	    String url = boardManager.deletePost(boardUid, cafeUid);

	    if (url == null || url.isEmpty()) {
		throw new Exception("Not Found CafeUrl");
	    }
	    responeWriter.println(
		    "<script>alert('정상적으로 삭제 되었습니다.'); window.top.location.href='/board/" + url + "';</script>");
	} catch (Exception e) {
	    logger.warn("ERROR Delete Cafe Post, Go to Redirect by window location > MSG: {}", e.getMessage(), e);
	    responeWriter.println(
		    "<script>alert('삭제중 예상치 못한 문제가 발생하였습니다.'); window.top.location.href='/cafe/sub_main/';</script>");
	} finally {
	    if (responeWriter != null) {
		responeWriter.close();
	    }
	}

    }

    @RequestMapping(value = "/d/update_post", method = RequestMethod.GET)
    public String updateGET(Authentication authentication, UserCafeBoardVO userCafeBoard, Model model)
	    throws Exception {

	model.addAttribute("post", boardManager.getSelectedBoard(userCafeBoard.getBoardUid()));
	// model.addAttribute("postInfo", userCafeBoard);
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

    /**
     * 카페에 게시글 쓰기
     * 
     * @param authentication
     * @param userCafeBoardVO
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/insert_post.json", method = RequestMethod.POST)
    public Map<String, Object> insertPosts(Authentication authentication, @RequestBody UserCafeBoardVO userCafeBoardVO)
	    throws Exception {

	Map<String, Object> resultMap = new HashMap<>();
	String code = "code";
	String result = "result";
	String cafeUrl = "cafeUrl";

	try {
	    userCafeBoardVO.setCreateDate(System.currentTimeMillis());
	    boardManager.addPosts(userCafeBoardVO);
	    resultMap.put(code, 200);
	    resultMap.put(result, "정상적으로 게시글이 생성되었습니다.");
	    resultMap.put(cafeUrl, userCafeBoardVO.getCafeUrl());
	} catch (Exception e) {
	    resultMap.put(code, 500);
	    resultMap.put(result, "게시글 생성중 문제 발생!");
	    logger.error("ERROR insert_post.json : {}", e.getMessage());
	}

	return resultMap;
    }

    /**
     * 카페 중앙의 카페 게시글 리스트 불러오기
     * 
     * @param authentication
     * @param model
     * @param cafeUid
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/boardCenter/{cafeUid}", method = RequestMethod.GET)
    public String boardCenter(Authentication authentication, Model model, @PathVariable("cafeUid") long cafeUid)
	    throws Exception {

	boolean isSuccess = false;

	try {
	    model.addAttribute("postList", boardManager.getBoardPostList(cafeUid));
	    isSuccess = true;
	} catch (Exception e) {
	    logger.warn("ERROR SHOWING CAFE BOARD VIEW > MSG: {}", e.getMessage(), e);
	    isSuccess = false;
	}

	return (isSuccess) ? "/board/boardCenter" : "redirect:/cafe/sub_main/";

    }

    /**
     * 카페 가입하기
     * 
     * @param authentication
     * @param model
     * @param cafe_url
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/commonBoardJoin/{cafe_url}", method = RequestMethod.GET)
    public String boardJoin(Authentication authentication, Model model, @PathVariable String cafe_url)
	    throws Exception {
	boolean isSuccess = false;

	try {
	    CustomAuthentication userAuth = (CustomAuthentication) authentication;
	    model.addAttribute("boardSimpleInfoForm", boardManager.getCafeBasicInfo(cafe_url, userAuth.getUid(),
		    userAuth.getAuthUser().getUserNickName()));
	    isSuccess = true;
	} catch (Exception e) {
	    logger.warn("ERROR JOINIG BOARD > MSG: {}", e.getMessage(), e);
	}

	return (isSuccess) ? "/board/commonBoardJoin" : "redirect:/board/sub_main/";
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

	model.addAttribute("post", boardManager.getSelectedBoard(boardUid));

	return "/board/boardPostView";
    }

    /**
     * 카페 가입
     * 
     * @param authetication
     * @param userCafeVO
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/MemberJoin.json", method = RequestMethod.POST)
    public Map CafeJoinPost(Authentication authetication, @RequestBody UserCafeVO userCafeVO) throws Exception {

	CustomAuthentication userAuth = (CustomAuthentication) authetication;

	Map<String, Object> resultMap = new HashMap<>();

	String code = "code";
	String result = "result";

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
