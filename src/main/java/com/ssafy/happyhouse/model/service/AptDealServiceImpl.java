package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.AptDeal;
import com.ssafy.happyhouse.model.dto.AptInfo;
import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.dto.PageResult;
import com.ssafy.happyhouse.model.mapper.AptDealMapper;

@Service
public class AptDealServiceImpl implements AptDealService {
	
	@Autowired
	AptDealMapper mapper;
	
	@Override
	public List<AptDeal> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public Map<String, Object> listPageDong(Page page, String dong) {
		Map<String, Object> map = new HashMap<>();
		map.put("dong", dong);
		map.put("begin", page.getBegin());
		map.put("size", page.getListSize());
		List<AptDeal> list = mapper.listByDong(map);
		int count = mapper.selectByDongCnt(dong);
		PageResult prd = new PageResult(page.getPageNo(), count, 3);
		
		Map<String, Object> result = new HashMap<>();
		result.put("searchlist", list);
		result.put("pageResult", prd);
		
		return result;
	}

	@Override
	public Map<String, Object> listPageApt(Page page, String apt) {
		Map<String, Object> map = new HashMap<>();
		map.put("apt", apt);
		map.put("begin", page.getBegin());
		map.put("size", page.getListSize());
		List<AptDeal> list = mapper.listByApt(map);
		int count = mapper.selectByAptCnt(apt);
		PageResult prd = new PageResult(page.getPageNo(), count, 3);
		
		Map<String, Object> result = new HashMap<>();
		result.put("searchlist", list);
		result.put("pageResult", prd);
		
		return result;
	}

	@Override
	public List<String> guList() {
		return mapper.guList();
	}

	@Override
	public List<String> dongList(String gu) {
		return mapper.dongList(gu);
	}

	@Override
	public List<AptInfo> dongmarkerlist(String dong) {
		return mapper.dongmarkerlist(dong);
	}

	@Override
	public List<AptInfo> aptmarkerlist(String apt) {
		return mapper.aptmarkerlist(apt);
	}

}
