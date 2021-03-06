package com.pro1.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.pro1.common.constant.Constant;
import com.pro1.common.vo.GrantedAuthorityVO;
import com.pro1.security.AuthSuccessHandler;
import com.pro1.security.CustomAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private AuthSuccessHandler authSuccessHandler;

    @Autowired
    private CustomAuthenticationProvider authProvider;

    public SecurityConfig() {
	Constant.GRANTAUTHMAP.put("admin",
		Arrays.asList(new GrantedAuthorityVO(Constant.AUTH_PREFIX + Constant.ADMIN_ROLE),
			new GrantedAuthorityVO(Constant.AUTH_PREFIX + Constant.USER_ROLE)));
	Constant.GRANTAUTHMAP.put("user",
		Arrays.asList(new GrantedAuthorityVO(Constant.AUTH_PREFIX + Constant.USER_ROLE)));
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	auth.authenticationProvider(authProvider);
	// auth.userDetailsService(service);
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
	// 기본 접근 허용 경로
	web.ignoring().antMatchers("/css/" + Constant.DIR_ROW, "/img/" + Constant.DIR_ROW, "/js/" + Constant.DIR_ROW);
    }

    @Override
    public void setAuthenticationConfiguration(AuthenticationConfiguration authenticationConfiguration) {
	super.setAuthenticationConfiguration(authenticationConfiguration);
    }

    /**
     * spring security 기본 설정
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
	// security 기본 인증화면 사용 안함

	/**
	 * 사용자 인증이 된 요청에 대해서만 요청을 허용한다. 
	 * 사용자는 폼기반 로그인으로 인증 할 수 있습니다. 
	 * 사용자는 HTTP기반 인증으로 인증할수 있습니다.
	 *
	 * @author ued123
	 * @see 일부 iframe을 사용하는 요청에서 연결이 거부되어 해당 iframe에서 요청 부분 예외함./board/boardCenter
	 * 게시글 불러오는 iframe 요청 컨트롤러에서 연결거부 발생.
	 * */
	http.csrf().disable().authorizeRequests()
		.antMatchers("/", "/index/**", "/img/**", "/login", "/login/addUser",
			"/login/register", "/login/*.json","/board/boardCenter")
		.permitAll().and().authorizeRequests()
		.antMatchers('/' + Constant.CAFE_TYPE + '/' + Constant.DIR_ROW, "/login/update/","/board/**")
		.hasAnyAuthority(Constant.AUTH_PREFIX + Constant.USER_ROLE, Constant.AUTH_PREFIX + Constant.ADMIN_ROLE)
		.anyRequest().authenticated().and().formLogin().loginPage("/login/doLogin").usernameParameter("id")
		.passwordParameter("pw").successHandler(authSuccessHandler).failureUrl("/error").permitAll();

	/**
	 * @author ued123
	 * @brief 보안취약점으로 동일도메인에서 iframe을 못쓰도록 deny 되어있어 동일 도메인에서 iframe을 사용할 수 있도록
	 *        X-Frame-Options 권한을 추가한다.
	 */
	http.headers().frameOptions().sameOrigin();
    }

}
