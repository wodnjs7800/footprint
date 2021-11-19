package com.study.plan;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PlanController {

	@GetMapping("/plan/create")
	public String plan() {
		return "/plan/create";
	}
	@PostMapping("/plan/createplan")
	public String plan(HttpServletRequest request) {
		return "/plan/createplan";
	}
}
