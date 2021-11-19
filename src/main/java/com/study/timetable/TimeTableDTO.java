package com.study.timetable;

import lombok.Data;

@Data
public class TimeTableDTO {
	private int ttid;
	private String id;
	private String startdate;
	private String enddate;
	private String name;
	private int r;
}
