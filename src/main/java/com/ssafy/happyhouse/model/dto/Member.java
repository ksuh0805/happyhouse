package com.ssafy.happyhouse.model.dto;

public class Member {
	String userId;
	String userPwd;
	String userName;
	int userPhone;
	String userAdd;
	String user;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAdd() {
		return userAdd;
	}
	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	
	public Member(String userId, String userPwd, String userName, int userPhone, String userAdd, String user) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userAdd = userAdd;
		this.user = user;
	}
	
	public Member() {
	}
	
	public Member(String userId, String userPwd, String userName, int userPhone, String userAdd) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userAdd = userAdd;
	}
}
