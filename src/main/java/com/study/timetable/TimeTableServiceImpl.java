package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.bookmark.BookmarkDTO;
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
	public List<BookmarkDTO> flist(String id) {
		// TODO Auto-generated method stub
		return mapper.flist(id);
	}

	@Override
	public List<BookmarkDTO> tlist(String id) {
		// TODO Auto-generated method stub
		return mapper.tlist(id);
	}

	@Override
	public List<PlanDTO> plist(int ttid) {
		// TODO Auto-generated method stub
		return mapper.plist(ttid);
	}

}
