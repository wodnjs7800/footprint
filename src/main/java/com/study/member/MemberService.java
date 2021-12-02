package com.study.member;

import java.util.List;
import java.util.Map;

import com.study.food.FoodDTO;
import com.study.travel.TravelDTO;

public interface MemberService {

	int duplicatedId(String id);

	int duplicatedEmail(String email);

	int create(MemberDTO dto);

	int loginCheck(Map<String, String> map);

	String getGrade(String string);

	MemberDTO read(String id);

	int update(MemberDTO dto);

	int updateFile(Map map);

	int total(Map map);

	List<MemberDTO> list(Map map);
	
	MemberDTO mypage(String id);

	int passwd(Map map);

	int delete(String id);

	List<TravelDTO> travelList();

	List<FoodDTO> foodList();



}
