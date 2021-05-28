package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.Message;
import com.ssafy.happyhouse.model.service.BoardService;
import com.ssafy.happyhouse.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@Autowired
	BoardService boardService;

	// 글작성
		@RequestMapping("/message/send")
		public String write(Model model, @ModelAttribute Message message) throws Exception {
			messageService.messageSend(message);
			return "redirect:/";
		}
		
		@RequestMapping("/message/list")
		@ResponseBody
		public List<Message> list(Model model, @RequestParam(value="userid") String userid) throws SQLException {
			System.out.println(userid);
			
//			model.addAttribute("message", messageService.messageList(userid));
			return messageService.messageList(userid);
		}
		
		@RequestMapping("/message/detail")
		@ResponseBody
		public Message detail(Model model, @RequestParam(value="no") int no) throws Exception {
			System.out.println(no);
			return messageService.messageDetail(no);
		}
		
		
		@GetMapping("/message/delete")
		public String delete(@RequestParam(value="no") int no) throws SQLException {
			messageService.messageDelete(no);
			return "redirect:/";
		}
		/*
		 * @RequestMapping("/message/no") public void no(Model
		 * model, @RequestParam(value="no") int no) throws Exception {
		 * System.out.println(no); model.addAttribute("message", no); }
		 */
		
		
}
