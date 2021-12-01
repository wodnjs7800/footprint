package com.study.timetable;

import java.util.List;
import java.util.Map;

import com.study.bookmark.BookmarkDTO;
import com.study.plan.PlanDTO;

public interface TimeTableService {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

	TimeTableDTO read(int ttid);

	int delete(int ttid);

	List<BookmarkDTO> flist(String id);

	List<BookmarkDTO> tlist(String id);

	List<PlanDTO> plist(int ttid);

	boolean update(PlanDTO dto);

	boolean bupdate(Map map);

}
