package com.study.bookmark;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookmarkMapper {

	List<BookmarkDTO> list(Map map);

	int create(BookmarkDTO dto);

	int total(Map map);

	BookmarkDTO read(int ttid);

	int delete(int ttid);
	
}
