package com.spring.dto;

import java.sql.Timestamp;

public class SendEventEmailDTO {
	
	private int eventNum;
	private int userNum;
	private String eventName;
	private Timestamp eventDate;
	private Timestamp alertDate;
	private String eventMemo;
	private int eventAlarm;
	private String name;
	private String email;
	
	public int getEventNum() {
		return eventNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public String getEventName() {
		return eventName;
	}
	public Timestamp getEventDate() {
		return eventDate;
	}
	public Timestamp getAlertDate() {
		return alertDate;
	}
	public String getEventMemo() {
		return eventMemo;
	}
	public int getEventAlarm() {
		return eventAlarm;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	
	

}
