package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.dto.PageResult;
import com.ssafy.happyhouse.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;

	@Override
	public void boardInsert(Board board) throws Exception {
		mapper.insert(board);
	}

	@Override
	public void boardDelete(int idx) throws SQLException {
		mapper.delete(idx);
	}

	@Override
	public void boardUpdate(Board board) {
		mapper.update(board);
	}
	
	@Override
	public void boardCount(Board board) {
		mapper.countup(board);
	}

	@Override
	public Board boardSelect(int idx) {
		Board board = mapper.selectBoard(idx);
		
		return board;
	}

	@Override
	public Map<String, Object> boardList(Page page) throws SQLException {
		List<Board> list = mapper.selectAll(page);
		int count = mapper.countBoard();
		PageResult prd = new PageResult(page.getPageNo(), count, 10);
		
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pageResult", prd);
		
		return result;
	}

	@Override
	public List<Board> boardAllList() {
		return mapper.selectAllList();
	}
	
}
