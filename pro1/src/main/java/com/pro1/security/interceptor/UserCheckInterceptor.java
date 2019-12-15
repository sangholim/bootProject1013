package com.pro1.security.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pro1.common.constant.Constant;
import com.pro1.security.JWTUtils;

/**
 * 인증 정보 , JWT 가 있는지 확인하고 필요시 동기화하는 로직
 * 
 * @author HoYa
 *
 */
@Component
public class UserCheckInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(UserCheckInterceptor.class);
    
    @Autowired
    private JWTUtils jwtUtils;
    
    /**
     * JWT 용도 
     * 1.로그인후 모든 데이터는 헤더가 붙는다.
     * [현재 문제점 : form tag 에서는 붙지 않기 떄문에 문제가 일어남  > 모든 것을 json으로 할지 결정해야함] 
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
	boolean valid = true;
	HttpServletRequest httpRequest = ((HttpServletRequest) request);
	String jwtHeader = httpRequest.getHeader(Constant.TOKEN_HEADER);

	/*
	 * 1. session에 auth는 잇지만 , jwt 데이터가 없을때 > auth 데이터 파기. 2. session에 auth는 없지만 ,
	 * jwt 데이터가 존재시 > auth 데이터 생성
	 * 
	 */
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	try {
	    if ((auth == null || auth instanceof AnonymousAuthenticationToken) && jwtHeader != null) {
		// 헤더 데이터 피싱후 session에 추가
		jwtUtils.validateJWT(jwtHeader);
	    }
	} catch (Exception e) {
	    logger.error("Error Processing Validate JWT : {}", e.getMessage(), e);
	}

	return valid;
    }

}
