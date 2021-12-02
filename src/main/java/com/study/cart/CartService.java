package com.study.cart;

import java.util.List;
import java.util.Map;

public interface CartService {

	int fcreate(CartDTO dto);
	
    int tcreate(CartDTO dto);

	int total(String id);

	List<CartjoinDTO> list(Map map);

	int delete(int cartno);


}
