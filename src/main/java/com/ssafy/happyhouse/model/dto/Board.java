package com.ssafy.happyhouse.model.dto;

public class Board {
    private int idx;
    private String wdate;
    private String subject;
    private String content;
    private int count;


    public int getIdx() {
        return idx;
    }
    public void setIdx(int idx) {
        this.idx = idx;
    }
    public String getWdate() {
        return wdate;
    }
    public void setWdate(String wdate) {
        this.wdate = wdate;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}