package com.pro1.user.sesrvice;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.pro1.common.constant.Constant;
import com.pro1.security.CustomAuthenticationProvider;
import com.pro1.user.dao.UserDAO;
import com.pro1.user.vo.AuthUserVO;
import com.pro1.user.vo.CommonUserVO;
import com.pro1.user.vo.UserVO;

@Service
public class UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDAO userDAO;

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

    public boolean existUser(String id, Object pw) {

	AuthUserVO resultVO = null;
	boolean isExist = false;
	try {
	    resultVO = (AuthUserVO) getUser(id, pw, AuthUserVO.class);
	    isExist = (resultVO == null) ? false : true;
	} catch (Exception e) {
	    // db에 질의시 일어난 Exception 문제들은 전부다 이미 존재하는 아이디로 처리해서 user생성을 막자
	    isExist = true;
	}

	return isExist;
    }

    /**
     * 계정 정보 변경시필요한 변수 추가
     * 
     * @param auth
     * @param model
     * @param response
     */
    public void getUserForUpdate(Authentication auth, Model model, HttpServletResponse response) {
	try {
	    model.addAttribute(Constant.USER_ROLE, getUser(auth.getName(), auth.getCredentials(), UserVO.class));
	} catch (Exception e) {
	    try (PrintWriter out = response.getWriter();) {
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('프로필 변경 페이지에서 문제가 발생하였습니다.'); window.location.href='../';</script>");
	    } catch (Exception e2) {
		logger.error("Error Occuring update > user: " + auth.getName() + ", msg:" + e.getCause());
	    }
	}
    }

    /**
     * 인증용 유저 , 유저 정보 자체 구분하여 가져오기
     * 
     * @param id
     * @return
     * @throws Exception
     */
    public CommonUserVO getUser(String id, Object pw, Class<?> userType) throws Exception {

	CommonUserVO resultVO = null;
	try {
	    resultVO = userDAO.existUser(id, pw, userType);

	} catch (Exception e) {
	    logger.error("Error GetUser : {}", e.getMessage(), e);
	}
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
    public void addUser(UserVO uservo, HttpServletRequest request, HttpServletResponse response) {

	PrintWriter out = null;
	try {
	    out = response.getWriter();
	    long createDate = System.currentTimeMillis();
	    uservo.setCreateDate(createDate);
	    uservo.setModifyDate(createDate);
	    uservo.setActive(1);
	    userDAO.insertUser(uservo);
	    // 인증 추가
	    Authentication authentication = new UsernamePasswordAuthenticationToken(uservo.getId(), uservo.getPw());
	    SecurityContextHolder.getContext()
		    .setAuthentication(customAuthenticationProvider.authenticate(authentication));
	    response.setContentType("text/html; charset=UTF-8");

	    //String auth_token = Constant.TOKEN_PREFIX + jwtUtils.createJWT(request, authentication.getPrincipal());

	    out.println("<script>alert('정상적으로 회원가입이 되었습니다.'); window.location.href='/';</script>");
	} catch (Exception e) {
	    logger.error("Error Occuring addUser > user: " + uservo.toString() + ", msg:" + e.getCause());
	    response.setContentType("text/html; charset=UTF-8");
	    out.println("<script>alert('회원가입시 문제가 발생하였습니다.'); history.go(-1);</script>");
	} finally {
	    IOUtils.closeQuietly(out);
	}

    }

    public void doUpdateUser(UserVO uservo, HttpServletResponse response) {
	PrintWriter out = null;
	try {
	    out = response.getWriter();
	    uservo.setModifyDate(System.currentTimeMillis());
	    uservo.setActive(1);
	    userDAO.updateUser(uservo);
	    // update후 인증 추가
	    // user 변경후 인증 데이터 재갱신 > 비밀번호 변경될 가능성이 크므로..
	    Authentication authentication = new UsernamePasswordAuthenticationToken(uservo.getId(), uservo.getPw());
	    SecurityContextHolder.getContext()
		    .setAuthentication(customAuthenticationProvider.authenticate(authentication));
	    response.setContentType("text/html; charset=UTF-8");
	    out.println("<script>alert('정상적으로 프로필이 변경 되었습니다.'); window.location.href='../';</script>");
	} catch (Exception e) {
	    logger.error("Error Occuring addUser > user: " + uservo.toString() + ", msg:" + e.getCause());
	    response.setContentType("text/html; charset=UTF-8");
	    out.println("<script>alert('프로필 변경시 문제가 발생하였습니다.'); history.go(-1);</script>");
	} finally {
	    IOUtils.closeQuietly(out);
	}
    }

    public void updateUserToken(AuthUserVO userVO) {
	try {
	    userDAO.updateUser(userVO);
	} catch (Exception e) {
	    // TODO: handle exception
	}
    }
}
