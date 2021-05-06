package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/aptdeal")
public class AptDealController {
	
	@GetMapping("/search")
	public void aptdeal() {
	}
}
