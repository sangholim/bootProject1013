package com.pro1.security;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import com.pro1.user.sesrvice.UserService;
import com.pro1.user.vo.AuthUserVO;

/**
 * 인증 구성 로직
 * 
 * @author HoYa
 *
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService userService;

    // TODO password 인증 로직 서비스 구현
    // 1차 검증에서 먼저 인증 시도 [권한 체크 먼저 할듯] , /login/doLogin 에서 시행하면 처음 인증을 거친후에 권한을 저장하고
    // , 해당 권한으로 url 접근을 받음
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

	// 만약 authentication 한번 인증정보를 가지고 있다면 검증로직을 태우지 않음.
	if (authentication instanceof CustomAuthentication) {
	    return authentication;
	}
	// 만약 로그인되면 권한들이 들어 있을것..
	String id = authentication.getName();
	String pw = (String) authentication.getCredentials();
	Collection<GrantedAuthority> grantedAuthList = null;
	AuthUserVO authUser = null;
	try {
	    authUser = userService.isChekcUser(id);
	    // 버번 구현 로직
	    // String hashedPassword = passwordEncoder.encodePassword(password,
	    // saltSource.getSalt(user));
	    grantedAuthList = authUser.getAuthorities();
	} catch (Exception e) {

	    return null;
	}

	// return new UsernamePasswordAuthenticationToken(id, authUser.getPw(),
	// grantedAuthList);
	return new CustomAuthentication(grantedAuthList, authUser);

    }

    @Override
    public boolean supports(Class<?> authentication) {
	return true;
    }

}
