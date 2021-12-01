package com.study.timetable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.bookmark.BookmarkDTO;
import com.study.plan.PlanDTO;
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

	@GetMapping("/timetable/delete")
	public String delete(int ttid) {

		if (service.delete(ttid) == 1) {
			return "redirect:list";
		}

		return "/error";
	}

	@PostMapping("/timetable/create")
	public String create(TimeTableDTO dto, HttpServletRequest request) {

		if (service.create(dto) == 1) {
			return "redirect:list";
		}

		return "/error";
	}

	@GetMapping("/timetable/read")
	public String read( HttpServletRequest request) {
		
		int ttid = Integer.parseInt(request.getParameter("ttid"));
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		int days = Integer.parseInt(request.getParameter("days"));
		String day = request.getParameter("day");
		String enddate = request.getParameter("enddate");
		String startdate = request.getParameter("startdate");
		
		String[] list = day.split(",");
		
		TimeTableDTO dto = service.read(ttid);
		List<PlanDTO> plist = service.plist(ttid);

		request.setAttribute("plist",plist);
		request.setAttribute("dto", dto);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("days", days);
		request.setAttribute("enddate", enddate);
		request.setAttribute("startdate", startdate);
		request.setAttribute("list", list);

		return "/timetable/read";
	}
	
	@RequestMapping("/timetable/list")
	public String list(String id, HttpServletRequest request, HttpSession session) {
		// 페이지 관련
		if(id == null) {
			id = (String) session.getAttribute("id");
		}
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 10;

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();

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

	@GetMapping(value = "/timetable/timecheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<PlanDTO> timeCheck(HttpServletRequest request) {
		
		int ttid = Integer.parseInt(request.getParameter("ttid"));
		
		List<PlanDTO> list = service.plist(ttid);
		
		return list;
	}
	
	@GetMapping("/timetable/update")
	public String update(HttpServletRequest request) {

		TimeTableDTO dto = service.read(Integer.parseInt(request.getParameter("ttid")));
		List<BookmarkDTO> tlist = service.tlist(request.getParameter("id"));
		List<BookmarkDTO> flist = service.flist(request.getParameter("id"));
		List<PlanDTO> plist = service.plist(Integer.parseInt(request.getParameter("ttid")));
		String day = request.getParameter("day");
		String[] list = day.split(",");		
		System.out.println(list);
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("tlist", tlist);
		request.setAttribute("plist", plist);
		request.setAttribute("days", Integer.parseInt(request.getParameter("days")));
		request.setAttribute("startdate", request.getAttribute("startdate"));
		request.setAttribute("startdate", request.getAttribute("enddate"));
		

		return "/timetable/update";
	}

}
