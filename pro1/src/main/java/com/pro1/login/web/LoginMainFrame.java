package com.pro1.login.web;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;
import com.pro1.security.CustomAuthentication;
import com.pro1.user.sesrvice.UserService;
import com.pro1.user.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginMainFrame {

    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(LoginMainFrame.class);

    @RequestMapping("")
    public String getLoginMain(Authentication auth, Model model, HttpServletRequest request) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.LOGIN_POS);
	logger.info("Request > {}", request.getParameter(Constant.TOKEN_HEADER));
	return Constant.MAIN;
    }

    /**
     * 로그인 후에는 정보변경 페이지로 이동 로그인 전에는 회원가입 페이지로 이동
     * 
     * @param auth
     * @param model
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/register")
    public String doRegister(Authentication auth, Model model, HttpServletRequest request,
	    HttpServletResponse response) {
	// test
	logger.info("Request > {}", request.getParameter(Constant.TOKEN_HEADER));

	model.addAttribute(Constant.PAGE_TYPE, Constant.LOGIN_POS + "/register");
	if (auth != null) {
	    userService.getUserForUpdate(auth, model, response);
	}
	return Constant.MAIN;
    }

    /**
     * 회원 유저 추가 , 로그인 , 인증 부여
     * 
     * @param uservo
     * @return
     */
    @RequestMapping("/addUser")
    public void doRegister(Authentication auth, UserVO uservo, HttpServletRequest request,
	    HttpServletResponse response) {
	// 성공시 > Main으로 Redirect
	// 실패시 그냥 페이지 유지
	userService.addUser(uservo, request, response);
    }

    /**
     * 회원 유저 정보 변경
     * 
     * @param uservo
     * @return
     */
    @RequestMapping("/update")
    public void doUpdateUser(CustomAuthentication auth, UserVO uservo, HttpServletResponse response) {
	// 성공시 > Main으로 Redirect
	// 실패시 그냥 페이지 유지
	uservo.setUserUid(auth.getUid());
	userService.doUpdateUser(uservo, response);
    }

    @RequestMapping("/doLogin")
    public void doLogin(HttpServletResponse response) {
	
	// 로그인 정보가 없는 상태에서 로그인이 필요한 URL에 접근한 경우..
	// 로그인 페이지로 redirect
	try (PrintWriter writer = response.getWriter();){
	    response.setContentType("text/html; charset=UTF-8");
	    writer.println("<script>alert('로그인후 이용해 주세요.'); window.location.href='/login';</script>");
	} catch (Exception e) {
	    logger.error("Error process in doLogin > {}", e.getMessage(), e);
	}
    }
    
    
}
