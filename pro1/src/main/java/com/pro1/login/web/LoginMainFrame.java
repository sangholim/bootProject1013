package com.pro1.login.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;

@Controller
@RequestMapping("/login")
public class LoginMainFrame {

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

}
