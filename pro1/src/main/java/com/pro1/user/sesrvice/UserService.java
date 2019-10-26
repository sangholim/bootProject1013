package com.pro1.user.sesrvice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.AuthUserVO;
import com.pro1.user.vo.UserVO;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public List<UserVO> selectUserList() {

	List<UserVO> userList = null;

	try {
	    userList = userDAO.selectUserList();
	} catch (Exception e) {
	    // TODO: handle exception
	}

	return userList;
    }

    public boolean existUser(String id) {

	AuthUserVO resultVO = null;
	try {
	    resultVO = getUser(id);
	} catch (Exception e) {
	    e.getStackTrace();
	}

	return (resultVO == null) ? false : true;
    }

    public AuthUserVO getUser(String id) throws Exception {

	AuthUserVO resultVO = userDAO.existUser(id);

	return resultVO;
    }

    public void deleteUser(UserVO user) {
	try {
	    userDAO.deleteUser(user);
	} catch (Exception e) {
	    // TODO: handle exception
	}
    }

}
