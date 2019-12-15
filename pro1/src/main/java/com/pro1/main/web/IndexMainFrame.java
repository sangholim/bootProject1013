package com.pro1.main.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro1.common.constant.Constant;

@Controller
public class IndexMainFrame {

    private static final Logger logger = LoggerFactory.getLogger(IndexMainFrame.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getIndexMain(Authentication auth, Model model, HttpServletRequest request,
	    HttpServletResponse response) {
	    model.addAttribute(Constant.AUTH_TYPE, 0);
	model.addAttribute(Constant.PAGE_TYPE, Constant.INDEX_POS);
	String jwtHeader = request.getHeader(Constant.TOKEN_HEADER);
	if(auth != null ) {
	    // details에 구체적 권한 정보를 기입하자.
	    model.addAttribute(Constant.AUTH_TYPE, 1);
	    // 인증 받은 vo 를 반환하기
	    model.addAttribute(Constant.USER_ROLE, auth.getPrincipal());
	    
	} else if (jwtHeader != null) {
	    // jwt 유효성 검사
	}
	
	

	return Constant.MAIN;
    }

    @RequestMapping(value = "/index/logout", method = RequestMethod.GET)
    public void doLogOut(Authentication auth, Model model, HttpServletRequest request, HttpServletResponse response)
	    throws Exception {
	request.getSession().invalidate();
	logger.info("Request > {}", request.getParameter(Constant.TOKEN_HEADER));
	response.sendRedirect("/");
	model.addAttribute(Constant.PAGE_TYPE, Constant.INDEX_POS);
    }

    @RequestMapping(value = "/index/userRegister", method = RequestMethod.GET)
    public String doRegister(Model model, HttpServletRequest request) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.USER_ROLE + Constant.ADD);
	logger.info("Request > {}", request.getParameter(Constant.TOKEN_HEADER));
	return Constant.MAIN;
    }

}
