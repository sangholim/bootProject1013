package com.pro1.cafe.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.cafe.service.CafeManager;
import com.pro1.common.constant.Constant;
import com.pro1.config.ConfigManagement;
import com.pro1.security.CustomAuthentication;

@Controller
@RequestMapping("/cafe")
@Lazy
public class CafeMainFrame {

    @Autowired
    private ConfigManagement configManage;

    @Autowired
    private CafeManager cafeManager;

    @RequestMapping(value = "/{sub_type}")
    public String getBoardView(Authentication authetication, String cafeType, Model model, @PathVariable String sub_type) {
	
	//cafeManager.getCafeList(model);
	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	model.addAttribute(Constant.PAGE_SUB_TYPE, sub_type);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	//cafeManager.getCafeListByUserUid(model, userAuth.getUid());
	cafeManager.getCafeMapByUserUid(model, userAuth.getUid());
	
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
