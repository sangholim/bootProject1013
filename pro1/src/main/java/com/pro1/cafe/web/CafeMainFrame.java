package com.pro1.cafe.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.common.constant.Constant;
import com.pro1.security.CustomAuthentication;

@Controller
@RequestMapping("/cafe")
@Lazy
public class CafeMainFrame {

    private static final Logger logger = LoggerFactory.getLogger(CafeMainFrame.class);

    @Autowired
    private CafeManager cafeManager;

    @RequestMapping(value = "/{sub_type}")
    public String getBoardView(Authentication authetication, String cafeType, Model model, @PathVariable String sub_type) {
	
	CafeForm cafeForm = new CafeForm();
	
	/*
	switch (sub_type) {
    	case "sub_main":
    	    cafeForm.setShowPageNumCount(8);
    	    cafeForm.setShowDataListCount(10);
    	case "sub_theme":
    	    cafeForm.setShowPageNumCount(6);
    	    cafeForm.setShowDataListCount(10);
    	case "sub_area":
    	    cafeForm.setShowPageNumCount(6);
    	    cafeForm.setShowDataListCount(10);
    	default:
    	    //선택된 페이지는 1로  정한다.
    	    cafeForm.setSelectedPageNum(1);
    	    break;
	}
	*/
	//ui에서 페이지 간격은 8 로 정한다.
	
	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	model.addAttribute(Constant.PAGE_SUB_TYPE, sub_type);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());
	
	try {
	    cafeManager.getCafeMapByUserUid(cafeForm, userAuth.getUid(),sub_type);
	    model.addAttribute("cafeForm", cafeForm);
	} catch (Exception e) {
	    logger.info("Error getting CafeList > {}", e.getMessage(), e.getCause());
	    // 앞으로는 오류 페이지로 넘길수 있게 처리
	    return Constant.MAIN;
	}
	
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
