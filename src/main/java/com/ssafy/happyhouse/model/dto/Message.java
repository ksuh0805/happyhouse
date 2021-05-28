package com.ssafy.happyhouse.model.dto;

public class Message {
	private	int no;
	private String sendID;
	private String receivingID;
	private String title;
	private String contents;
	private String wdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSendID() {
		return sendID;
	}
	public void setSendID(String sendID) {
		this.sendID = sendID;
	}
	public String getReceivingID() {
		return receivingID;
	}
	public void setReceivingID(String receivingID) {
		this.receivingID = receivingID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
}
