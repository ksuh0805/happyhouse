package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Chart;
import com.ssafy.happyhouse.model.dto.InterestArea;
import com.ssafy.happyhouse.model.dto.WordcloudDTO;

public interface InterestMapper {
	List<InterestArea> interestList(String userid);
	int interestInsert(String word, String userid);
	int interestDelete(String word, String userid);
	int wordCheck(String word, String userid);
	int countSum(String word);
	List<Chart> countCheck();
	List<Chart> countGender(String gender);
	List<Chart> countAge(int age);
	List<Chart> countJob(String job);
	List<WordcloudDTO> wordcloudlist(WordcloudDTO WordcloudDTO);
}
