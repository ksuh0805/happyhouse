package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
//@RequestMapping("/user")
//@RequestMapping(value="/", method = RequestMethod.POST)
//@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() 
	{ return "index"; }
	 
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			Member memberDto = userService.login(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				
				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
//				if("saveok".equals(map.get("idsave"))) {
//					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
//				} else {
//					cookie.setMaxAge(0);
//				}
				response.addCookie(cookie);
				
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/user/list", method = RequestMethod.GET)
	public String list() {
		return "user/list";
	}
	
}
