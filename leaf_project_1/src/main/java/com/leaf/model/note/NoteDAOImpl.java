package com.leaf.model.note;

import java.util.List;
import java.util.Map;

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

	@Override
	public int writeMulNote(Map<String, Object> map) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.writeMulNote(map);
	}

	@Override
	public List<NoteDTO> getNoteList(Map<String,Object> noteListMap) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.getNoteList(noteListMap);
	}

	@Override
	public int allNoteCount(String sessionid) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.allNoteCount(sessionid);
	}
}
