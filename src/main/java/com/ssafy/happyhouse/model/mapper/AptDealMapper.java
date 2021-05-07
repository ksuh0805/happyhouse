package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.AptDeal;

public interface AptDealMapper {
	List<AptDeal> selectAll();
	int selectByDongCnt(String dong);
	int selectByAptCnt(String apt);
	List<AptDeal> listByDong(Map<String, Object> map);
	List<AptDeal> listByApt(Map<String, Object> map);
}
