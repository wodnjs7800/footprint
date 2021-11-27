package com.study.bookmark;

import java.util.List;
import java.util.Map;

public interface BookmarkService {

	List<BookmarkDTO> list(Map map);

	int create(BookmarkDTO dto);

	int total(Map map);

	BookmarkDTO read(int ttid);

	int delete(int ttid);

}
