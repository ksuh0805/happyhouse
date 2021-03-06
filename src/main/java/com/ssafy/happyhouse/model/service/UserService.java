package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.Member;

public interface UserService {

	public Member login(Map<String, String> map) throws Exception;
	
//	REST 
	public List<Member> userList();
	public Member userInfo(String userid);
	public int userRegister(Member memberDto);
	public int userModify(Member memberDto);
	public int userDelete(String userid);
	public int Id_Check(String userid);
}
