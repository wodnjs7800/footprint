package com.study.food;

import java.io.File;

public class Food {

	/** 페이지당 출력할 레코드 갯수 */
    public static int RECORD_PER_PAGE = 3;

    // Windows, VMWare, AWS cloud 절대 경로 설정
    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("\\")) {
<<<<<<< HEAD:src/main/java/com/study/food/Food.java
            path = "D:/AIstudy/deploy/footprint/food/storage/";
=======
            path = "c:/AIstudy/deploy/footprint/member/storage/";
>>>>>>> b_member:src/main/java/com/study/member/Member.java
            System.out.println("Windows 10: " + path);
            
        } else {
            // System.out.println("Linux");
<<<<<<< HEAD:src/main/java/com/study/food/Food.java
            path = "/home/ubuntu/deploy/footprint/food/storage/";
=======
            path = "/home/ubuntu/deploy/footprint/contents/storage/";
>>>>>>> b_member:src/main/java/com/study/member/Member.java
        }
        
        return path;
    }

}
