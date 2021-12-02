package com.study.timetable;

import java.util.List;
import java.util.Map;

import com.study.cart.CartDTO;
import com.study.plan.PlanDTO;

public interface TimeTableService {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

	TimeTableDTO read(int ttid);

	int delete(int ttid);

	List<CartDTO> flist(String id);

	List<CartDTO> tlist(String id);

	List<PlanDTO> plist(int ttid);

	boolean update(Map m);

	boolean bupdate(Map map);

	int pdelete(int ttid);

}
