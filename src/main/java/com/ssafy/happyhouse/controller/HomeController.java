package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/")
	public String home(Model model, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) throws SQLException {
		Page page = new Page(1, 10);
		page.setPageNo(Integer.parseInt(pageNo));
		model.addAttribute("result", boardService.boardList(page));
		model.addAttribute("top", boardService.boardTop());
		return "index";
	}
	
	@GetMapping("chatPage")
	public String chatPage() throws SQLException {
		return "/chatPage";
	}
	
	@GetMapping("chartPage")
	public String chartPage() throws SQLException {
		System.out.println("ch");
		return "/chart/chart2";
	}
	
	
	 @RequestMapping("/chatPage") public ModelAndView chat() { ModelAndView mv =
	 new ModelAndView("chat"); return mv; }
	 
}
