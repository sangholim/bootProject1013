package com.pro1.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;
import com.pro1.user.sesrvice.UserService;
import com.pro1.user.vo.UserVO;

@Controller
@RequestMapping("/login")
public class LoginMainFrame {

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String getLoginMain(Model model, HttpServletRequest requeset) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.LOGIN_POS);
	return Constant.MAIN;
    }

    @RequestMapping("/register")
    public String doRegister(Model model, HttpServletRequest requeset) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.LOGIN_POS + "/register");
	return Constant.MAIN;
    }

    /**
     * 회원 유저 추가 , 로그인 , 인증 부여
     * @param uservo
     * @return
     */
    @RequestMapping("/addUser")
    public void doRegister(UserVO uservo, HttpServletResponse response) {
	// 성공시 > Main으로 Redirect
	// 실패시 그냥 페이지 유지
	userService.addUser(uservo, response);
    }

    @RequestMapping("/findAddr")
    public String findAddr(Model model ,HttpServletResponse response) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.LOGIN_POS+"/findAddr");
	// 성공시 > Main으로 Redirect
	// 실패시 그냥 페이지 유지
	// 나중에 우편찾기 웹페이지 실행전에 필요한 요소 추가
	return Constant.MAIN;
    }

}
