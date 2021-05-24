package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.Chart;
import com.ssafy.happyhouse.model.dto.InterestArea;
import com.ssafy.happyhouse.model.dto.WordcloudDTO;
import com.ssafy.happyhouse.model.mapper.InterestMapper;

@Service
public class InterestServiceImpl implements InterestService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int wordCheck(String word, String userid) throws Exception{
		return sqlSession.getMapper(InterestMapper.class).wordCheck(word, userid);
	}

	@Override
	public List<InterestArea> selectAll(String userid) throws Exception{
		return sqlSession.getMapper(InterestMapper.class).interestList(userid);
	}
	
	@Override
	public int interestInsert(String word, String userid) throws Exception {
		return sqlSession.getMapper(InterestMapper.class).interestInsert(word, userid);
	}

	@Override
	public int interestDelete(String word, String userid) throws SQLException {
		return sqlSession.getMapper(InterestMapper.class).interestDelete(word, userid);
	}
	
	@Override
	public List<Chart> countCheck() throws SQLException {
		return sqlSession.getMapper(InterestMapper.class).countCheck();
	}

	@Override
	public List<Chart> countGender(String gender) {
		return sqlSession.getMapper(InterestMapper.class).countGender(gender);
	}
	@Override
	public List<Chart> countAge(int age) {
		return sqlSession.getMapper(InterestMapper.class).countAge(age);
	}
	@Override
	public List<Chart> countJob(String job) {
		return sqlSession.getMapper(InterestMapper.class).countJob(job);
	}
	@Override
    public List<WordcloudDTO> listWordcloud(WordcloudDTO WordcloudDTO) {
        return sqlSession.getMapper(InterestMapper.class).wordcloudlist(WordcloudDTO);
    }
}
