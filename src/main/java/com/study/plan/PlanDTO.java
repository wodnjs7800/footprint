package com.study.plan;

import lombok.Data;

@Data
public class PlanDTO {
	private int planid;
	private int bmno;
	private int ttid;
	private String bname;
	private String ddate;
	private String starttime;
	private String endtime;
	private String movetime;
}
