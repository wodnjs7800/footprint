package com.study.food;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.study.cart.CartjoinDTO;
import com.study.utility.Utility;

@Controller
public class FoodController {

	@Autowired
	@Qualifier("com.study.food.FoodServiceImpl")
	private FoodService service;

	@GetMapping("/admin/fooddelete")
	public String fdelete(int foodno, Model model) {
		FoodDTO dto = service.readf(foodno);
		model.addAttribute("dto", dto);
		return "/admin/fooddelete";
	}

	@PostMapping("/admin/fooddelete")
	public String fdelete(HttpServletRequest request, int foodno, String passwd, String fname) {
		String basePath = Food.getUploadDir();
		
		Map map = new HashMap();

		int cnt = 0;
		
		cnt = service.delete(foodno);
		//fname이 디폴트 이름이 아닌경우에만 이미지 삭제
		if(!fname.equals("food.jpg")) {
			Utility.deleteFile(basePath, fname);
		}
		
		if (cnt == 1) {
			return "redirect:/admin/foodlist";
		} else {
			return "/myerror";
		}

	}
	
	@GetMapping("/food/complete")
	public String complete() {

		return "/admin/foodupdate";
	}
	
	@GetMapping("/admin/foodupdate")
	public String adminUpdate(int foodno, Model model) {
		
		FoodDTO dto = service.readf(foodno);

		model.addAttribute("dto", dto);

		return "/admin/foodupdate";
	}

	@PostMapping("/admin/foodupdate")
	public String adminUpdate(MultipartFile fnameMF, String oldfile, FoodDTO dto, Model model, HttpServletRequest request) {
		//String basePath = new ClassPathResource("/static/images/food").getFile().getAbsolutePath();
		String basePath = Food.getUploadDir();

		if (oldfile != null && !oldfile.equals("food.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		Map map = new HashMap();
		map.put("foodno", dto.getFoodno());
		map.put("foodname", dto.getFoodname());
		map.put("contents", dto.getContents());
		map.put("local", dto.getLocal());
		map.put("zipcode", dto.getZipcode());
		map.put("address1", dto.getAddress1());
		map.put("address2", dto.getAddress2());
		map.put("phone", dto.getPhone());
		map.put("yn", dto.getYn());

		int size = (int) dto.getFnameMF().getSize();
		if (size > 0) {
			map.put("fname", Utility.saveFileSpring(fnameMF, basePath));
		} else {
			map.put("fname", dto.getFname());
		}


		int cnt = service.foodupdate(map);
		
		if (cnt == 1) {
			return "redirect:/admin/foodlist";
		} else {
			return "/member/errorMsg";
		}
	}
	
	@GetMapping("/admin/foodlist")
	public String list(HttpServletRequest request, Model model) {
		
		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;// 한페이지당 보여줄 레코드갯수
		
		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;	
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<FoodDTO> list = service.foodlist(map);
		int total = service.foodtotal();
		
		String paging = Utility.pagingf(total, nowPage, recordPerPage, "", "");
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		model.addAttribute("list", list);
		
		
		return "/admin/foodlist";
	}
	
	@GetMapping("/food/list")
	public String list(HttpServletRequest request) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String array = Utility.checkNull(request.getParameter("array"));

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;// 한페이지당 보여줄 레코드갯수

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
		List<FoodDTO> list = service.list(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("array", array);

		return "/food/list";
	}

	@GetMapping("/food/read")
	public String read(int foodno, Model model, HttpSession session, HttpServletRequest request) {
		//세션 id 가져온다.
		String id = (String) session.getAttribute("id");
				
		if(id==null) {
			return "/member/login";
		}
		double avg = service.avg(foodno);
		service.upCnt(foodno);

		FoodDTO dto = service.read(foodno);

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

		return "/food/read";
	}
	
	@GetMapping("/food/create")
	public String create() {

		return "/food/create";
	}

	@PostMapping("/food/create")
	public String create(FoodDTO dto, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		if(id==null) {
			return "/member/login";
		}
		dto.setId(id);
		
		//String upDir = new ClassPathResource("/static/images/food").getFile().getAbsolutePath();
		String upDir = Food.getUploadDir();
				
		String fname = Utility.saveFileSpring(dto.getFnameMF(), upDir);
		
		int size = (int) dto.getFnameMF().getSize();
		if (size > 0) {
			dto.setFname(fname);
		} else {
			dto.setFname("food.jpg");
		}

		if (service.create(dto) > 0) {
			return "/food/complete";
		} else {
			return "/myerror";
		}

	}

	@GetMapping("/food/update")
	public String update(int foodno, Model model) {

		FoodDTO dto = service.read(foodno);

		model.addAttribute("dto", dto);

		return "/food/update";
	}

	@PostMapping("/food/update")
	public String update(MultipartFile fnameMF, String oldfile, FoodDTO dto, Model model, HttpServletRequest request) {
		//String basePath = new ClassPathResource("/static/images/food").getFile().getAbsolutePath();
		String basePath = Food.getUploadDir();

		if (oldfile != null && !oldfile.equals("food.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		Map map = new HashMap();
		map.put("foodno", dto.getFoodno());
		map.put("foodname", dto.getFoodname());
		map.put("contents", dto.getContents());
		map.put("local", dto.getLocal());
		map.put("zipcode", dto.getZipcode());
		map.put("address1", dto.getAddress1());
		map.put("address2", dto.getAddress2());
		map.put("phone", dto.getPhone());
		map.put("passwd", dto.getPasswd());

		int size = (int) dto.getFnameMF().getSize();
		if (size > 0) {
			map.put("fname", Utility.saveFileSpring(fnameMF, basePath));
		} else {
			map.put("fname", dto.getFname());
		}

		int pcnt = service.passwd(map);

		int cnt = 0;
		if (pcnt == 1) {

			cnt = service.update(map);
		}

		if (pcnt != 1) {
			model.addAttribute("msg", "비밀번호를 잘못 입력하셨습니다.");
			return "/member/errorMsg";
		} else if (cnt == 1) {
			return "redirect:./list";
		} else {
			model.addAttribute("msg", "오류가 발생했습니다.");
			return "/member/errorMsg";
		}
	}

	@GetMapping("/food/delete")
	public String delete(int foodno, Model model) {
		FoodDTO dto = service.read(foodno);
		model.addAttribute("dto", dto);

		return "/food/delete";
	}

	@PostMapping("/food/delete")
	public String delete(HttpServletRequest request, int foodno, String passwd, String fname) {
		
		String basePath = Food.getUploadDir();
		
		Map map = new HashMap();
		map.put("foodno", foodno);
		map.put("passwd", passwd);
		int pcnt = service.passwd(map);

		int cnt = 0;
		if (pcnt == 1) {
			service.deleteReply(foodno);
			cnt = service.delete(foodno);
			//fname이 디폴트 이름이 아닌경우에만 이미지 삭제
			if(!fname.equals("food.jpg")) {
				Utility.deleteFile(basePath, fname);
			}
		}

		if (pcnt != 1) {
			return "./passwdError";
		} else if (cnt == 1) {
			return "redirect:/food/list";
		} else {
			return "/myerror";
		}

	}

}
