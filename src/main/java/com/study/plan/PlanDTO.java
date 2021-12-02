package com.study.plan;

import lombok.Data;

@Data
public class PlanDTO {
	private int planid;
	private int cartno;
	private int ttid;
	private float lat;
	private float lng;
	private String bname;
	private float dist;
	private String ddate;
	private String starttime;
	private String endtime;
	private String movetime;
}
