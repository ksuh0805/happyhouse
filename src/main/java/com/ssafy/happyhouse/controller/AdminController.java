package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.UserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@RequestMapping("/admin")
@Api("어드민 컨트롤러 api v1")
@CrossOrigin("*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private UserService userService;

	@ApiOperation(value="회원목록", notes = "회원의 <big>전체목록</big>을 반환해 줍니다")
	@ApiResponses({
		@ApiResponse(code=200, message="회원목록ok"),
		@ApiResponse(code=404, message="페이지없어!!"),
		@ApiResponse(code=500, message="서버에러!!!"),
	})
	@GetMapping(value = "/user")
	public ResponseEntity<List<Member>> userList() {
		List<Member> list = userService.userList();
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
//			return new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
//			return new ResponseEntity(HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	@PostMapping(value = "/user")
	public ResponseEntity<List<Member>> userRegister(@RequestBody @ApiParam(value="회원한명의 정보") Member memberDto) {
		System.out.println("reg");
		int cnt = userService.userRegister(memberDto);
		if(cnt != 0) {
			List<Member> list = userService.userList();
			return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
//			return new ResponseEntity<Integer>(cnt, HttpStatus.CREATED);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value ="회원정보검색", notes = "userId에 해당하는 회원 한명을 리턴")
	@GetMapping(value = "/user/{userid}")
	public ResponseEntity<Member> userInfo(@PathVariable("userid") @ApiParam(value="검색할 회원 아이디") String userid) {
		logger.debug("파라미터 : {}", userid);
		Member memberDto = userService.userInfo(userid);
		if(memberDto != null)
			return new ResponseEntity<Member>(memberDto, HttpStatus.OK);
		else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
	
	@ApiOperation(value="회원정보수정", notes="회원의 정보를 수정합니다.")
	@PutMapping(value = "/user")
	public ResponseEntity<List<Member>> userModify(@RequestBody @ApiParam(value="수정 할 회원정보") Member memberDto) {
		userService.userModify(memberDto);
		List<Member> list = userService.userList();
		return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
	}
	
	@ApiOperation(value="회원정보삭제", notes="회원의 정보를 삭제합니다.")
	@DeleteMapping(value = "/user/{userid}")
	public ResponseEntity<List<Member>> userDelete(@PathVariable("userid") @ApiParam(value="삭제 할 회원정보") String userid) {
		userService.userDelete(userid);
		List<Member> list = userService.userList();
		return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
	}
	
}
