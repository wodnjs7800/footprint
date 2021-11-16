package com.study.notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
	int delete(int noticeno);
	
	int passwd(Map map);
	int update(NoticeDTO dto);
	
	NoticeDTO read(int noticeno);
	
	int create(NoticeDTO dto);
	
	int total(Map map);
	List<NoticeDTO> list(Map map);
	

	void upCnt(int noticeno);

	

	

}
