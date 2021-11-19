package com.study.timetable;

import java.util.List;
import java.util.Map;

public interface TimeTableService {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

}
