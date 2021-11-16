package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.timetable.TimeTableServiceImpl")
public class TimeTableServiceImpl implements TimeTableService {
	@Autowired
	private TimeTableMapper mapper;

	@Override
	public List<TimeTableDTO> list(String id) {
		// TODO Auto-generated method stub
		return mapper.list(id);
	}	
}
