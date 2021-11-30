package com.study.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.cart.CartServiceImpl")
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper mapper;
	
	@Override
	public int tcreate(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.tcreate(dto);
	}

	@Override
	public int fcreate(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.fcreate(dto);
	}
	@Override
	public List<CartjoinDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}
	@Override
	public int total(String id) {
		// TODO Auto-generated method stub
		return mapper.total(id);
	}
}