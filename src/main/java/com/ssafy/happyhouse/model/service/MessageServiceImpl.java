package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.Message;
import com.ssafy.happyhouse.model.mapper.MessageMapper;


@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageMapper mapper;
	
	@Override
	public void messageSend(Message message) throws Exception {
		mapper.send(message);
	}

	@Override
	public List<Message> messageList(String userid) {
		return mapper.selectAllList(userid);
	}

	@Override
	public Message messageDetail(int no) {
		return mapper.selectDetail(no);
	}

	@Override
	public void messageDelete(int no) {
		mapper.selectDelete(no);
	}
}
