package com.study.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	int delete(int noticeno);
	
	int update(NoticeDTO dto);
	int passwd(Map map);
	
	
	NoticeDTO read(int noticeno);

	int create(NoticeDTO dto);

	int total(Map map);

	List<NoticeDTO> list(Map map);

	

	void upCnt(int noticeno);

	

	

	

}
