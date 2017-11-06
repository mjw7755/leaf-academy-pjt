package com.leaf.model.curriculum;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.curriculum.CurriDAO;
import com.leaf.model.curriculum.CurriDTO;


@Component
public class LectDAOImpl implements LectDAO {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void insertLect(LectDTO dto) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		dao.insertLect(dto);

	}

	@Override
	public int deleteLect(int lect_id) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.deleteLect(lect_id);

	}

	@Override
	public void updateLect(LectDTO dto) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		dao.updateLect(dto);
	}

	@Override
	public LectDTO updateFormLect(int lect_id) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.getLectByLect_id(lect_id);
	}

	@Override
	public List<LectDTO> searchLectList(Map<String, Object> map) {
		LectDAO dao =sqlSession.getMapper(LectDAO.class);
		return dao.searchLectList(map);
	}

	@Override
	public LectDTO getLectByLect_id(int lect_id) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.getLectByLect_id(lect_id);
	}

	@Override
	public List<LectDTO> getLectList(int page) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.getLectList(page);
	}

	@Override
	public int getCount() {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.getCount();
	}

	@Override
	public int multiLectDelete(List deleteTargets) {
		LectDAO dao = sqlSession.getMapper(LectDAO.class);
		return dao.multiLectDelete(deleteTargets);
	}


	  @Override
	   public int getSearchCount(Map<String, Object> map) {
	      LectDAO dao = sqlSession.getMapper(LectDAO.class);
	      return dao.getSearchCount(map);
	   }
}


