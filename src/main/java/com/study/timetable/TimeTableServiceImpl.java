package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.cart.CartDTO;
import com.study.plan.PlanDTO;

@Service("com.study.timetable.TimeTableServiceImpl")
public class TimeTableServiceImpl implements TimeTableService {
	@Autowired
	private TimeTableMapper mapper;

	@Override
	public List<TimeTableDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int create(TimeTableDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public TimeTableDTO read(int ttid) {
		// TODO Auto-generated method stub
		return mapper.read(ttid);
	}

	@Override
	public int delete(int ttid) {
		// TODO Auto-generated method stub
		return mapper.delete(ttid);
	}

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
	public List<PlanDTO> plist(int ttid) {
		// TODO Auto-generated method stub
		return mapper.plist(ttid);
	}

	@Override
	public boolean update(Map m) {
		// TODO Auto-generated method stub
		return mapper.update(m);
	}

	@Override
	public boolean bupdate(Map map) {
		// TODO Auto-generated method stub
		return mapper.bupdate(map);
	}

	@Override
	public int pdelete(int ttid) {
		// TODO Auto-generated method stub
		return mapper.pdelete(ttid);
	}

}
