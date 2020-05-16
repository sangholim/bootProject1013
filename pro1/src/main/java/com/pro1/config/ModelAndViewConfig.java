package com.pro1.config;

import java.nio.charset.Charset;
import java.util.List;
import java.util.TimeZone;

import javax.annotation.PostConstruct;
import javax.servlet.Filter;
import javax.servlet.ServletContext;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.context.request.async.TimeoutCallableProcessingInterceptor;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pro1.config.comp._Config;
import com.pro1.config.comp.security._Security;
import com.pro1.security.interceptor.UserCheckInterceptor;

@EnableWebMvc
@Configuration
public class ModelAndViewConfig implements WebMvcConfigurer {

    @Autowired
    private ConfigManagement configManagement;

    @Autowired
    private UserCheckInterceptor interceptor;

    private final String ENC_TYPE = "enctype";

    private final String CACHE_TYPE = "cachetype";

    private final ServletContext servletContext;

    public ModelAndViewConfig(ServletContext servletContext) {
      this.servletContext = servletContext;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
	// TODO Auto-generated method stub
	WebMvcConfigurer.super.addInterceptors(registry);
	registry.addInterceptor(interceptor).addPathPatterns("/**").excludePathPatterns("**.json");
    }

    /**
     * web 비동기 처리 설정
     */
    @Override
    public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
	// TODO Auto-generated method stub
	configurer.setDefaultTimeout(10000);
	configurer.registerCallableInterceptors(timeoutInterceptor());
    }

    @Bean
    public TimeoutCallableProcessingInterceptor timeoutInterceptor() {
	return new TimeoutCallableProcessingInterceptor();
    }

    /**
     * Cors 정책 설정 Cross Origin Resource Sharing [ 다른 서버 자원 호출시에 정책 설정]
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
	// TODO Auto-generated method stub
	registry.addMapping("/**").allowedOrigins("http://127.0.0.1:8080");
    }

    /**
     * Spring boot에서 정적 리소스 리로딩 처리
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
	registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
	registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
	registry.addResourceHandler("/store/**").addResourceLocations("file:///C:/Local_repo/pro1/store/");
    }

    /**
     * jsp 경로 , 및 파일 이름 설정
     */
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {

	InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	resolver.setPrefix("/WEB-INF/views/");
	resolver.setSuffix(".jsp");
	resolver.setViewClass(JstlView.class);
	registry.viewResolver(resolver);
    }

    /**
     * 프론트엔드?? 인코딩 타입 설정
     * 
     * @return
     */
    private Filter characterEncodingFilter() {
	CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
	characterEncodingFilter.setForceEncoding(true);
	characterEncodingFilter.setEncoding("UTF-8");
	return characterEncodingFilter;
    }

    @Bean
    public FilterRegistrationBean<Filter> filterRegistrationBean() {
	FilterRegistrationBean<Filter> registrationBean = new FilterRegistrationBean<>(characterEncodingFilter());
	registrationBean.setName("CharacterEncodingFilter");
	registrationBean.addUrlPatterns("/*");
	registrationBean.setOrder(Ordered.HIGHEST_PRECEDENCE + 1);
	return registrationBean;
    }

    /**
     * Http Header 데이터 parse 할때 필요한 설정
     */
    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	converters.add(new StringHttpMessageConverter(Charset.forName("UTF-8")));
	MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
	converter.setObjectMapper(
		new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false));
	converters.add(converter);
    }

    /**
     * 부가 설정정보를 web project올리기전에 세팅. 1. timezone setting 2. encType request
     * attribute로 등록 나머지 구현할거 잇으면 작업.
     */
    @PostConstruct
    public void additionalConfig() {

	_Config config = configManagement.getConfigData();
	_Security security = config.getSecurity();
	String timezone = config.getTimezone();
	TimeZone.setDefault(TimeZone.getTimeZone(timezone));
	// this application scope 프로그램 종료될떄까지 데이터가 저장댐
	servletContext.setAttribute(ENC_TYPE, security.getEncType());
	try {
	    servletContext.setAttribute(CACHE_TYPE, "v=" + RandomStringUtils.random(5));
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

}
