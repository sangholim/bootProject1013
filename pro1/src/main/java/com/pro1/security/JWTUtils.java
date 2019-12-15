package com.pro1.security;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JWTUtils {

    private final String secretKey = "Hoya";

    private final String type = "type";

    private final String alg = "alg";

    public String createJWT(HttpServletRequest request, Object userVO) throws Exception {

	SignatureAlgorithm signAlogrithm = SignatureAlgorithm.HS256;
	Date expireDate = new Date();
	// 1시간 기준
	expireDate.setTime(expireDate.getTime() + (1000 * 60 * 1));

	byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(secretKey);
	Key signingKey = new SecretKeySpec(apiKeySecretBytes, signAlogrithm.getJcaName());

	// JWT headerMap 추가
	Map<String, Object> headerMap = new HashMap<>();
	headerMap.put(type, "JWT");
	headerMap.put(alg, "HS256");

	Map<String, Object> userMap = new HashMap<>();
	userMap.put("userInfo", new ObjectMapper().writeValueAsString(userVO));

	JwtBuilder builder = Jwts.builder().setHeader(headerMap).setClaims(userMap).setExpiration(expireDate)
		.signWith(signAlogrithm, signingKey);

	return builder.compact();

    }

    /**
     * JSON WEB TOKEN VALIDATION
     * 
     * @throws Exception
     */
    public void validateJWT(String jwtHeader) throws Exception {

    }
}
