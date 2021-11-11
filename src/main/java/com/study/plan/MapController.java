package com.study.plan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MapController {
	
	@GetMapping("/timetable")
	public String map() {
		
		return "/timetable";
	}
	
	@GetMapping("/createplan")
	public String plan() {
		return "/createplan";
	}
}
