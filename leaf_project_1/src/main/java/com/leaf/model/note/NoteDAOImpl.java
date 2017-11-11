package com.leaf.model.note;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoteDAOImpl implements NoteDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int writeNote(NoteDTO dto) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.writeNote(dto);
	}

	@Override
	public String getTeacherId(String studentId) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.getTeacherId(studentId);
	}
}
