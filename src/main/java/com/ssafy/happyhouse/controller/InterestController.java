package com.ssafy.happyhouse.controller;

import java.io.Console;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.service.InterestService;

@Controller
@RequestMapping("/interest")
public class InterestController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	InterestService interestService;
	
	@GetMapping(value= {"/", "/Areaofinterest", "/detail"})
	public String list(Model model, @ModelAttribute(value="userid")String userid) throws Exception {
		model.addAttribute("list", interestService.selectAll(userid));
		System.out.println("userid" + userid);
		return "/interest/Areaofinterest";
	}
	
	@PostMapping("insert")
	public String write(Model model,@ModelAttribute(value="word") String word,@ModelAttribute(value="userid") String userid) throws Exception {
		int result = interestService.wordCheck(word, userid);
		System.out.println(result);
		if(result==0) {
			interestService.interestInsert(word, userid);			
		}
		else {
			System.out.println("이미 즐겨찾기에 포함되어있습니다");
		}
		return "redirect:/interest/Areaofinterest?userid=" + userid;
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam(value="word") String word,@ModelAttribute(value="userid") String userid) throws SQLException {
		System.out.println("d" + userid);
		interestService.interestDelete(word, userid);
		return "redirect:/interest/Areaofinterest?userid=" + userid;
	}
	
//	@GetMapping("detail")
//	public String detail(Model model, @RequestParam(value="word") String word) throws SQLException {
////		model.addAttribute("word", word);
//		return "redirect:/interest/";		
//	}
	
	
}
