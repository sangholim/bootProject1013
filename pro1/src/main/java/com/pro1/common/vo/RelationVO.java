package com.pro1.common.vo;

import com.pro1.cafe.vo.CafeVO;
import com.pro1.user.vo.UserVO;

/**
 * 다중 테이블 JOIN을 Mapping VO 처리하는 클래스
 * 
 * @author HoYa
 *
 */
public class RelationVO {

    private CafeVO cafe;

    private UserVO user;

    public CafeVO getCafe() {
	return cafe;
    }

    public void setCafe(CafeVO cafe) {
	this.cafe = cafe;
    }

    public UserVO getUser() {
	return user;
    }

    public void setUser(UserVO user) {
	this.user = user;
    }

}
