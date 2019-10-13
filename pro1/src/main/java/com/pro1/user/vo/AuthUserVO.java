package com.pro1.user.vo;

import java.io.Serializable;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.pro1.common.constant.Constant;

/**
 * @Transient > db column과 맵핑을 하지 않음?
 * 
 * @author HoYa
 *
 */
@Entity(name = "authUser")
@Table(name = "USER")
public class AuthUserVO extends CommonUserVO implements UserDetails, Serializable {

    /**
     * 직렬화시 고유 번호
     */
    private static final long serialVersionUID = 3264178015575713747L;
    // 계정 만료 여부
    @Transient
    private boolean isAccountNonExpired;
    // 계정 잠김 여부
    @Transient
    private boolean isAccountNonLocked;
    // 사용자의 자격 증명 (암호)이 만료되었는지
    @Transient
    private boolean isCredentialsNonExpired;
    // 해당 계정 권한 레벨
    private String grantAuthLevel;

    public String getGrantAuthLevel() {
	return grantAuthLevel;
    }

    public void setGrantAuthLevel(String grantAuthLevel) {
	this.grantAuthLevel = grantAuthLevel;
    }

    @Override
    public Collection<GrantedAuthority> getAuthorities() {

	return Constant.GRANTAUTHMAP.get(grantAuthLevel);
    }

    @Override
    public String getPassword() {
	return this.pw;
    }

    @Override
    public String getUsername() {
	return this.userName;
    }

    @Override
    public boolean isAccountNonExpired() {
	// 계정 만료시간 옵션
	return isAccountNonExpired;
    }

    @Override
    public boolean isAccountNonLocked() {
	// 계정 잠금?
	return isAccountNonLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
	return isCredentialsNonExpired;
    }

    @Override
    public boolean isEnabled() {
	return (active == 0) ? false : true;
    }

}
