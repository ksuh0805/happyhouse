package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Message;

public interface MessageMapper {
	int send(Message message);

	List<Message> selectAllList(String userid);
	
	Message selectDetail(int no);
	
	int selectDelete(int no);
}
