package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.InterestArea;
import com.ssafy.happyhouse.model.mapper.InterestMapper;

@Service
public class InterestServiceImpl implements InterestService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<InterestArea> selectAll(String userid) throws Exception{
		System.out.println(userid);
		System.out.println(sqlSession.getMapper(InterestMapper.class).interestList(userid));
		return sqlSession.getMapper(InterestMapper.class).interestList(userid);
	}
	
	@Override
	public int interestInsert(String word, String userid) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).interestInsert(word, userid);
	}

	@Override
	public int interestDelete(String word) throws SQLException {
		return sqlSession.getMapper(InterestMapper.class).interestDelete(word);
	}

	
}
