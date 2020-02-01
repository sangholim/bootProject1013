package com.pro1.security;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.pro1.common.constant.Constant;

/**
 * 차후 로그인 후에 redirect 결정해야함..
 * 
 * @author HoYa
 *
 */
@Component
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private static final Logger logger = LoggerFactory.getLogger(AuthSuccessHandler.class);

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Autowired
    private JWTUtils jwtUtils;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	    Authentication authentication) throws ServletException, IOException {

	// sendRedirect 이용시에는 헤더를 작성하여 경로로 이동 , 그냥 마음대로 보내는건 불법
	logger.info(authentication.getName() + " is passed. go to redirect page /");
	response.setStatus(HttpServletResponse.SC_OK);
	response.setContentType("image/png;charset=UTF-8");
	String auth_token = "";
	try (PrintWriter out = response.getWriter();) {
	    // 인증 성공후 token 생성 > 웹 취약점 방어 , csrf 방어 가능 , 다수 서버시 session 유지 가능.
	    // token data 전달
	    // 1. session에 저장
	    //sauth_token = Constant.TOKEN_PREFIX + jwtUtils.createJWT(request, authentication.getPrincipal());
	    response.setContentType("text/html; charset=UTF-8");
	    out.println("<script>window.location.href='/';</script>");
	} catch (Exception e) {
	    logger.error("Error Create Web Token > {}", e.getMessage(), e);
	    redirectStrategy.sendRedirect(request, response, "/");
	}
    }

}
