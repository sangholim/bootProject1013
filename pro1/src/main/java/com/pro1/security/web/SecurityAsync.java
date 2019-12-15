package com.pro1.security.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SecurityAsync {

    private static final Logger logger = LoggerFactory.getLogger(SecurityAsync.class);

    @RequestMapping(value = "/auth_check", method = RequestMethod.POST)
    public ResponseEntity auth_check(HttpServletRequest request) {
	// authentication 버리고 인증 헤더 보고 처리
	String jwt = request.getHeader("TOKEN_HEADER");
	// jwt 없을때 부정 응답
	if (jwt == null) {
	    logger.info("JWT TOKEN IS EMPTY {}", jwt);
	    return new ResponseEntity<String>("AUTH INFO IS EMPTY", HttpStatus.FORBIDDEN);
	}

	return null;
    }
}
