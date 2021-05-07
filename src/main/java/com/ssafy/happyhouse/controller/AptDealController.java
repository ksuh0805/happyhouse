package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Page;
import com.ssafy.happyhouse.model.service.AptDealService;

@Controller
@RequestMapping("/aptdeal")
public class AptDealController {
	
	@Autowired
	AptDealService aptDealService;
	
	@GetMapping(value = {"/", "/search"})
	public String list(Model model) {
		System.out.println("list");
		//model.addAttribute("list", aptDealService.selectAll());
		return "/aptdeal/search";
	}
	@RequestMapping("/searchbyapt")
	public String listbyapt(Model model, @RequestParam(value="apt") String apt, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) {
		System.out.println(apt);
		if(apt.equals("")) {
			return "/aptdeal/search";
		}
		Page page = new Page(1, 10);
		page.setPageNo(Integer.parseInt(pageNo));
		model.addAttribute("result", aptDealService.listPageApt(page, apt));
		model.addAttribute("apt", apt);
		return "/aptdeal/search";
	}
	@RequestMapping("/searchbydong")
	public String listbydong(Model model, @RequestParam(value="dong") String dong, @RequestParam(value="pageNo", required=false, defaultValue="1") String pageNo) {
		System.out.println(dong);
		Page page = new Page(1, 10);
		page.setPageNo(Integer.parseInt(pageNo));
		model.addAttribute("result", aptDealService.listPageDong(page, dong));
		model.addAttribute("dong", dong);
		return "/aptdeal/search";
	}
//	@GetMapping("/searchbydong")
//	public String listbydong(Model model, @RequestParam(value="dong") String dong) {
//		System.out.println("dong : " + dong);
//		model.addAttribute("searchlist", aptDealService.selectByDong(dong));
//		model.addAttribute("dong", dong);
//		return "/aptdeal/search";
//	}
//	@GetMapping("/searchbyapt")
//	public String listbyapt(Model model, @RequestParam(value="apt") String apt) {
//		System.out.println("apt : " + apt);
//		if(apt.equals("")) {
//			return "/aptdeal/search";
//		}
//		model.addAttribute("searchlist", aptDealService.selectByApt(apt));
//		model.addAttribute("apt", apt);
//		return "/aptdeal/search";
//	}
}
