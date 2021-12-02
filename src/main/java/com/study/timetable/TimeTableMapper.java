package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.bookmark.BookmarkDTO;
import com.study.plan.PlanDTO;

@Mapper
public interface TimeTableMapper {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

	TimeTableDTO read(int ttid);

	int delete(int ttid);

	List<BookmarkDTO> tlist(String id);
	
	List<BookmarkDTO> flist(String id);

	List<PlanDTO> plist(int ttid);

	boolean update(Map m);

	boolean bupdate(Map map);
	
}
