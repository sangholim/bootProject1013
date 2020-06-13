package com.pro1.board.param;

public class BoardSimpleInfoForm {

    private String adminUserNicName;

    private String cafeLevel;

    private String desc = "";

    private String userNickName = "";

    // 카페에 가입시 사용하는 닉네임, 만약 없다면 유저 닉네임으로 사용한다.
    private String cafeNicName = "";

    private long cafeMemberCnt;

    private long cafeUid;

    // 카페 게시판에 필요한 url 정보
    private String cafeBoardUrl;

    // 유저카페게시판 데이터 담는곳
    private UserCafeBoardVO userCafeBoardVO;
    // 카페의 게시판글 수
    private long cafeBoardCnt;
    // 카페 가입된 유저인지 체크
    private boolean isCafeUser;

    public long getCafeUid() {
	return cafeUid;
    }

    public void setCafeUid(long cafeUid) {
	this.cafeUid = cafeUid;
    }

    public String getAdminUserNicName() {
	return adminUserNicName;
    }

    public void setAdminUserNicName(String adminUserNicName) {
	this.adminUserNicName = adminUserNicName;
    }

    public String getCafeLevel() {
	return cafeLevel;
    }

    public void setCafeLevel(String cafeLevel) {
	this.cafeLevel = cafeLevel;
    }

    public long getCafeMemberCnt() {
	return cafeMemberCnt;
    }

    public void setCafeMemberCnt(long cafeMemberCnt) {
	this.cafeMemberCnt = cafeMemberCnt;
    }

    public String getDesc() {
	return desc;
    }

    public void setDesc(String desc) {
	this.desc = desc;
    }

    public String getUserNickName() {
	return userNickName;
    }

    public void setUserNickName(String userNickName) {
	this.userNickName = userNickName;
    }

    public String getCafeBoardUrl() {
	return cafeBoardUrl;
    }

    public void setCafeBoardUrl(String cafeBoardUrl) {
	this.cafeBoardUrl = cafeBoardUrl;
    }

    public UserCafeBoardVO getUserCafeBoardVO() {
	return userCafeBoardVO;
    }

    public void setUserCafeBoardVO(UserCafeBoardVO userCafeBoardVO) {
	this.userCafeBoardVO = userCafeBoardVO;
    }

    public long getCafeBoardCnt() {
	return cafeBoardCnt;
    }

    public void setCafeBoardCnt(long cafeBoardCnt) {
	this.cafeBoardCnt = cafeBoardCnt;
    }

    public boolean isCafeUser() {
	return isCafeUser;
    }

    public void setCafeUser(boolean isCafeUser) {
	this.isCafeUser = isCafeUser;
    }

    public String getCafeNicName() {
	return cafeNicName;
    }

    public void setCafeNicName(String cafeNicName) {
	this.cafeNicName = cafeNicName;
    }

}
