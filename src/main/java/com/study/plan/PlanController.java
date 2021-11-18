package com.study.plan;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PlanController {

	
	@PostMapping("/plan/createplan")
	public String plan() {
		return "/plan/createplan";
	}
}
