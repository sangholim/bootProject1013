package com.pro1.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;

import com.pro1.board.service.UserCafeBoardService;

@Controller
@Lazy
public class UserCafeBoardMainFrame {

    @Autowired
    private UserCafeBoardService userCafeBoardService;

    public UserCafeBoardMainFrame() {

    }
}
