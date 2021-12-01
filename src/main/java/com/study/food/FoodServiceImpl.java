package com.study.food;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.food.FoodServiceImpl")
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodMapper mapper;

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public List<FoodDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public FoodDTO read(int foodno) {
		// TODO Auto-generated method stub
		return mapper.read(foodno);
	}

	@Override
	public void upCnt(int foodno) {
		// TODO Auto-generated method stub
		mapper.upCnt(foodno);
		
	}

	@Override
	public int create(FoodDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int passwd(Map map) {
		// TODO Auto-generated method stub
		return mapper.passwd(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return mapper.update(map);
	}

	@Override
	public int delete(int foodno) {
		// TODO Auto-generated method stub
		return mapper.delete(foodno);
	}

	@Override
	public double avg(int foodno) {
		// TODO Auto-generated method stub
		return mapper.avg(foodno);
	}

	@Override
	public int deleteReply(int foodno) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(foodno);
	}

	@Override
	public List<FoodDTO> foodlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.foodlist(map);
	}

	@Override
	public int foodtotal() {
		// TODO Auto-generated method stub
		return mapper.foodtotal();
	}

	@Override
	public int foodupdate(Map map) {
		// TODO Auto-generated method stub
		return mapper.foodupdate(map);
	}

	@Override
	public FoodDTO readf(int foodno) {
		// TODO Auto-generated method stub
		return mapper.readf(foodno);
	}

}
