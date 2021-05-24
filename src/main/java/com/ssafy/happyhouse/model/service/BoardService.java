package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Page;

	public interface BoardService {
	
	// 게시글 등록
	public void boardInsert(Board board) throws Exception;
	
	// 게시글 삭제
	public void boardDelete(int idx) throws SQLException;
	
	// 게시글 조회
	public Map<String, Object> boardList(Page page) throws SQLException;
	
	// 게시글 상세보기
	public Board boardSelect(int idx);
	
	// 게시글 수정
	public void boardUpdate(Board board);
	
	// 조회수
	public void boardCount(Board board);

	public List<Board> boardAllList();

	public Board boardTop();
}
