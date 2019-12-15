package com.pro1.cafe.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.pro1.cafe.dao.CafeDAO;

public class CafeManager {
    // 제목 분류 max index 값들
    private int[] maxTitleSort = { 10, 8, 6, 11, 11, 16, 12, 11, 22, 12, 9, 9, 8, 8, 7, 10, 12, 10, 14, 12, 8, 10, 5,
	    10, 4 };
    // 지역 분류 max index 값들
    private int[] maxRegionSort = { 23, 24, 7, 11, 5, 8, 3, 5, 11, 8, 10, 15, 13, 9, 14, 2, 0, 11, 17, 9, 7 };

    private static final Logger logger = LoggerFactory.getLogger(CafeManager.class);

    @Autowired
    private CafeDAO cafeDAO;

    public void getCafeList(Model model) {

	try {
	    model.addAttribute("cafeList", cafeDAO.getCafeList());
	} catch (Exception e) {

	    logger.warn("Error Connection DataBase : {}", e.getMessage(), e);
	}

    }
}
