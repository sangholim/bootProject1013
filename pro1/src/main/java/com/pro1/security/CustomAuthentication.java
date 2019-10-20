package com.pro1.security;

import java.util.Collection;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import com.pro1.common.constant.Constant;
import com.pro1.user.vo.AuthUserVO;

public class CustomAuthentication extends AbstractAuthenticationToken {

    private static final long serialVersionUID = -1949976839306453197L;

    private AuthUserVO authUser;

    private long uid;

    public CustomAuthentication(Collection<? extends GrantedAuthority> authorities, AuthUserVO authUser) {
	super(authorities);
	this.authUser = authUser;
	this.uid = authUser.getUserUid();
    }

    @Override
    public String getName() {
	return authUser.getId();
    }

    public long getUid() {
	return uid;
    }

    @Override
    public Object getCredentials() {
	return authUser.getPassword();
    }

    @Override
    public Object getPrincipal() {
	return authUser;
    }

    @Override
    public void setDetails(Object details) {

	details += Constant.CRLF + Constant.AUTH_TYPE + ':' + authUser.getGrantAuthLevel();
    }

}
