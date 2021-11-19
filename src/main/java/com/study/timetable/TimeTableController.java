package com.study.timetable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.utility.Utility;

@Controller
public class TimeTableController {
	
	@Autowired
	@Qualifier("com.study.timetable.TimeTableServiceImpl")
	private TimeTableService service;
	
	@GetMapping("/timetable/create")
	public String create() {
		return "/timetable/create";
	}
	
	@PostMapping("/timetable/create")
	public String create(TimeTableDTO dto) {
		
		if(service.create(dto) == 1) {
			return "/timetable/list";
		}
		
		return "/";
	}
	
	@RequestMapping("/timetable/detail")
	public String update(HttpServletRequest request) {
		String name = request.getParameter("name");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		
		return "/timetable/detail";
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
		
		Map map = new HashMap();
		
		String id = "a1";
		map.put("id", id);
		map.put("eno", eno);
		map.put("sno", sno);
		
		int total = service.total(map);
		
		System.out.println(total);
		
		List<TimeTableDTO> list = service.list(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, null, null);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		return "/timetable/list";
	}

}
