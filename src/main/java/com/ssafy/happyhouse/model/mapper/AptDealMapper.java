package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.AptDeal;

public interface AptDealMapper {
	public List<AptDeal> selectAll();
	public AptDeal selectByDong(String dong);
}
