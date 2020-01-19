package com.pro1.common.utils;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.pro1.login.web.LoginMainFrame;

/**
 * 파일 관련 기능 제공 클레스.
 * 
 * @author HoYa
 *
 */
public class FileUtils {

    private static final Logger logger = LoggerFactory.getLogger(LoginMainFrame.class);

    public static boolean writeAsByte(byte[] binDatas, String filePath) {
	boolean result = true;

	try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(filePath));) {
	    stream.write(binDatas);
	} catch (IOException e) {
	    logger.error("File utils Error While wrting > {}", e.getMessage(), e);
	    result = !result;
	}
	return result;
    }
}
