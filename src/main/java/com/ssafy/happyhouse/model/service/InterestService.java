package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.InterestArea;


	public interface InterestService {
	
	public List<InterestArea> selectAll(String userid) throws Exception;
		
	// 등록
	public int interestInsert(String word, String userid) throws Exception;
	
	// 삭제
	public int interestDelete(String word) throws SQLException;
	
	
	

}
