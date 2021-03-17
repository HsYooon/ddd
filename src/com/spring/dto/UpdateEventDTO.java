package com.spring.dto;

import java.sql.Timestamp;

public class UpdateEventDTO {

	private int eventNum;
	private int userNum;
	private String eventName;
	private Timestamp alertDate;
	private String eventMemo;
	private int eventAlarm;
	
	
	public int getEventNum() {
		return eventNum;
	}

	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	
	public Timestamp getAlertDate() {
		return alertDate;
	}

	public void setAlertDate(Timestamp alertDate) {
		this.alertDate = alertDate;
	}
	public String getEventMemo() {
		return eventMemo;
	}
	public void setEventMemo(String eventMemo) {
		this.eventMemo = eventMemo;
	}

	public int getEventAlarm() {
		return eventAlarm;
	}
	public void setEventAlarm(int eventAlarm) {
		this.eventAlarm = eventAlarm;
	}
	@Override
	public String toString() {
		
		return "eventNum: " + getEventNum() + "userNum: "+getUserNum()+"eventName: " + getEventName()
		+"eventMemo: " + getEventMemo() + "eventAlram: " + getEventAlarm();
	}
	
}
