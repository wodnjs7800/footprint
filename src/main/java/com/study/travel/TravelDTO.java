package com.study.travel;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TravelDTO {
	private int travelno    ;
	private String travelname  ;
	private String id;
	private String zipcode ;
	private String address1;
	private String address2;
	private double lat		    ;
	private double lng     	;
	private String contents    ;
	private String phone       ;
	private int viewcnt     ;
	private String passwd      ;
	private String wdate       ;
	private String local   ;
	private String fname		;
	private MultipartFile fnameMF ;
	private String avg;
	private String yn;
	private int pointcnt;

}