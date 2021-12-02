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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.cart.CartDTO;
import com.study.plan.PlanDTO;
import com.study.utility.Utility;

@Controller
public class TimeTableController {

	@Autowired
	@Qualifier("com.study.timetable.TimeTableServiceImpl")
	private TimeTableService service;
	
	@GetMapping("/timetable/create")
	public String create(HttpSession session, String id, HttpServletRequest request) {
		// 페이지 관련
		if(id == null) {
			id = (String) session.getAttribute("id");
		}
		
		request.setAttribute("id", id);
		
		return "/timetable/create";
	}

	@GetMapping("/timetable/delete")
	public String delete(int ttid) {

		if(service.pdelete(ttid) == 1) {
		
		if (service.delete(ttid) == 1) {
			return "redirect:list";
		}
		}

		return "/error";
	}

	@PostMapping("/timetable/create")
	public String create(TimeTableDTO dto,  HttpServletRequest request) {
		
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
		request.setAttribute("day", day);
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
	
	@PostMapping("/timetable/update")
	public String update(@RequestParam Map<String, String> map, String id, RedirectAttributes redirect, HttpSession session) {
		
		Map m = new HashMap();
		if(id == null) {
			id = (String) session.getAttribute("id");
		}
		int ttid = Integer.parseInt(map.get("ttid"));
		int cartno  = Integer.parseInt(map.get("cartno"));;
		float dist = Float.parseFloat(map.get("dist"));
		String movetime = map.get("movetime");
		String ddate = map.get("ddate");
		String starttime = map.get("starttime");
		String endtime = map.get("endtime");
		String pd = map.get("planid");
		int days = Integer.parseInt(map.get("days"));
		String startdate = map.get("startdate");
		String enddate = map.get("enddate");
		String day = map.get("day");
		
		System.out.println(enddate);
		
		if(pd != "1000000000") {
			int planid = Integer.parseInt(map.get("planid")); 
			double bdist = Double.parseDouble(map.get("bdist"));
			String bmtime = map.get("bmovetime");
			m.put("planid", planid);
			m.put("bdist", bdist);
			m.put("bmtime", bmtime);
			service.bupdate(m);
		}
		
		m.put("ttid",ttid);
		m.put("cartno",cartno);
		m.put("dist",dist);
		m.put("movetime",movetime);
		m.put("ddate",ddate);
		m.put("starttime",starttime);
		m.put("endtime",endtime);
		
		if(service.update(m) == true) {
			redirect.addAttribute("ttid",ttid);
			redirect.addAttribute("days",days);
			redirect.addAttribute("id", id);
			redirect.addAttribute("startdate",startdate);
			redirect.addAttribute("enddate", enddate);
			redirect.addAttribute("day", day);
			
			return "redirect:/timetable/update";
		} else {
			return "/error";
		}	
	}
	
	
	@GetMapping("/timetable/update")
	public String update(HttpServletRequest request) {
		System.out.println("h1");
		
		TimeTableDTO dto = service.read(Integer.parseInt(request.getParameter("ttid")));
		List<CartDTO> tlist = service.tlist(request.getParameter("id"));
		List<CartDTO> flist = service.flist(request.getParameter("id"));
		List<PlanDTO> plist = service.plist(Integer.parseInt(request.getParameter("ttid")));
		String day = request.getParameter("day");
		String day1 = day;
		String[] list = day1.split(",");
		
		System.out.println(day);
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("tlist", tlist);
		request.setAttribute("plist", plist);
		request.setAttribute("day", day);
		request.setAttribute("days", Integer.parseInt(request.getParameter("days")));
		request.setAttribute("startdate", request.getParameter("startdate"));
		request.setAttribute("enddate", request.getParameter("enddate"));
		

		return "/timetable/update";
	}

}
