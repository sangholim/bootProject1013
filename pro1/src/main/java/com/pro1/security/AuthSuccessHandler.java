package com.pro1.security;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

/**
 * 차후 로그인 후에 redirect 결정해야함..
 * 
 * @author HoYa
 *
 */
@Component
public class AuthSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private static final Logger logger = Logger.getLogger(AuthSuccessHandler.class.getName());

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	    Authentication authentication) throws ServletException, IOException {
	
	// sendRedirect 이용시에는 헤더를 작성하여 경로로 이동 , 그냥 마음대로 보내는건 불법
	logger.info(authentication.getName() + "is passed. go to redirect page /");
	response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
	redirectStrategy.sendRedirect(request, response, "/");
    }

}
