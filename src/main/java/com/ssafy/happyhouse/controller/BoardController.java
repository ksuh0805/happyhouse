package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping(value = {"/", "/board"})
	public String list(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) throws SQLException {
		System.out.println("listboard");
		Page page = new Page(1, 10);
		page.setPageNo(Integer.parseInt(pageNo));
		model.addAttribute("result", boardService.boardList(page));
		return "/board/board";
	}
	@GetMapping("detail")
	public String detail(Model model, @RequestParam(value="idx") int idx) throws SQLException {
		System.out.println("detailboard");
		model.addAttribute("board", boardService.boardSelect(idx));
		return "/board/detail";
	}
	@GetMapping("delete")
	public String delete(@RequestParam(value="idx") int idx) throws SQLException {
		System.out.println("deleteboard");
		boardService.boardDelete(idx);
		return "redirect:/board/";
	}
	@RequestMapping("modify")
	public String modify(Model model, @ModelAttribute Board board) throws SQLException {
		System.out.println("updateboard");
		boardService.boardUpdate(board);
//		return "/board/detail?idx=" + board.getIdx();
		return "redirect:/board/";
	}
	@RequestMapping("write")
	public String write(Model model, @ModelAttribute Board board) throws Exception {
		System.out.println("writeteboard");
		boardService.boardInsert(board);
		return "redirect:/board/";
	}
	@GetMapping("mvmodify")
	public String mvmodify(Model model, @RequestParam(value="idx") int idx) throws SQLException {
		model.addAttribute("idx", idx);
		return "/board/modifypage";
	}
	@GetMapping("mvwrite")
	public String mvwrite(Model model) throws SQLException {
		return "/board/writepage";
	}
}
