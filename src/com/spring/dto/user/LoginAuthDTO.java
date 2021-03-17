package com.spring.dto.user;

public class LoginAuthDTO {
	
	 private int userNum;
	 private String id;
	 private String pw;
	 private String email;
	 private int authStatus;
	 
	 public int getUserNum() {
		 return userNum;
	 }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getEmail() {
		return email;
	}
	
	public int getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(int authStatus) {
		this.authStatus = authStatus;
	}
	 @Override
	public String toString() {
		
		return "id:"+id + " pw:"+pw + " authStatus:" + authStatus; 
	}
	 

}
