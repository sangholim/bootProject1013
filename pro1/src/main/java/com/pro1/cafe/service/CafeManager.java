package com.pro1.cafe.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.pro1.cafe.dao.CafeDAO;
import com.pro1.cafe.vo.CafeForm;
import com.pro1.cafe.vo.CafeVO;
import com.pro1.cafe.vo.UserCafeVO;
import com.pro1.common.constant.Constant;
import com.pro1.security.CustomAuthentication;

public class CafeManager {
    // 제목 분류 max index 값들
    private int[] maxTitleSort = { 10, 8, 6, 11, 11, 16, 12, 11, 22, 12, 9, 9, 8, 8, 7, 10, 12, 10, 14, 12, 8, 10, 5,
	    10, 4 };
    // 지역 분류 max index 값들
    private int[] maxRegionSort = { 23, 24, 7, 11, 5, 8, 3, 5, 11, 8, 10, 15, 13, 9, 14, 2, 0, 11, 17, 9, 7 };

    private static final Logger logger = LoggerFactory.getLogger(CafeManager.class);

    @Autowired
    private CafeDAO cafeDAO;

    public void getCafeMapByUserUid(CafeForm cafeForm, long userUid, String sub_type) throws Exception{
	cafeDAO.getCafeMapByUserUid(userUid, sub_type, cafeForm);
    }

    public void getCafeList(Model model) {

	try {
	    model.addAttribute("cafeList", cafeDAO.getCafeList());
	} catch (Exception e) {

	    logger.warn("Error Connection DataBase : {}", e.getMessage(), e);
	}

    }

    /**
     * 카페 추가 로직
     * 
     * @param authetication
     * @param cafeVO
     */
    public void addCafe(CustomAuthentication authetication, CafeVO cafeVO) {
	try {
	    UserCafeVO userCafeVO = new UserCafeVO(authetication.getUid(), Constant.ADMIN_ROLE);
	    cafeDAO.addCafe(cafeVO, userCafeVO);
	} catch (Exception e) {
	    logger.error("Insert Cafe , user_cafe Error > {}", e.getMessage(), e);
	}
    }

	/**
	 *
	 * @author ued123
	 * @brief 카페 접속시 자신의 카페 이름(카페이름은 unique)을 가지고 자신의 cafe 정보를 조회
	 * */
    public CafeVO getCafeInfo(String cafeUrl) {

	try {
	    CafeVO cafeVO = cafeDAO.getCafeUrlinfo(cafeUrl);
	    return cafeVO;

	} catch (Exception e) {
	    logger.error("getCafeInfo error > {}", e.getMessage(), e);
	    return null;
	}
    }
}
