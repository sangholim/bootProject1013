package com.pro1.common.vo;

import java.io.Serializable;

import org.springframework.security.core.GrantedAuthority;

public class GrantedAuthorityVO implements GrantedAuthority, Serializable {

    /**
     * 직렬호 ㅏ고유값
     */
    private static final long serialVersionUID = -6969651036660098561L;
    private String authority;

    public GrantedAuthorityVO() {
	// TODO Auto-generated constructor stub
    }

    public GrantedAuthorityVO(String authority) {
	this.authority = authority;
    }

    @Override
    public String getAuthority() {
	// TODO Auto-generated method stub
	return this.authority;
    }

    public void setAuthority(String authority) {
	this.authority = authority;
    }

}
