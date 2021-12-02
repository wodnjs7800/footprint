package com.study.cart;

import java.util.List;
import java.util.Map;


public interface CartMapper {

	List<CartDTO> flist(String id);

	List<CartDTO> tlist(String id);

	int fcreate(CartDTO dto);

	int tcreate(CartDTO dto);

	int delete(int cartno);

	List<CartDTO> list(String id);

}
