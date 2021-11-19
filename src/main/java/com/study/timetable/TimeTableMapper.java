package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TimeTableMapper {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

	TimeTableDTO read(int ttid);
	
}
