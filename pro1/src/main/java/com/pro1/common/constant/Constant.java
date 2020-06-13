package com.pro1.common.constant;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;

public class Constant {

    public static final String PAGE_TYPE = "page";

    public static final String PAGE_SUB_TYPE = "sub_page";

    public static final String INDEX_POS = "index";

    public static final String LOGIN_POS = "login";

    public static final String AUTH_PREFIX = "ROLE_";

    public static final String BOARD_POS = "board";

    public static final String ADMIN_ROLE = "admin";

    public static final String USER_ROLE = "user";

    public static final String FREE_ROLE = "free";

    public static final String BOARD_TYPE = "boardType";

    public static final String CAFE_TYPE = "cafe";

    public static final String AUTH_TYPE = "auth";

    public static final String DIR_ROW = "**";

    public static final String MAIN = "main";

    public static final String CRLF = "\r\n";

    public static final String ADD = "add";

    public static final String PUBLIC_KEY = "publicKey";

    public static final String PRIVATE_KEY = "privateKey";

    public static final String CSRF_TOKEN = "_CSRF_TOKEN_";
    
    public static final String TOKEN_HEADER = "authorization";
    
    public static final String TOKEN_PREFIX = "jwt ";
    
    public static final String USER_PROFILE = "profile_";

    public static final String MAIN_TYPE = "main";

    public static final String MANAGE_TYPE = "manage";

    public static final String REGISTER_TYPE = "register";

    /**
     * 권한 관리 맵
     */
    public static final Map<String, Collection<GrantedAuthority>> GRANTAUTHMAP = new HashMap<>();

}
