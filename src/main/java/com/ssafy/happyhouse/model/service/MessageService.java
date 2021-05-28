package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Message;

public interface MessageService {
	
	// 메세지 보내기
	public void messageSend(Message message) throws Exception;

	//메세지 목록
	public List<Message> messageList(String userid);

	public Message messageDetail(int no);

	public void messageDelete(int no);
}
