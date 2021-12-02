package com.study.food;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class FoodDTO {
	private int 	foodno   	;
	private String 	foodname  	;
	private double 	lat		    ;
	private double 	lng     	;
	private String 	contents    ;
	private String 	phone       ;
	private int 	viewcnt     ;
	private String 	passwd      ;
	private String 	wdate       ;
	private String 	local   ;
	private String 	fname		;
	private MultipartFile fnameMF ;
	private String zipcode;
	private String address1;
	private String address2;
	private String id;
	private String avg;
	private String yn;
	private int pointcnt;
}
