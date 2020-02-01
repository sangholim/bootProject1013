package com.pro1.cafe.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.common.constant.Constant;
import com.pro1.common.utils.FileUtils;
import com.pro1.config.ConfigManagement;
import com.pro1.config.comp._Config;
import com.pro1.security.CustomAuthentication;

@Controller
@RequestMapping("/cafe")
@Lazy
public class CafeMainFrame {

    @Autowired
    private ConfigManagement configManage;

    @Autowired
    private CafeManager cafeManager;

    @RequestMapping(value = "")
    public String getBoardView(Authentication authetication, String cafeType, Model model) {

	cafeManager.getCafeList(model);
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

    /**
     * Cafe 생성 로직
     * 
     * @param authetication
     * @param cafeType
     * @param model
     * @return
     */
    @RequestMapping(value = "/register")
    public String register(Authentication authetication, String cafeType, Model model) {

	cafeManager.getCafeList(model);
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + "/register");
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

}
