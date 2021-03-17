package com.spring.dto.user;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

public class UserEmailAuthDTO {
	
	private int authNum;
	private int userNum;
	private String email;
	private String authKey;
	private Timestamp regTime;
	private Timestamp endTime;
	private int authStatus; // 필요한가? 
	
	
	public UserEmailAuthDTO() {}

	public UserEmailAuthDTO(int userNum, String email, String authKey, LocalDateTime now, int authStatus) {
		this.userNum = userNum;
		this.email = email;
		this.authKey = authKey;
		this.regTime = setTime(now);
		this.endTime = setTime(now.plusMinutes(30));
		this.authStatus = authStatus;
	}

	
	public static Timestamp setTime(LocalDateTime t) {
		return Timestamp.valueOf(t);
	}
	
	
	public int getAuthNum() {
		return authNum;
	}

	public void setAuthNum(int authNum) {
		this.authNum = authNum;
	}

	public int getUserNum() {
		return userNum;
	}


	public String getEmail() {
		return email;
	}


	public String getAuthKey() {
		return authKey;
	}


	public int getAuthStatus() {
		return authStatus;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	
	


}
