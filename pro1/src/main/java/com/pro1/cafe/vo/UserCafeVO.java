package com.pro1.cafe.vo;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.pro1.board.param.UserCafeBoardVO;
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

    @Column(name = "cafeOfficial")
    private int cafeOfficial;

    @Column(name = "userRole")
    private int userRole;

    @Column(name ="cafeNicName")
    private String cafeNicName;
    
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

    //내가 가입한 카페에 대한 게시글은 복수이기 떄문에 oneTomany로 호출
    //하지만 쿼리를 짜는건 생각해봄
    @Transient
    private Collection<UserCafeBoardVO> userCafeBoardList;
    
    public UserCafeVO() {
	// TODO Auto-generated constructor stub
    }
    public UserCafeVO(long userUid, long cafeUid, String cafeLevel) {

	this(userUid, cafeUid, cafeLevel, 0, null, null);
    }
   
    public UserCafeVO(long userUid, long cafeUid, int userRole) {

	this(userUid, cafeUid, userRole, 0, null, null);
    }
    
    /**
     * 내카페 호출시 필요한 params
     * 
     * @param userUid
     * @param cafeUid
     * @param cafeLevel
     * @param cafeFav
     * @param uid
     * @param name
     * @param icon
     */
    public UserCafeVO(long userUid, long cafeUid, String cafeLevel, int cafeFav, long uid, String name, String icon,
	    String url) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafeLevel = cafeLevel;
	this.cafeFav = cafeFav;
	this.cafe = new CafeVO(uid, name, icon, url);
    }
    
    
    public UserCafeVO(long userUid, long cafeUid, int userRole, int cafeFav, long uid, String name, String icon,
	    String url) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.userRole = userRole;
	this.cafeFav = cafeFav;
	this.cafe = new CafeVO(uid, name, icon, url);
    }
    
    
    
    /**
     * 유저가 가입한 카페 호출시 필요한 params
     * @param userUid
     * @param cafeUid
     * @param cafeLevel
     * @param cafeFav
     * @param cafeOfficial
     * @param uid
     * @param name
     * @param icon
     * @param url
     */
    public UserCafeVO(long userUid, long cafeUid, String cafeLevel, int cafeFav, int cafeOfficial, long uid, String name, String icon,
	    String url) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafeLevel = cafeLevel;
	this.cafeFav = cafeFav;
	this.cafeOfficial = cafeOfficial;
	this.cafe = new CafeVO(uid, name, icon, url);
    }

    public UserCafeVO(long userUid, long cafeUid, int userRole, int cafeFav, int cafeOfficial, long uid, String name, String icon,
	    String url) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.userRole = userRole;
	this.cafeFav = cafeFav;
	this.cafeOfficial = cafeOfficial;
	this.cafe = new CafeVO(uid, name, icon, url);
    }

    /**
     * 추천카페 질의시 필요한 params
     * 
     * @param userUid
     * @param cafeUid
     * @param cafeLevel
     * @param cafeFav
     * @param uid
     * @param name
     * @param icon
     */
    public UserCafeVO(long userUid, long cafeUid, long uid, String name, String icon, String url, String desc,
	    int title_mainSort, long memberCnt) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafe = new CafeVO(uid, name, icon, url, desc, title_mainSort, memberCnt);

    }

    /**
     * 추천카페 질의시 필요한 params
     * @param userUid
     * @param cafeUid
     * @param cafeOfficial
     * @param uid
     * @param name
     * @param icon
     * @param url
     * @param desc
     * @param title_mainSort
     * @param memberCnt
     */
    public UserCafeVO(long userUid, long cafeUid, int cafeOfficial, long uid, String name, String icon, String url, String desc,
	    int title_mainSort, long memberCnt) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.cafeOfficial = cafeOfficial;
	this.cafe = new CafeVO(uid, name, icon, url, desc, title_mainSort, memberCnt);

    }

    /**
     * 
     * @param userUid
     * @param cafeUid
     * @param cafeOfficial
     * @param uid
     * @param name
     * @param icon
     * @param url
     * @param desc
     * @param title_mainSort
     * @param title_subSort
     * @param memberCnt
     */
    public UserCafeVO(long userUid, long cafeUid, int cafeOfficial, long uid, String name, String icon, String url, String desc,
	    int title_mainSort, int title_subSort ,int region_mainSort, long memberCnt) {
	this(userUid, cafeUid, cafeOfficial, uid, name, icon, url, desc,title_mainSort, memberCnt); 
	this.cafe.setTitle_subSort(title_subSort);
	this.cafe.setRegion_mainSort(region_mainSort);
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
    
    public UserCafeVO(long userUid, long cafeUid, int userRole, int cafeFav, CafeVO cafe, UserVO user) {
	this.userUid = userUid;
	this.cafeUid = cafeUid;
	this.userRole = userRole;
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

    public int getCafeOfficial() {
        return cafeOfficial;
    }

    public void setCafeOfficial(int cafeOfficial) {
        this.cafeOfficial = cafeOfficial;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public String getCafeNicName() {
        return cafeNicName;
    }

    public void setCafeNicName(String cafeNicName) {
        this.cafeNicName = cafeNicName;
    }
    
    public Collection<UserCafeBoardVO> getUserCafeBoardList() {
        return userCafeBoardList;
    }
    public void setUserCafeBoardList(Collection<UserCafeBoardVO> userCafeBoardList) {
        this.userCafeBoardList = userCafeBoardList;
    }
    
    @Override
    public String toString() {
        return "UserCafeVO{" +
                "userUid=" + userUid +
                ", cafeUid=" + cafeUid +
                ", cafeLevel='" + cafeLevel + '\'' +
                ", cafeFav=" + cafeFav +
                ", cafeOfficial=" + cafeOfficial +
                ", userRole=" + userRole +
                ", user=" + user +
                ", cafe=" + cafe +
                '}';
    }
}
