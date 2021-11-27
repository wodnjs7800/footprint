package com.study.food;

import java.util.List;
import java.util.Map;

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

}
