package com.study.cart;

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
import org.springframework.web.bind.annotation.PathVariable;


import com.study.utility.Utility;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("com.study.cart.CartServiceImpl")
	private CartService service;
	

	
	@GetMapping("/cart/list")
	public String list(HttpSession session, HttpServletRequest request, Model model) {
		
		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 8;// 한페이지당 보여줄 레코드갯수
		
		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		String id = (String)session.getAttribute("id");
				
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("id", id);
		
		
		
		List<CartjoinDTO> list = service.list(map);
		int total = service.total(id);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, "", "");
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		
		model.addAttribute("list", list);
		
		
		return "/cart/list";
	}
	
	
	
	@GetMapping("/cart/fcreate")
	  public String fcreate(CartDTO dto) {
	 
		int cnt = service.fcreate(dto);
		
		if(cnt>0) {
			return "redirect:./list";
		}else {
			return "/cart/error";
		}
		
	  }
		
	
	@GetMapping("/cart/tcreate")
	  public String tcreate(CartDTO dto) {
	 
		int cnt = service.tcreate(dto);
		
		if(cnt>0) {
			return "redirect:./list";
		}else {
			return "/cart/error";
		}
		
	  }
	
}
