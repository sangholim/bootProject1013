package com.pro1.login.web;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pro1.user.vo.UserVO;

@RestController
@CrossOrigin(origins = { "http://localhost:8080", "http://127.0.0.1:8080" })
@RequestMapping("/login")
public class LoginMainAsync {

    /**
     * 로그인시 서비스 체크 로직 doLogin `
     * 
     * @param user
     * @param requeset
     * @return
     */
    @RequestMapping(value = "/isChekcUser.json", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity isChekcUser(@RequestBody UserVO user) {

	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	/*
	 * 0: don't regist user 1: regist user
	 */
	Map<String, Object> resultMap = new ConcurrentHashMap<>();

	return ResponseEntity.status(HttpStatus.OK).body(resultMap);
    }


}
