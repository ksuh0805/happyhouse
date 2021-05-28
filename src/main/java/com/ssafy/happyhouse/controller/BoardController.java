package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.service.BoardService;
import com.ssafy.happyhouse.model.service.CommentService;

@Controller
//@RequestMapping("/")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Resource(name="com.ssafy.happyhouse.model.service.CommentService")
    CommentService mCommentService;
	
//	@GetMapping(value = {"/", "/board"})
//	public String list(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) throws SQLException {
//		System.out.println("listboard");
//		Page page = new Page(1, 10);
//		page.setPageNo(Integer.parseInt(pageNo));
//		model.addAttribute("result", boardService.boardList(page));
//		return "index";
//	}
	
	@GetMapping("/board/detail")
	public String detail(Model model, @RequestParam(value="idx") int idx, @ModelAttribute Board board) throws Exception {
		System.out.println("detailboard");
		model.addAttribute("board", boardService.boardSelect(idx));
		boardService.boardCount(board);
		/* mCommentService.commentListService(idx); */
		return "/board/detail";
	}
	@GetMapping("/board/delete")
	public String delete(@RequestParam(value="idx") int idx) throws SQLException {
		System.out.println("deleteboard");
		boardService.boardDelete(idx);
		return "redirect:/";
	}
	@RequestMapping("/board/modify")
	public String modify(Model model, @ModelAttribute Board board) throws SQLException {
		System.out.println("updateboard");
		boardService.boardUpdate(board);
//		return "/board/detail?idx=" + board.getIdx();
		return "redirect:/";
	}
	// 글작성
	@RequestMapping("/board/write")
	public String write(Model model, @ModelAttribute Board board) throws Exception {
		System.out.println("writeteboard");
		String str = board.getContent();
		str = str.replace("\r\n", "<br>");
		board.setContent(str);
		boardService.boardInsert(board);
		return "redirect:/";
	}
	@GetMapping("/board/mvmodify")
	public String mvmodify(Model model, @RequestParam(value="idx") int idx) throws SQLException {
		model.addAttribute("board", boardService.boardSelect(idx));
		return "/board/modifypage";
	}
	@GetMapping("/board/mvwrite")
	public String mvwrite(Model model) throws SQLException {
		return "/board/writepage";
	}

}
