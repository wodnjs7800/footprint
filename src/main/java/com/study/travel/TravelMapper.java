package com.study.travel;

import java.util.List;
import java.util.Map;

import com.study.food.FoodDTO;
import com.study.notice.NoticeDTO;

public interface TravelMapper {

	int create(TravelDTO dto);

	int total(Map map);

	List<TravelDTO> list(Map map);

	void viewcnt(int travelno);

	TravelDTO read(int travelno);

	int passwd(Map map);

	int update(TravelDTO dto);

	int delete(int travelno);

	double avg(int travelno);

	int deleteReply(int travelno);
	
	List<TravelDTO> travellist(Map map);

	int traveltotal();
	
	int travelupdate(Map map);
	
	TravelDTO readt(int travelno);

}
