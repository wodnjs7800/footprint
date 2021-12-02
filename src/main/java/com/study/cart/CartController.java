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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.food.Food;
import com.study.food.FoodDTO;
import com.study.utility.Utility;

@Controller
public class CartController {
	
	@Autowired
	@Qualifier("com.study.cart.CartServiceImpl")
	private CartService service;
	
	@GetMapping("/cart/delete")
	public String delete(int cartno) {
	
		int cnt = 0;		

		cnt = service.delete(cartno);
		if(cnt>0) {
			return "redirect:/cart/list";
		}else {
			return "/error";
		}
	}
	
	@GetMapping("/cart/list")
	   public String list(HttpSession session, HttpServletRequest request, Model model) {

	      String id = (String)session.getAttribute("id");
	      
	      List<CartDTO> flist = service.flist(id);
	      List<CartDTO> tlist = service.tlist(id);
	      List<CartDTO> list = service.list(id);
	      
	      request.setAttribute("flist", flist);
	      request.setAttribute("tlist", tlist);
	      model.addAttribute("list", list);
	      
	      return "/cart/list";
	   }
	
	@GetMapping("/cart/fcreate")
	public String fcreate(CartDTO dto) {
		int cnt = service.fcreate(dto);
		if(cnt>0) {
			return "redirect:./list";
		}else {
			return "/error";
		}
	}

	@GetMapping("/cart/tcreate")
	public String tcreate(CartDTO dto) {
		System.out.println(dto.getFoodno());
		int cnt = service.tcreate(dto);
		if(cnt>0) {
			return "redirect:./list";
		}else {
			return "/error";
		}
	}
}
