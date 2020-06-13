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

    @RequestMapping(value = { "/", "" })
    public String getCafeRoot(Authentication authetication, String cafeType, Model model) {

	return "redirect:/cafe/sub_main/";
    }

    @RequestMapping(value = "/{sub_type}")
    public String getCafeView(Authentication authetication, String cafeType, Model model,
	    @PathVariable String sub_type) {

	CafeForm cafeForm = new CafeForm();

	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + '_' + Constant.MAIN_TYPE);
	model.addAttribute(Constant.PAGE_SUB_TYPE, sub_type);
	model.addAttribute("nickName", userAuth.getAuthUser().getUserNickName());

	try {
	    cafeManager.getCafeMapByUserUid(cafeForm, userAuth.getUid(), sub_type);
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
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + '_' + Constant.REGISTER_TYPE);
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

    /**
     * 내가 가입한 카페 기준으로 관리 화면
     * 
     * @param authetication
     * @param cafeType
     * @param model
     * @return
     */
    @RequestMapping(value = "/manage")
    public String manage(Authentication authetication, String cafeType, Model model) {

	// cafeManager.getCafeList(model);
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + '_' + Constant.MANAGE_TYPE);
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

    /**
     * 
     * 내 카페 관리에 탭 컨트롤러 1. 내카페 /cafe/manage/mycafe
     * 
     * 2. 즐겨찾기 /cafe/manage/favorite
     * 
     * 3. 가입신청 /cafe/manage/applying
     * 
     * 4. 운영카페 /cafe/manage/managing
     * 
     * 5. 탈퇴카페 /cafe/manage/secede
     * 
     * @param authetication
     * @param cafeType
     * @param model
     * @return
     */
    @RequestMapping(value = "/manage/{tab}")
    public String manageMyCafeTab(Authentication authetication, @PathVariable String tab, Model model) {
	// 탭의 조건 마다 카페 리스트를 불러온다.
	// TODO: user_cafe에서 카페 상태라는 컬럼을 추가필요
	switch (tab) {
	case "mycafe":

	    break;
	case "favorite":

	    break;
	case "applying":

	    break;
	case "managing":

	    break;
	case "secede":

	    break;

	default:
	    break;
	}
	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + '_' + Constant.MANAGE_TYPE);
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

}
