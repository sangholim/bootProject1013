package com.pro1.security;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.pro1.common.constant.Constant;
import com.pro1.login.web.LoginMainFrame;

public class URLFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(LoginMainFrame.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	    throws IOException, ServletException {
	String jwt = ((HttpServletRequest) request).getHeader(Constant.TOKEN_HEADER);
	// jwt 유효성 검사
	if (jwt != null) {
	    logger.debug("JWT : {}", jwt);
	}

    }

	@Override
	public void destroy() {

	}

}
