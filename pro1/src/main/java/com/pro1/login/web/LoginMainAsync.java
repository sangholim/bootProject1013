package com.pro1.login.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.pro1.common.constant.ResponseText;
import com.pro1.user.sesrvice.UserService;
import com.pro1.user.vo.CommonUserVO;

@RestController
@CrossOrigin(origins = { "http://localhost:8080", "http://127.0.0.1:8080" })
@RequestMapping("/login")
public class LoginMainAsync {

    @Autowired
    private UserService userService;

    /**
     * 로그인시 서비스 체크 로직 doLogin `
     * 
     * @param user
     * @param requeset
     * @return
     */
    @RequestMapping(value = "/checkExistUser.json", produces = "application/json")
    @ResponseStatus(code = HttpStatus.OK)
    public CommonUserVO checkExistUser(@RequestBody CommonUserVO userVO) {
	userVO.setExist(false);
	userVO.setResponseText(ResponseText.USABLE_ID);

	if (userService.existUser(userVO.getId())) {
	    userVO.setExist(true);
	    userVO.setResponseText(ResponseText.EXIST_ID);
	}

	return userVO;
    }
}
