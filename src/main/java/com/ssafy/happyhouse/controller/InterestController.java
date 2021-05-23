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
		System.out.println(interestService.selectAll(userid));
		return "/interest/Areaofinterest";
	}
	
	@PostMapping("insert")
	public String write(@ModelAttribute(value="word") String word,@ModelAttribute(value="userid") String userid) throws Exception {
		interestService.interestInsert(word, userid);
		return "redirect:/interest/";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam(value="word") String word) throws SQLException {
		interestService.interestDelete(word);
		return "redirect:/interest/";
	}
	
//	@GetMapping("detail")
//	public String detail(Model model, @RequestParam(value="word") String word) throws SQLException {
////		model.addAttribute("word", word);
//		return "redirect:/interest/";		
//	}
	
	
}
