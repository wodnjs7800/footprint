package com.study.bookmark;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.bookmark.BookmarkServiceImpl")
public class BookmarkServiceImpl implements BookmarkService {
	@Autowired
	private BookmarkMapper mapper;

	@Override
	public List<BookmarkDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int create(BookmarkDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	public int total(Map map) {
		// TODO Auto-generated method stub
		return mapper.total(map);
	}

	@Override
	public BookmarkDTO read(int ttid) {
		// TODO Auto-generated method stub
		return mapper.read(ttid);
	}

	@Override
	public int delete(int ttid) {
		// TODO Auto-generated method stub
		return mapper.delete(ttid);
	}	
}
