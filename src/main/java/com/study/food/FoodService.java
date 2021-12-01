package com.study.food;

import java.util.List;
import java.util.Map;

import com.study.cart.CartjoinDTO;

public interface FoodService {

	int total(Map map);

	List<FoodDTO> list(Map map);

	FoodDTO read(int foodno);

	void upCnt(int foodno);

	int create(FoodDTO dto);

	int passwd(Map map);

	int update(Map map);

	int delete(int foodno);

	double avg(int foodno);

	int deleteReply(int foodno);

	List<FoodDTO> foodlist(Map map);

	int foodtotal();

	int foodupdate(Map map);

	FoodDTO readf(int foodno);

}
