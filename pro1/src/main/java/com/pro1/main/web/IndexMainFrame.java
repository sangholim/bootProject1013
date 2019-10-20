package com.pro1.main.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro1.common.constant.Constant;

@Controller
public class IndexMainFrame {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String getIndexMain(Authentication auth, Model model) {

	if (auth == null) {
	    model.addAttribute(Constant.AUTH_TYPE, 0);
	} else {
	    // details에 구체적 권한 정보를 기입하자.
	    model.addAttribute(Constant.AUTH_TYPE, 1);
	    // 인증 받은 vo 를 반환하기
	    model.addAttribute(Constant.USER_ROLE, auth.getPrincipal());
	}

	model.addAttribute(Constant.PAGE_TYPE, Constant.INDEX_POS);
	return Constant.MAIN;
    }

    @RequestMapping(value = "/index/logout", method = RequestMethod.GET)
    public void doLogOut(Authentication auth, Model model, HttpServletRequest request, HttpServletResponse response)
	    throws Exception {
	request.getSession().invalidate();
	response.sendRedirect("/");
	model.addAttribute(Constant.PAGE_TYPE, Constant.INDEX_POS);
    }

    @RequestMapping(value = "/index/userRegister", method = RequestMethod.GET)
    public String doRegister(Model model) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.USER_ROLE+Constant.ADD);
	return Constant.MAIN;
    }

}
