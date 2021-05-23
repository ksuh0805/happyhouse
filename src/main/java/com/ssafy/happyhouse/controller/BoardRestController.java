package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/boardapi")
@CrossOrigin("*")
@Api(value="HAPPY HOUSE NOTICE")
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
//	@ApiOperation(value = "모든 공지사항 목록을 반환한다.")
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public ResponseEntity<Map<String, Object>> list(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) throws SQLException {
//		System.out.println("listboard");
//		Page page = new Page(1, 10);
//		page.setPageNo(Integer.parseInt(pageNo));
//		Map<String, Object> boards = boardService.boardList(page);
//		if (boards.isEmpty()) {
//			return new ResponseEntity(HttpStatus.NO_CONTENT);
//		}
//		return new ResponseEntity<Map<String, Object>>(boards, HttpStatus.OK);
//	}
	@ApiOperation(value = "모든 공지사항 목록을 반환한다.")
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<List<Board>> list() throws SQLException {
		System.out.println("listboard");
		
		List<Board> boards = boardService.boardAllList();
		if (boards.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Board>>(boards, HttpStatus.OK);
	}
	
	@ApiOperation(value = "특정 공지사항 글을 반환한다.")
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ResponseEntity<Board> detail(Model model, @RequestParam(value="idx") int idx) throws SQLException {
		System.out.println("detailboard");
		Board board = boardService.boardSelect(idx);
		return new ResponseEntity<Board>(board, HttpStatus.OK);
	}
	
	@ApiOperation(value = "특정 공지사항 글을 삭제한다.")
	@RequestMapping(value = "delete", method = RequestMethod.DELETE)
	public ResponseEntity delete(@RequestParam(value="idx") int idx) throws SQLException {
		System.out.println("deleteboard");
		boardService.boardDelete(idx);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@ApiOperation(value = "특정 공지사항 글을 수정한다.")
	@RequestMapping(value = "modify", method = RequestMethod.PUT)
	public ResponseEntity modify(Model model, @ModelAttribute Board board) throws SQLException {
		System.out.println("updateboard");
		boardService.boardUpdate(board);
		return new ResponseEntity(HttpStatus.OK);
	}
	
	@ApiOperation(value = "특정 공지사항 글을 작성한다.")
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public ResponseEntity write(Model model, @ModelAttribute Board board) throws Exception {
		System.out.println("writeboard");
		try{
			boardService.boardInsert(board);
			return new ResponseEntity(HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.BAD_REQUEST);
		}
		
	}
}
