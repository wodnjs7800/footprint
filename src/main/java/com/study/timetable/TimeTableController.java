package com.study.timetable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.bookmark.BookmarkDTO;
import com.study.bookmark.BookmarkService;
import com.study.utility.Utility;

@Controller
public class TimeTableController {
	
	@Autowired
	@Qualifier("com.study.timetable.TimeTableServiceImpl")
	private TimeTableService service;
	
	@Autowired
	@Qualifier("com.study.bookmark.BookmarkServiceImpl")
	private BookmarkService bservice;
	
	
	@GetMapping("/timetable/create")
	public String create() {
		return "/timetable/create";
	}
	
	@PostMapping("/timetable/create")
	public String create(TimeTableDTO dto, HttpServletRequest request) {
		
		if(service.create(dto) == 1) {	
			return "redirect:list";
		}
		
		return "/error";
	}
	
	@GetMapping("/timetable/read")
	public String read(int ttid, String id, String date, Model model) {

		TimeTableDTO dto = service.read(ttid);
		
		Map map = new HashMap();
		map.put("id",id);
		map.put("date",date);
		
		List<BookmarkDTO>bdto = bservice.list(map);
		
		model.addAttribute("bdto",bdto);
		model.addAttribute("dto",dto);
		model.addAttribute("date",date);
		return "/timetable/read";
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
		
		List<TimeTableDTO> list = service.list(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, null, null);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		return "/timetable/list";
	}

}
