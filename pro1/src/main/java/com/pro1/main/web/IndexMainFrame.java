package com.pro1.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.common.constant.Constant;

@Controller
public class IndexMainFrame {

    @RequestMapping("")
    public String getIndexMain(Model model) {
	model.addAttribute(Constant.PAGE_TYPE, Constant.INDEX_POS);
	return "main";
    }

}
