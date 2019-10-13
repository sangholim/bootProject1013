package com.pro1.config;

import org.springframework.core.annotation.Order;
import org.springframework.core.io.Resource;

import com.pro1.config.comp._Config;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.GenericApplicationContext;

/**
 * custom bean을 생성시 가장 우선으로 bean 생성.
 * 
 * @author HoYa
 *
 */
@Configuration
@Order(1)
public class ConfigManagement {

    private final String CONFIG_PATH = "classpath:/static/conf/config.xml";

    private GenericApplicationContext applicationContext;

    private JAXBContext jaxbContext;

    private _Config configData;

    public ConfigManagement(GenericApplicationContext applicationContext) {
	this.applicationContext = applicationContext;
	Resource resource = this.applicationContext.getResource(CONFIG_PATH);
	// jaxb 를 통해서 xml 파일을 pojo 데이터로 바인딩.
	try {
	    jaxbContext = JAXBContext.newInstance(_Config.class);
	    Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
	    File file = resource.getFile();
	    configData = (_Config) jaxbUnmarshaller.unmarshal(file);

	} catch (Exception e) {
	    e.printStackTrace();
	    throw new RuntimeException("Failed loading config data");
	}

    }

    public _Config getConfigData() {
	return configData;
    }

    public GenericApplicationContext getApplicationContext() {
	return applicationContext;
    }

    // TODO 설정값 변경 감지하기.

}
