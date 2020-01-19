package com.pro1.cafe.web;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.common.constant.Constant;
import com.pro1.common.utils.FileUtils;
import com.pro1.security.CustomAuthentication;

@Controller
@RequestMapping("/cafe")
@Lazy
public class CafeMainFrame {

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

    /**
     * cafe를 서버에 추가하는 로직
     * 
     * @param authetication
     * @param cafeType
     * @param model
     * @param cafevo
     * @return
     */
    @RequestMapping(value = "/add")
    public String add(Authentication authetication, String cafeType, Model model, @RequestBody CafeForm cafeForm) {

	boolean complete = false;
	String base64Image = cafeForm.getImageDatas().split(",")[1];
	byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
	String filePath = "C:\\Users\\HoYa\\Desktop" + File.separator + Constant.USER_PROFILE
		+ cafeForm.getCafeVO().getIcon();

	// TODO: 사진등록하지 않을떄 기본 프로필 이미지 호출할수있게 처리하기..

	complete = FileUtils.writeAsByte(imageBytes, filePath);

	if (complete) {
	    cafeManager.addCafe((CustomAuthentication) authetication, cafeForm.getCafeVO());
	}

	model.addAttribute(Constant.PAGE_TYPE, Constant.CAFE_TYPE + "/register");
	model.addAttribute("nickName", ((CustomAuthentication) authetication).getAuthUser().getUserNickName());

	return Constant.MAIN;
    }

}
