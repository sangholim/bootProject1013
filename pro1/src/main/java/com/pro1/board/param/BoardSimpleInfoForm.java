package com.pro1.board.param;

public class BoardSimpleInfoForm {

    private String adminUserNicName;

    private String cafeLevel;

    private String desc = "";
    
    private String userNickName = "";

    private long cafeMemberCnt;

    private long cafeUid;
    
    // 카페 게시판에 필요한 url 정보
    private String cafeBoardUrl;

    // 유저카페게시판 데이터 담는곳
    private UserCafeBoardVO userCafeBoardVO;
    
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

    @Override
    public String toString() {
	return "{" + "\"adminUserNicName\"='" + adminUserNicName + '\'' + ", \"cafeLevel\"='" + cafeLevel + '\''
		+ ", \"desc\"='" + desc + '\'' + ", \"userNickName\"='" + userNickName + '\'' + ", \"cafeMemberCnt\"="
		+ cafeMemberCnt + ", \"cafeUid\"=" + cafeUid + '}';
    }
}
