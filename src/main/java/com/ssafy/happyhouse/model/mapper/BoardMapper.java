package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Page;

public interface BoardMapper {
	List<Board> selectAll(Page page);
	Board selectBoard(int idx);
	int insert(Board board);
	int delete(int idx);
	void update(Board board);
	int countBoard();
}