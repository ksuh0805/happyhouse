package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.AptDeal;
import com.ssafy.happyhouse.model.dto.AptInfo;

public interface AptDealMapper {
	List<AptDeal> selectAll();
	int selectByDongCnt(String dong);
	int selectByAptCnt(String apt);
	List<AptDeal> listByDong(Map<String, Object> map);
	List<AptDeal> listByApt(Map<String, Object> map);
	List<String> guList();
	List<String> dongList(String gu);
	List<AptInfo> dongmarkerlist(String dong);
	List<AptInfo> aptmarkerlist(String apt);
}