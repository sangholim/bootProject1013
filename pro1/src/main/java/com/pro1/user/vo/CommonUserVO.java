package com.pro1.user.vo;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class CommonUserVO {

    @Id // primary key
    @Column(name = "userUid")
    @GeneratedValue // auto increment
    protected long userUid;

    protected String id;

    protected String pw;

    protected String userName;

    protected String addrEmail;

    protected int active;

    @Transient
    private boolean isExist = true;

    @Transient
    private String responseText;

    public String getResponseText() {
	return responseText;
    }

    public void setResponseText(String responseText) {
	this.responseText = responseText;
    }

    public boolean isExist() {
	return isExist;
    }

    public void setExist(boolean isExist) {
	this.isExist = isExist;
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

}
