package com.pro1.cafe.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.pro1.user.vo.UserVO;

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

    private long userUid;

    private long cafeUid;

    @Column(name = "cafeLevel")
    private String cafeLevel;

    @Column(name = "cafeFav")
    private int cafeFav;

    @Id
    @ManyToOne(optional = false)
    @JoinColumn(name = "userUid", insertable = false, updatable = false)
    // @JoinColumn(name = "userUid")
    private UserVO user;

    @Id
    @ManyToOne(optional = false)
    @JoinColumn(name = "cafeUid", insertable = false, updatable = false)
    // @JoinColumn(name = "cafeUid")
    private CafeVO cafe;

    public UserCafeVO() {
	// TODO Auto-generated constructor stub
    }

    public UserCafeVO(long userUid, long cafeUid, String cafeLevel) {

	this(userUid, cafeUid, cafeLevel, 0, null, null);
    }

    public UserCafeVO(long userUid, long cafeUid, String cafeLevel, int cafeFav, CafeVO cafe) {
	this(userUid, cafeUid, cafeLevel, 0, cafe, null);
    }

    public UserCafeVO(long userUid, long cafeUid, String cafeLevel, int cafeFav, CafeVO cafe, UserVO user) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafeLevel = cafeLevel;
	this.cafeFav = cafeFav;
	this.cafe = cafe;
	this.user = user;
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

    public int getCafeFav() {
	return cafeFav;
    }

    public void setCafeFav(int cafeFav) {
	this.cafeFav = cafeFav;
    }

    public UserVO getUser() {
	return user;
    }

    public void setUser(UserVO user) {
	this.user = user;
    }

    public CafeVO getCafe() {
	return cafe;
    }

    public void setCafe(CafeVO cafe) {
	this.cafe = cafe;
    }

    public static long getSerialversionuid() {
	return serialVersionUID;
    }

}
