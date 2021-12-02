package com.study.footprint;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.study.food.Food;
import com.study.member.Member;
import com.study.travel.Travel;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Windows: path = "f:/AIstudy/deploy/shopping/contents/storage";
        // ▶ file:///f:/AIstudy/deploy/shopping/contents/storage
        // Ubuntu: path = "/home/ubuntu/deploy/shopping/contents/storage";
        // ▶ file:////home/ubuntu/deploy/shopping/contents/storage
        // JSP 인식되는 경로: http://localhost:8000/contents/storage";
        registry.addResourceHandler("/travel/storage/**").addResourceLocations("file:///" + Travel.getUploadDir());
        // registry.addResourceHandler("/attachfile/storage/**").addResourceLocations("file:///" + Attachfile.getUploadDir());
        //registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///" + Member.getUploadDir());
    	registry.addResourceHandler("/food/storage/**").addResourceLocations("file:///" + Food.getUploadDir());
    	registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///" + Member.getUploadDir());
    }
}

