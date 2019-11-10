package com.pro1.user.sesrvice;

import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.pro1.security.AuthSuccessHandler;
import com.pro1.security.CustomAuthenticationProvider;
import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.AuthUserVO;
import com.pro1.user.vo.UserVO;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;

    private static final Logger logger = Logger.getLogger(UserService.class.getName());

    @Autowired
    private CustomAuthenticationProvider customAuthenticationProvider;

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

    /**
     * return 값 : 결과 msg
     * 
     * @param uservo
     * @return
     */
    public void addUser(UserVO uservo, HttpServletResponse response) {

	try {
	    long createDate= System.currentTimeMillis();
	    uservo.setCreateDate(createDate);
	    uservo.setModifyDate(createDate);
	    uservo.setActive(1);
	    userDAO.insertUser(uservo);
	    //인증  추가
	    Authentication authentication = new UsernamePasswordAuthenticationToken(uservo.getId(), uservo.getPw());
	    SecurityContextHolder.getContext()
		    .setAuthentication(customAuthenticationProvider.authenticate(authentication));
	    response.sendRedirect("../");
	} catch (Exception e) {
	    logger.warning("Error Occuring addUser > user: " + uservo.toString() + ", msg:" + e.getCause());
	    try (PrintWriter out = response.getWriter();) {
		    response.setContentType("text/html; charset=UTF-8");
		    out.println("<script>alert('회원가입시 문제가 발생하였습니다.'); history.go(-1);</script>");
		    out.flush();
	    } catch (Exception e2) {
		logger.warning("Error Occuring addUser > response Msg: " + e2.getCause());
	    }

	}

    }

}
