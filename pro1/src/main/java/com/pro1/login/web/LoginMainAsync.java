package com.pro1.login.web;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pro1.common.constant.ResponseText;
import com.pro1.user.param.AddrForm;
import com.pro1.user.param._Post;
import com.pro1.user.sesrvice.UserService;
import com.pro1.user.vo.CommonUserVO;

@RestController
@CrossOrigin(origins = { "http://localhost:8080", "http://127.0.0.1:8080" })
@RequestMapping("/login")
public class LoginMainAsync {

    private static final Logger logger = Logger.getLogger(LoginMainAsync.class.getName());

    private final String post_form = "http://biz.epost.go.kr/KpostPortal/openapi2?regkey=%s&target=%s&countPerPage=%d&currentPage=%d&query=%s";
    
    private static final ObjectMapper MAPPER = new ObjectMapper();
    
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
    public CommonUserVO checkExistUser(@RequestBody CommonUserVO userVO) {
	userVO.setValid(true);
	userVO.setResponseText(ResponseText.USABLE_ID);

	if (userService.existUser(userVO.getId())) {
	    userVO.setValid(false);
	    userVO.setResponseText(ResponseText.EXIST_ID);
	}

	return userVO;
    }

    /**
     * Email 인증
     * 
     * @param userVO
     * @return
     */
    @RequestMapping(value = "/authEmail.json", produces = "application/json")
    public CommonUserVO authEmail(@RequestBody CommonUserVO userVO) {

	userVO.setValid(true);
	userVO.setResponseText(ResponseText.AUTH_EMAIL_COMPLETE);

	// 인증을 받았는지 확인
	String host = "smtp.naver.com";
	final String username = "bbqbabo"; // 네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
	final String password = "1eoeo3wndeo1"; // 네이버 이메일 비밀번호를 입력해주세요.
	int port = 465; // 포트번호 , ssl
	int keyCode = RandomUtils.nextInt(1000, 9999);

	// 메일 내용
	String from = "bbqbabo@naver.com"; // 보내는 사람의 메일주소를 입력해주세요.
	String recipient = userVO.getAddrEmail(); // 받는 사람의 메일주소를 입력해주세요.
	String subject = "Test 회원가입 메일 인증 코드가 발송되었습니다."; // 메일 제목 입력해주세요.
	StringBuilder body = new StringBuilder();
	body.append("인증 코드는 ").append(keyCode).append("입니다.");
	Properties props = System.getProperties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", port);
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.ssl.trust", host);

	Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	    String un = username;
	    String pw = password;

	    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		return new javax.mail.PasswordAuthentication(un, pw);
	    }

	});

	// email 전송과정 확인시 주석 풀기
	// session.setDebug(true);

	try {
	    Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
	    mimeMessage.setFrom(new InternetAddress(from)); // 발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자셋팅
	    mimeMessage.setSubject(subject); // 제목셋팅
	    mimeMessage.setText(body.toString()); // 내용셋팅
	    Transport.send(mimeMessage); // javax.mail.Transport.send() 이용
	    userVO.setKeyCode(keyCode);
	} catch (Exception e) {
	    logger.warning("Error Send Auth Mail check > " + e.getCause());
	    userVO.setValid(false);
	    userVO.setResponseText(ResponseText.AUTH_EMAIL_FAIL);
	}

	return userVO;
    }

    /**
     * 우편 ,주소 api 데이터 가져오기
     * 
     * request param
     * 
     * regkey 사용신청을 통해 받은 인증 key 스트링(30자리) target string(필수) postNew 우편번호 통합검색을 위해
     * 지정해야 하는 필수 값 입니다. query 조회하고자 하는 내용의 검색 질의어입니다.
     * 도로명, 건물명, 읍/면/동(지번), 사서함, 우편번호 등 검색하고자 하는
     *
     * query
     * 주소 검색어 입력
     * - 도로명 + 건물번호 (예) 도움5로 19
     * - 건물명 (예) 우정사업본부
     * - 읍/면/동/리 + 지번 (예) 어진동 307-19
     * - 사서함 + 사서함번호 (예) 광화문우체국사서함 45
     * 
     * countPerPage 한번에 조회할 결과 건수입니다.(페이지당 조회 건수)
     * - 기본값(미입력 시) : 10
     * - 최대 입력 가능 값 : 50
     * 
     * currentPage 조회할 페이지 번호입니다.
     * - 기본값(미입력 시) : 1
     * 
     * 
     * response Param 
     * totalCount 검색결과 전체 건수 
     * totalPage 검색결과 전체 페이지수 
     * countPerPage 페이지당 조회건수 
     * currentPage 현재 조회 페이지 
     * postcd 우편번호 
     * address 주소(도로명) 
     * addrjibun 주소(지번)
     * 
     * @param request
     * @return
     */
    @RequestMapping(value = "/findAddr.json", produces = "application/json")
    public AddrForm findAddrList(@RequestBody AddrForm addrForm) {
	// request
	String regKey = "0816e1f0684a07ff51572676736488";
	String target = "postNew";
	// post null is new Data
	_Post post = addrForm.getPost();
	int countPerPage = (post == null)? 10: post.getPageinfo().getCountPerPage();
	int currentPage = (post == null)? 1 : post.getPageinfo().getCurrentPage();
	String query = addrForm.getAddrData();
	InputStream httpIs = null;
	try {
	    URL url = new URL(String.format(post_form, regKey, target, countPerPage, currentPage, query));
	    HttpURLConnection connectHttp = (HttpURLConnection) url.openConnection();
	    connectHttp.setRequestMethod("GET");
	    httpIs = new BufferedInputStream(connectHttp.getInputStream(), 4096);
	   
	    // Jaxb 를 통해 xml string to pojo로 바인드
	    JAXBContext xml = JAXBContext.newInstance(_Post.class);
	    Unmarshaller unmarshaller = xml.createUnmarshaller();
	    _Post postData = (_Post) unmarshaller.unmarshal(httpIs);
	    addrForm.setPost(postData);
	    
	} catch (Exception e) {
	    logger.warning("Error getting post data > " + e.getMessage());
	}
	return addrForm;
    }
}
