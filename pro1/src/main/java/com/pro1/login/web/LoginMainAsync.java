package com.pro1.login.web;


import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
