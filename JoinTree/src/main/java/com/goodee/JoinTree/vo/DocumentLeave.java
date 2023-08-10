package com.goodee.JoinTree.vo;

import lombok.Data;

@Data
public class DocumentLeave {

	private int docNo;
	private String leave;
	private String docLeaveStartDate;
	private String docLeaveEndDate;
	private double docLeavePeriodDate;
	private String docLeaveReason;
	private String docLeaveTel;
	private String createdate;
	private String updatedate;
	private int createId;
	private int updateId;
}
