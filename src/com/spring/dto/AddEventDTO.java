package com.spring.dto;

import java.sql.Timestamp;

public class AddEventDTO {
	
	
	private int userNum;
	private String eventName;
	private String day;
	private String month;
	private String year;
	private Timestamp eventDate;
	private Timestamp alertDate;
	private String eventMemo;
	private int eventAlarm;
	
	public int getUserNum() {
		return userNum;
	}
	public String getEventName() {
		return eventName;
	}
	public String getDay() {
		return day;
	}
	public String getMonth() {
		return month;
	}
	public String getYear() {
		return year;
	}
	
	public Timestamp getEventDate() {
		return eventDate;
	}
	public void setEventDate(Timestamp eventDate) {
		this.eventDate = eventDate;
	}
	
	public void setAlertDate(Timestamp eventDate) {
		this.alertDate = eventDate;
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
	
	
	
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public void setEventMemo(String eventMemo) {
		this.eventMemo = eventMemo;
	}
	public void setEventAlarm(int eventAlarm) {
		this.eventAlarm = eventAlarm;
	}
	@Override
	public String toString() {
		
		return "userNum: "+getUserNum()+"eventName: " + getEventName()
		+ "day: " + getDay() + "month: " + getMonth() + "year: " + getYear()
		+"eventMemo: " + getEventMemo() + "eventAlram: " + getEventAlarm();
	}

	
}
