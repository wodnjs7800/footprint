package com.study.timetable;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.bookmark.BookmarkDTO;

@Mapper
public interface TimeTableMapper {

	List<TimeTableDTO> list(Map map);

	int create(TimeTableDTO dto);

	int total(Map map);

	TimeTableDTO read(int ttid);

	int delete(int ttid);

	List<BookmarkDTO> tlist(String id);
	
	List<BookmarkDTO> flist(String id);
	
}
