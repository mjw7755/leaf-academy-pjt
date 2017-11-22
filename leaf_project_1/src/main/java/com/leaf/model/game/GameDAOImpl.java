package com.leaf.model.game;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.teacher_intro.ReviewDAO;
import com.leaf.model.teacher_intro.ReviewDTO;

@Component
public class GameDAOImpl implements GameDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public void insertScore(GameDTO dto) {
		GameDAO dao = sqlSession.getMapper(GameDAO.class);
		dao.insertScore(dto);
	}
	
	public int updateScore(GameDTO dto) {
		GameDAO dao = sqlSession.getMapper(GameDAO.class);
		return dao.updateScore(dto);
	}
	
	public List<GameDTO> getScoreList(String id) {
		GameDAO dao = sqlSession.getMapper(GameDAO.class);
		return dao.getScoreList(id);
	}
}
