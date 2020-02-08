package com.pro1.cafe.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UI 에서 bind되는 변수 모음
 * 
 * @author HoYa
 *
 */
public class CafeForm {

    private CafeVO cafeVO;

    private String imageDatas;

    private List<UserCafeVO> userCafeList;

    private Map<Integer, List<UserCafeVO>> recommend_CafeMap;

    public CafeVO getCafeVO() {
	return cafeVO;
    }

    public void setCafeVO(CafeVO cafeVO) {
	this.cafeVO = cafeVO;
    }

    public String getImageDatas() {
	return imageDatas;
    }

    public void setImageDatas(String imageDatas) {
	this.imageDatas = imageDatas;
    }

    public List<UserCafeVO> getUserCafeList() {
	return userCafeList;
    }

    public void setUserCafeList(List<UserCafeVO> userCafeList) {
	this.userCafeList = userCafeList;
    }

    public Map<Integer, List<UserCafeVO>> getRecommend_CafeMap() {
	return recommend_CafeMap;
    }

    public void setRecommend_CafeMap(Map<Integer, List<UserCafeVO>> recommend_CafeMap) {
	this.recommend_CafeMap = recommend_CafeMap;
    }

}
