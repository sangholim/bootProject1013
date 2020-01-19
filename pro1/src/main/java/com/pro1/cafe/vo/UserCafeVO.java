package com.pro1.cafe.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

/**
 * User , Cafe 간의 관계 테이블
 * 
 * @author HoYa
 *
 */
@Entity
@Table(name = "user_cafe")
@IdClass(UserCafeId.class)
public class UserCafeVO implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -5008558653692869369L;

    @Id
    @Column(name = "userUid")
    private long userUid;

    @Id
    @Column(name = "cafeUid")
    private long cafeUid;

    private String cafeLevel;

    public UserCafeVO() {
	// TODO Auto-generated constructor stub
    }

    public UserCafeVO(long userUid, long cafeUid, String cafeLevel) {

	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafeLevel = cafeLevel;
    }

    public UserCafeVO(long userUid, String cafeLevel) {
	this(userUid, -1l, cafeLevel);
    }

    public long getUserUid() {
	return userUid;
    }

    public void setUserUid(long userUid) {
	this.userUid = userUid;
    }

    public long getCafeUid() {
	return cafeUid;
    }

    public void setCafeUid(long cafeUid) {
	this.cafeUid = cafeUid;
    }

    public String getCafeLevel() {
	return cafeLevel;
    }

    public void setCafeLevel(String cafeLevel) {
	this.cafeLevel = cafeLevel;
    }

}
