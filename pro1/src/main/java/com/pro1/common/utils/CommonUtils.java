package com.pro1.common.utils;

import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class CommonUtils {

    public static final SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yy-MM-dd HH:mm:ss");

    static {
	// GMT 세팅
	simpleDateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
    }

}
