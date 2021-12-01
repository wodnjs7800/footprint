package com.study.travel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.food.FoodDTO;
import com.study.notice.NoticeDTO;

@Service("com.study.travel.TravelServiceImpl")
public class TravelServiceImpl implements TravelService{
	@Autowired
	  private TravelMapper mapper;

	@Override
	public int create(TravelDTO dto) {
		// TODO Auto-generated method stub
		return mapper.create(dto);
	}

	@Override
	  public int total(Map map) {
	    // TODO Auto-generated method stub
	    return mapper.total(map);
	  }

	@Override
	public List<TravelDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public void viewcnt(int travelno) {
		// TODO Auto-generated method stub
		mapper.viewcnt(travelno);
	}

	@Override
	public TravelDTO read(int travelno) {
		// TODO Auto-generated method stub
		return mapper.read(travelno);
	}

	@Override
	public int passwd(Map map) {
		// TODO Auto-generated method stub
		return mapper.passwd(map);
	}

	@Override
	public int update(TravelDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(int travelno) {
		// TODO Auto-generated method stub
		return mapper.delete(travelno);
	}

	@Override
	public double avg(int travelno) {
		// TODO Auto-generated method stub
		return mapper.avg(travelno);
	}

	@Override
	public int deleteReply(int travelno) {
		// TODO Auto-generated method stub
		return mapper.deleteReply(travelno);
	}

	@Override
	public int travelupdate(Map map) {
		// TODO Auto-generated method stub
		return mapper.travelupdate(map);
	}

	@Override
	public List<TravelDTO> travellist(Map map) {
		// TODO Auto-generated method stub
		return mapper.travellist(map);
	}

	@Override
	public int traveltotal() {
		// TODO Auto-generated method stub
		return mapper.traveltotal();
	}

	@Override
	public TravelDTO readt(int travelno) {
		// TODO Auto-generated method stub
		return mapper.readt(travelno);
	}

}
