package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.AptDeal;
import com.ssafy.happyhouse.model.dto.Page;

public interface AptDealService {
	List<AptDeal> selectAll();
	Map<String, Object> listPageDong(Page page, String dong);
	Map<String, Object> listPageApt(Page page, String apt);
}
