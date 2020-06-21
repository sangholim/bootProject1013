package com.pro1.cafe.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeManageForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.common.constant.Constant;
import com.pro1.common.utils.FileUtils;
import com.pro1.config.ConfigManagement;
import com.pro1.config.comp._Config;
import com.pro1.security.CustomAuthentication;

@RestController
@RequestMapping("/cafe")
@Lazy
public class CafeMainAsync {
    @Autowired
    private ConfigManagement configManage;

    @Autowired
    private CafeManager cafeManager;

    private static final Logger logger = LoggerFactory.getLogger(CafeMainAsync.class);

    /**
     * cafe를 서버에 추가하는 로직
     * 
     * @param authetication
     * @param cafeType
     * @param model
     * @param cafevo
     * @return
     */
    @RequestMapping(value = "/add.json")
    public Map<String, Object> add(Authentication authetication, String cafeType, Model model,
	    @RequestBody CafeForm cafeForm, HttpServletRequest request, HttpServletResponse response) {
	Map<String, Object> resultMap = new HashMap<>();
	String code = "code";
	String result = "result";
	resultMap.put(code, 500);
	resultMap.put(result, "카페 생성중 문제 발생!");
	CafeVO cafeVO = cafeForm.getCafeVO();

	_Config config = configManage.getConfigData();
	try {
	    String base64Image = cafeForm.getImageDatas().split(",")[1];
	    byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
	    String filePath = config.getStore() + File.separator + Constant.CAFE_TYPE + File.separator
		    + cafeVO.getName();
	    Files.createDirectories(Paths.get(filePath));
	    filePath += File.separator + cafeVO.getIcon();
	    cafeVO.setIcon(filePath);
	    FileUtils.writeAsByte(imageBytes, filePath);

	} catch (NullPointerException e) {
	    // NotFound Image Data 저장하지 않고 그냥 진행
	    logger.error("ERROR IMAGE DATA NOT FOUND use Default Img: {}", e.getMessage());
	} catch (IOException ie) {
	    logger.error("ERROR SAVE IMAGE CUZ: {}", ie.getMessage());
	    return resultMap;
	}

	try {
	    cafeManager.addCafe((CustomAuthentication) authetication, cafeVO);
	} catch (Exception e) {
	    logger.error("ERROR SAVE CAFE CUZ: {}", e.getMessage());
	}
	resultMap.put(code, 200);
	resultMap.put(result, "정상적으로 카페가 생성되었습니다.");

	return resultMap;
    }

    /**
     * cafeTab 클릭시 원하는 리스트 불러오기
     * 
     * @param authetication
     * @param cafeType
     * @param cafeForm
     * @return
     */
    @RequestMapping(value = "/{sub_type}/list.json")
    public Map<String, Object> getCafeList(Authentication authetication, String cafeType,
	    @RequestBody CafeForm cafeForm, @PathVariable String sub_type) {

	Map<String, Object> resultMap = new HashMap<>();
	String code = "code";
	String result = "result";

	// ui에서 페이지 간격은 8 로 정한다.
	CustomAuthentication userAuth = (CustomAuthentication) authetication;
	resultMap.put(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	resultMap.put(Constant.PAGE_SUB_TYPE, sub_type);
	resultMap.put("nickName", userAuth.getAuthUser().getUserNickName());

	try {
	    cafeManager.getCafeMapByUserUid(cafeForm, userAuth.getUid(), sub_type);
	    resultMap.put("cafeForm", cafeForm);
	    resultMap.put(code, 200);
	    resultMap.put(result, "추천카페  불러오는중 문제 발생!");
	} catch (Exception e) {
	    // 앞으로는 오류 페이지로 넘길수 있게 처리
	    logger.info("Error getting CafeList > {}", e.getMessage(), e.getCause());
	    resultMap.put(code, 500);
	    resultMap.put(result, "추천카페  불러오는중 문제 발생!");
	}

	return resultMap;
    }

    /**
     * 선택된 카페 업데이트
     * 
     * @param authetication
     * @param cafeType
     * @param cafeForm
     * @return
     */
    @RequestMapping(value = "/update.json")
    public Map<String, Object> updateCafe(Authentication authetication, String cafeType,
	    @RequestBody CafeForm cafeForm) {

	Map<String, Object> resultMap = new HashMap<>();
	String code = "code";
	String result = "result";
	resultMap.put(code, 500);
	resultMap.put(result, "추천카페  불러오는중 문제 발생!");

	try {
	    // ui에서 페이지 간격은 8 로 정한다.
	    CustomAuthentication userAuth = (CustomAuthentication) authetication;
	    resultMap.put(Constant.PAGE_TYPE, Constant.CAFE_TYPE);
	    resultMap.put("nickName", userAuth.getAuthUser().getUserNickName());

	    if (cafeManager.updateCafe(userAuth.getAuthUser().getUserUid(), cafeForm) == -1) {
		throw new Exception("Fail to Update UserCafeVO");
	    }
	    resultMap.put(code, 200);
	    resultMap.put(result, "추천카페  불러오는중 문제 발생!");
	} catch (Exception e) {
	    // 앞으로는 오류 페이지로 넘길수 있게 처리
	    logger.info("Error getting CafeList > {}", e.getMessage(), e.getCause());
	}

	return resultMap;
    }

    /**
     * 카페 관리에서 페이지 호출
     * 
     * @param authetication
     * @param cafeType
     * @param cafeForm
     * @return
     */
    @RequestMapping(value = "/manage/list.json")
    public Map<String, Object> getCafeManageList(Authentication authetication,
	    @RequestBody CafeManageForm cafeManageForm) {
	/*
	 * 1. 내카페 - 내가 가입한 카페 모드 들고옴 (userUid로 긁어옴) 2. 즐겨찾기 - 즐겨 찾는 카페 들고옴 (user_cafe >
	 * cafe_fav) 3. 신청중 - 가입대기중인 카페 들고옴 (userRole=-1) 4. 관리중 - 관리자 권한인 카페를 들고옴
	 * (userRole=7) 5. 탈퇴 - 탈퇴한 카페를 들고옴 (userRole=-2)
	 */

	Map<String, Object> resultMap = new HashMap<>();
	String code = "code";
	String result = "result";
	resultMap.put(code, 500);
	resultMap.put(result, "추천카페  불러오는중 문제 발생!");

	try {

	    CustomAuthentication customAuthentication = (CustomAuthentication) authetication;
	    cafeManager.getCafeListMyCafe(cafeManageForm, customAuthentication.getUid(), cafeManageForm.getCateGory());
	    // 클릭한 카페탭에 따라 카페리스트 호출
	    resultMap.put(code, 200);
	    resultMap.put("cafeManageForm", cafeManageForm);

	} catch (Exception e) {
	    // TODO: handle exception
	    logger.warn("ERROR Getting CafeList > MSG: {}", e.getMessage(), e);
	}
	return resultMap;
    }

}
