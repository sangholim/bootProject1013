package com.pro1.common.constant;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;

public class Constant {

    public static final String PAGE_TYPE = "page";

    public static final String INDEX_POS = "index";

    public static final String LOGIN_POS = "login";

    public static final String AUTH_PREFIX = "ROLE_";

    public static final String BOARD_POS = "board";

    public static final String ADMIN_ROLE = "admin";

    public static final String USER_ROLE = "user";

    public static final String FREE_ROLE = "free";

    public static final String BOARD_TYPE = "boardType";

    /**
     * 권한 관리 맵
     */
    public static final Map<String, Collection<GrantedAuthority>> GRANTAUTHMAP = new HashMap<>();

}
