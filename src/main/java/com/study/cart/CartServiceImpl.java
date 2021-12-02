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
	public List<CartDTO> flist(String id) {
		// TODO Auto-generated method stub
		return mapper.flist(id);
	}

	@Override
	public List<CartDTO> tlist(String id) {
		// TODO Auto-generated method stub
		return mapper.tlist(id);
	}

	@Override
	public int fcreate(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.fcreate(dto);
	}

	@Override
	public int tcreate(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.tcreate(dto);
	}

	@Override
	public int delete(int cartno) {
		// TODO Auto-generated method stub
		return mapper.delete(cartno);
	}

	@Override
	public List<CartDTO> list(String id) {
		// TODO Auto-generated method stub
		return mapper.list(id);
	}

}
