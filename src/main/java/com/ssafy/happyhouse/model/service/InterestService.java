package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.Chart;
import com.ssafy.happyhouse.model.dto.InterestArea;
import com.ssafy.happyhouse.model.dto.WordcloudDTO;


	public interface InterestService {
		
	public int wordCheck(String word, String userid) throws Exception;
	
	public List<InterestArea> selectAll(String userid) throws Exception;
		
	// 등록
	public int interestInsert(String word, String userid) throws Exception;
	
	// 삭제
	public int interestDelete(String word, String userid) throws SQLException;

	
	public List<Chart> countCheck() throws SQLException;

	public List<Chart> countGender(String gender);
	public List<Chart> countAge(int age);
	public List<Chart> countJob(String job);
	List<WordcloudDTO> listWordcloud(WordcloudDTO WordcloudDTO);
	
	

}
