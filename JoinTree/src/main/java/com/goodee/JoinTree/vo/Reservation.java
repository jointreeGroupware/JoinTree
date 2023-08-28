package com.goodee.JoinTree.vo;

import lombok.Data;

@Data
public class Reservation {

	private int revNo;
	private int empNo;
	private String roomName; // 회의실 이름 join용
	private int equipNo;
	private String equipCategory;
	private String revStartTime;
	private String revEndTime;
	private String revStatus;
	private String revReason;
	private String createdate;
	private String updatedate;
	private int createId;
	private int updateId;
}
