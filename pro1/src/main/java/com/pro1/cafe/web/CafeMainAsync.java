package com.pro1.cafe.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pro1.cafe.service.CafeManager;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.common.constant.Constant;
import com.pro1.common.utils.FileUtils;
import com.pro1.config.ConfigManagement;
import com.pro1.config.comp._Config;
import com.pro1.login.web.LoginMainFrame;
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

}
