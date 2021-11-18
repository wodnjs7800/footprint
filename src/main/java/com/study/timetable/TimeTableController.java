package com.study.timetable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimeTableController {
	
	@Autowired
	@Qualifier("com.study.timetable.TimeTableServiceImpl")
	private TimeTableService service;
	
	@GetMapping("/timetable/createtimetable")
	public String create() {
		return "/timetable/createtimetable";
	}
	
	@RequestMapping("/timetable/list")
	public String map(HttpServletRequest request) {
		// 페이지 관련
		int nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 10;
		
		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
//		int total = service.total(map);
		
//		List<TimeTableDTO> list = service.list(id);
		
//		String paging = Utility.paging(total, nowPage, recordPerPage, null, null);
		
//		request.setAttribute("list", list);
//		request.setAttribute("nowPage", nowPage);
//		request.setAttribute("paging", paging);
		
		return "/timetable/list";
	}
	
	@RequestMapping("/timetable/detailtimetable")
	public String update() {
		return "/timetable/detailtimetable";
	}
}
