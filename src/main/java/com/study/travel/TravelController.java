package com.study.travel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.utility.Utility;

@Controller
public class TravelController {
	@Autowired
	@Qualifier("com.study.travel.TravelServiceImpl")
	private TravelService service;
	
	@PostMapping("/travel/create")
	public String create(TravelDTO dto, HttpServletRequest request){
		//String upDir = new ClassPathResource("/static/pstorage").getFile().getAbsolutePath();
		
		String upDir = Travel.getUploadDir();

		String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		int size = (int) dto.getFnameMF().getSize();

		if (size > 0) {
			dto.setFname(fname);
		} else {
			dto.setFname("default.jpg");
		}

		if (service.create(dto) > 0) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@GetMapping("/travel/create")
	public String create() {
		return "/travel/create";
	}
	
	@RequestMapping("/travel/list")
	public String list(HttpServletRequest request) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String array = Utility.checkNull(request.getParameter("array"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 12;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("array", array);

		int total = service.total(map);

		List<TravelDTO> list = service.list(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("array", array);

		return "/travel/list";

	}
	
	@GetMapping("/travel/read")
	public String read(int travelno, Model model, HttpSession session, HttpServletRequest request) {
		
		String id = (String) session.getAttribute("id");
		id="dlgjs";
				
		if(id==null) {
			return "/member/login";
		}
		double avg = service.avg(travelno);
		service.viewcnt(travelno);

		TravelDTO dto = service.read(travelno);

		String contents = dto.getContents().replaceAll("\r\n", "<br>");

		dto.setContents(contents);

		model.addAttribute("dto", dto);
		model.addAttribute("id", id);
		model.addAttribute("avg", avg);

		/* 댓글 관련 시작 */
        int nPage = 1;
        if (request.getParameter("nPage") != null) {
                nPage = Integer.parseInt(request.getParameter("nPage"));
        }
        int recordPerPage = 3;

        int sno = ((nPage - 1) * recordPerPage) + 1;
        int eno = nPage * recordPerPage;

        Map map = new HashMap();
        map.put("sno", sno);
        map.put("eno", eno);
        map.put("nPage", nPage);

        model.addAllAttributes(map);

        /* 댓글 처리 끝 */

		return "/travel/read";
	}
	
	@GetMapping("/travel/update")
	public String update(int travelno, Model model) {

		model.addAttribute("dto", service.read(travelno));

		return "/travel/update";
	}

	@PostMapping("/travel/update")
	public String update(TravelDTO dto, String oldfile, HttpServletRequest request) {
		String basePath = Travel.getUploadDir();
		

		
		int size = (int)dto.getFnameMF().getSize();
		if(size > 0) {
			if(!oldfile.equals("default.jpg")) {
				Utility.deleteFile(basePath, oldfile);
			}
			dto.setFname(Utility.saveFileSpring(dto.getFnameMF(), basePath));
		}
		
		Map map = new HashMap();
		map.put("travelno", dto.getTravelno());
		map.put("passwd", dto.getPasswd());
		
		int pcnt = service.passwd(map);

		int cnt = 0;
		if (pcnt == 1) {

			cnt = service.update(dto);
		}

		if (pcnt != 1) {
			return "/travel/passwdError";
		} else if (cnt == 1) {
			return "redirect:/travel/list";
		} else {
			return "/travel/error";
		}
	}
	
	@GetMapping("/travel/delete")
	public String delete() {

		return "/travel/delete";
	}

	@PostMapping("/travel/delete")
	public String delete(HttpServletRequest request, String oldfile, int travelno, String passwd) {
		
		String basePath = Travel.getUploadDir();
		
		Map map = new HashMap();
		map.put("travelno", travelno);
		map.put("passwd", passwd);
		int pcnt = service.passwd(map);
		
		int cnt = 0;
		if (pcnt == 1) {
					
			cnt = service.deleteReply(travelno) + service.delete(travelno);
			if(!oldfile.equals("default.jpg")) {
				Utility.deleteFile(basePath, oldfile);
			}
		}
		
		if (pcnt != 1) {
			return "/travel/passwdError";
		} else if (cnt == 1) {
			
			return "redirect:/travel/list";
		} else {
			return "/travel/error";
		}

	}

}
