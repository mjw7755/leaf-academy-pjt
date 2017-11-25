package com.leaf.model.listening;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ListeningDAOImpl implements ListeningDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ListeningDTO> getTeacherClassList(String member_id) {
		ListeningDAO dao =sqlSession.getMapper(ListeningDAO.class);
		return dao.getTeacherClassList(member_id);
	}
	@Override
	public List<ListeningDTO> getStudentClassList(String member_id) {
		ListeningDAO dao =sqlSession.getMapper(ListeningDAO.class);
		return dao.getStudentClassList(member_id);
	}
	@Override
	public List<String> getStudentList(int lect_id) {
		ListeningDAO dao =sqlSession.getMapper(ListeningDAO.class);
		return dao.getStudentList(lect_id);
	}
	@Override
	public String getTeacherid(int lect_id) {
		ListeningDAO dao =sqlSession.getMapper(ListeningDAO.class);
		return dao.getTeacherid(lect_id);
	}
}
