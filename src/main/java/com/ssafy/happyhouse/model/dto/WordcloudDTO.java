package com.ssafy.happyhouse.model.dto;

public class WordcloudDTO {
	private String word;
	private int mount;
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getMount() {
		return mount*5;
	}
	public void setMount(int mount) {
		this.mount = mount;
	}
	
	
}
