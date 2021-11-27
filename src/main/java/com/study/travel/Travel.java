package com.study.travel;

import java.io.File;

public class Travel {
	/** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 3;

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
            path = "C:/AIstudy/deploy/footprint/travel/storage/";
            System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
            path = "/home/ubuntu/deploy/footprint/travel/storage/";
        }
        return path;
    }

}
