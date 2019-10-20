package com.pro1.cafe.web;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;

@Controller
@RequestMapping("/cafe")
public class CafeMainFrame {

    @RequestMapping(value = "")
    public String getBoardView(Authentication authetication, String cafeType, Model model) {
	
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	return Constant.MAIN;
    }
}
