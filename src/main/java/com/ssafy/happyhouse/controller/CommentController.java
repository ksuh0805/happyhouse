package com.ssafy.happyhouse.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.dto.CommentVO;
import com.ssafy.happyhouse.model.service.CommentService;
 

 
@Controller
@RequestMapping("/comment")
public class CommentController {
 
    @Resource(name="com.ssafy.happyhouse.model.service.CommentService")
    CommentService mCommentService;
    
    
    @RequestMapping("/list") //댓글 리스트
    @ResponseBody
    private List<CommentVO> mCommentServiceList(@RequestParam int bno) throws Exception{
        return mCommentService.commentListService(bno);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int bno, @RequestParam String content, @RequestParam String userid) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setBno(bno);
        comment.setContent(content);
        comment.setUserid(userid);
        System.out.println(userid);
        
        
        return mCommentService.commentInsertService(comment);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return mCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }
    
}
