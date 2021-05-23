package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.Member;


public interface UserMapper {

	public Member login(Map<String, String> map) throws SQLException;
	
//	REST
	public List<Member> userList();
	public Member userInfo(String userid);
	public int userRegister(Member memberDto);
	public int userModify(Member memberDto);
	public int userDelete(String userid);
}
