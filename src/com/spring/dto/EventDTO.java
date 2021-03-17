package com.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EventDTO {
	
	private int eventNum;
	private int userNum;
	private String eventName;
	private Timestamp eventDate;
	private int year;
	private int month;
	private int date;
	private String eventDateString;
	private String eventMemo;
	private int eventAlarm;
	
	public void dateToString() {
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
		String date = sd.format(this.eventDate);
		
		setEventDateString(date);
		//return eventDate.toString();
	}
	
	public void setFullDate() {
		
		Date nowDate = new Date();
		
		this.year = eventDate.getYear() - nowDate.getYear();
	
		this.month = this.eventDate.getMonth() - nowDate.getMonth();
		
		this.date = this.eventDate.getDate();
		
		
	}
	
	
	
	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDate() {
		return date;
	}

	public String getEventDateString() {
		return eventDateString;
	}


	public void setEventDateString(String eventDateString) {
		this.eventDateString = eventDateString;
	}


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
	public String getEventMemo() {
		return eventMemo;
	}
	public int getEventAlarm() {
		return eventAlarm;
	}
	
	
}
