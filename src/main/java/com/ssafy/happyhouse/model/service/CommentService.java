package com.ssafy.happyhouse.model.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.CommentVO;
import com.ssafy.happyhouse.model.mapper.CommentMapper;
 
 
@Service("com.ssafy.happyhouse.model.service.CommentService")
public class CommentService {
 
    @Resource(name="com.ssafy.happyhouse.model.mapper.CommentMapper")
    CommentMapper mCommentMapper;
    
    public List<CommentVO> commentListService(int bno) throws Exception{
        
        return mCommentMapper.commentList(bno);
    }
    
    public int commentInsertService(CommentVO comment) throws Exception{
        
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(CommentVO comment) throws Exception{
        
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int cno) throws Exception{
        
        return mCommentMapper.commentDelete(cno);
    }
}
