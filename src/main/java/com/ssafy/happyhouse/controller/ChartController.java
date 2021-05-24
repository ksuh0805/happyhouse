package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssafy.happyhouse.model.dto.WordcloudDTO;
import com.ssafy.happyhouse.model.service.InterestService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	InterestService interestService;
	
	@GetMapping(value = {"/", "/chart"})
	public String chartpage(Model model) throws SQLException {
		model.addAttribute("chart2", interestService.countCheck());
		model.addAttribute("menjson", JSONArray.fromObject(interestService.countGender("남성")));
		model.addAttribute("womenjson", JSONArray.fromObject(interestService.countGender("여성")));
		model.addAttribute("json10", JSONArray.fromObject(interestService.countAge(10)));
		model.addAttribute("json20", JSONArray.fromObject(interestService.countAge(20)));
		model.addAttribute("json30", JSONArray.fromObject(interestService.countAge(30)));
		model.addAttribute("json40", JSONArray.fromObject(interestService.countAge(40)));
		model.addAttribute("json50", JSONArray.fromObject(interestService.countAge(50)));
		model.addAttribute("json60", JSONArray.fromObject(interestService.countAge(60)));
		model.addAttribute("studentjson", JSONArray.fromObject(interestService.countJob("학생")));
		model.addAttribute("nojobjson", JSONArray.fromObject(interestService.countJob("무직")));
		model.addAttribute("bussinessjson", JSONArray.fromObject(interestService.countJob("회사원")));
		model.addAttribute("engineerjson", JSONArray.fromObject(interestService.countJob("엔지니어")));
		model.addAttribute("teacherjson", JSONArray.fromObject(interestService.countJob("교사")));
		model.addAttribute("projson", JSONArray.fromObject(interestService.countJob("전문직")));
		model.addAttribute("freejson", JSONArray.fromObject(interestService.countJob("프리랜서")));
		model.addAttribute("housejson", JSONArray.fromObject(interestService.countJob("주부")));
		model.addAttribute("selfjson", JSONArray.fromObject(interestService.countJob("자영업")));
		model.addAttribute("farmjson", JSONArray.fromObject(interestService.countJob("농수산업")));
		model.addAttribute("publicjson", JSONArray.fromObject(interestService.countJob("공무원")));
		model.addAttribute("etcjson", JSONArray.fromObject(interestService.countJob("기타")));
		return "/chart/chart";
	}
	
	@RequestMapping(value="/wordcloudtest.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
    @ResponseBody
    public String wordcloud(HttpServletRequest request,WordcloudDTO WordcloudDTO) throws Exception{
            List<WordcloudDTO> list = interestService.listWordcloud(WordcloudDTO);

            String json = null;
            try {
                json = new ObjectMapper().writeValueAsString(list);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return json;

    }
}
