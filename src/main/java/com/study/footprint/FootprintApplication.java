package com.study.footprint;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.study.*"})
public class FootprintApplication {

	public static void main(String[] args) {
		SpringApplication.run(FootprintApplication.class, args);
	}

}
