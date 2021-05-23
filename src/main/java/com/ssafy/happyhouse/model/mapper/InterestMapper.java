package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.InterestArea;

public interface InterestMapper {
	List<InterestArea> interestList(String userid);
	int interestInsert(String word, String userid);
	int interestDelete(String word);
}
