package com.pro1.cafe.vo;

import java.util.List;

import com.pro1.common.vo.SearchForm;

/**
 * UI 에서 bind되는 변수 모음
 * 
 * @author HoYa
 *
 */
public class CafeForm extends SearchForm {

    private CafeVO cafeVO = new CafeVO();

    private String imageDatas;

    // 유저가 가입한 카페 리스트
    private List<UserCafeVO> userCafeList;

    // 유저가 가입한 카페 게시글리스트
    private List<UserCafeVO> userCafeBoardList;

    // 유저가 가입하지 않은 카페 리스트
    private List<UserCafeVO> showCafeList;

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

    public List<UserCafeVO> getShowCafeList() {
	return showCafeList;
    }

    public void setShowCafeList(List<UserCafeVO> showCafeList) {
	this.showCafeList = showCafeList;
    }

    public List<UserCafeVO> getUserCafeBoardList() {
	return userCafeBoardList;
    }

    public void setUserCafeBoardList(List<UserCafeVO> userCafeBoardList) {
	this.userCafeBoardList = userCafeBoardList;
    }

}
