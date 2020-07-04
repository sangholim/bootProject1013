package com.pro1.cafe.vo;

import java.util.List;

import com.pro1.common.vo.SearchForm;

public class CafeManageForm extends SearchForm {

    private long selectMyCafeListCnt = 0;

    private long myCafeListCnt = 0;

    private long myCafeFavListCnt = 0;

    private long myCafeManageListCount = 0;

    private String cateGory = "mycafe";

    private String url = "";

    private int cafeFav = 0;

    // 유저가 가입한 카페 리스트
    private List<UserCafeVO> userCafeList;

    public long getMyCafeListCnt() {
	return myCafeListCnt;
    }

    public void setMyCafeListCnt(long myCafeListCnt) {
	this.myCafeListCnt = myCafeListCnt;
    }

    public long getMyCafeFavListCnt() {
	return myCafeFavListCnt;
    }

    public void setMyCafeFavListCnt(long myCafeFavListCnt) {
	this.myCafeFavListCnt = myCafeFavListCnt;
    }

    public long getMyCafeManageListCount() {
	return myCafeManageListCount;
    }

    public void setMyCafeManageListCount(long myCafeManageListCount) {
	this.myCafeManageListCount = myCafeManageListCount;
    }

    public List<UserCafeVO> getUserCafeList() {
	return userCafeList;
    }

    public void setUserCafeList(List<UserCafeVO> userCafeList) {
	this.userCafeList = userCafeList;
    }

    public String getCateGory() {
	return cateGory;
    }

    public void setCateGory(String cateGory) {
	this.cateGory = cateGory;
    }

    public long getSelectMyCafeListCnt() {
	return selectMyCafeListCnt;
    }

    public void setSelectMyCafeListCnt(long selectMyCafeListCnt) {
	this.selectMyCafeListCnt = selectMyCafeListCnt;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public int getCafeFav() {
	return cafeFav;
    }

    public void setCafeFav(int cafeFav) {
	this.cafeFav = cafeFav;
    }

}
