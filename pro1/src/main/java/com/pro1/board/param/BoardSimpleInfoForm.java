package com.pro1.board.param;


public class BoardSimpleInfoForm {

    private String adminUserNicName;

    private String cafeLevel;

    private long cafeMemberCnt;

    private long cafeUid;

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
}
