package com.pro1.user.vo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.pro1.cafe.vo.UserCafeVO;

@MappedSuperclass
public class CommonUserVO {

    @Id // primary key
    @Column(name = "userUid")
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    protected long userUid;

    protected String id;

    protected String pw;

    protected String userName;

    /**
     * 인증하고자 하는 주소
     */
    protected String addrEmail;

    protected int active;
    /**
     * 유저 토큰
     */
    protected String user_token;

    @Transient
    private boolean isValid = true;

    @Transient
    private String responseText;

    /**
     * 인증 키코드
     */
    @Transient
    private int keyCode = -1;

    // 로그인시 유저 닉네임
    private String userNickName;

    @OneToMany
    @JoinTable(name="user")
    List<UserCafeVO> userCafeList = new ArrayList<>();

    public List<UserCafeVO> getUserCafeList() {
	return userCafeList;
    }

    public void setUserCafeList(List<UserCafeVO> userCafeList) {
	this.userCafeList = userCafeList;
    }

    public int getKeyCode() {
	return keyCode;
    }

    public void setKeyCode(int keyCode) {
	this.keyCode = keyCode;
    }

    public String getResponseText() {
	return responseText;
    }

    public void setResponseText(String responseText) {
	this.responseText = responseText;
    }

    public boolean isValid() {
	return isValid;
    }

    public void setValid(boolean isValid) {
	this.isValid = isValid;
    }

    public long getUserUid() {
	return userUid;
    }

    public void setUserUid(long userUid) {
	this.userUid = userUid;
    }

    public String getId() {
	return id;
    }

    public void setId(String id) {
	this.id = id;
    }

    public String getPw() {
	return pw;
    }

    public void setPw(String pw) {
	this.pw = pw;
    }

    public String getUserName() {
	return userName;
    }

    public void setUserName(String userName) {
	this.userName = userName;
    }

    public String getAddrEmail() {
	return addrEmail;
    }

    public void setAddrEmail(String addrEmail) {
	this.addrEmail = addrEmail;
    }

    public int getActive() {
	return active;
    }

    public void setActive(int active) {
	this.active = active;
    }

    public String getUser_token() {
	return user_token;
    }

    public String getUserNickName() {
	return userNickName;
    }

    public void setUserNickName(String userNickName) {
	this.userNickName = userNickName;
    }

    public void setUser_token(String user_token) {
	this.user_token = user_token;
    }

}
