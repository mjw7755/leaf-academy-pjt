package com.leaf.model.note;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.member.MemberDTO;

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

	@Override
	public int noteDelete(List<String> note_chk_values) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.noteDelete(note_chk_values);
	}

	@Override
	public NoteDTO noteContent(int n_id) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.noteContent(n_id);
	}

	@Override
	public List<NoteDTO> sendNoteList(Map<String,Object> sendNoteListMap) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.sendNoteList(sendNoteListMap);
	}

	@Override
	public int sendAllNoteCount(String sessionid) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.sendAllNoteCount(sessionid);
	}

	@Override
	public void noteOpenUpdate() {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		dao.noteOpenUpdate();
	}

	@Override
	public NoteDTO noteDelChk() {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.noteDelChk();
	}

	@Override
	public void noteDeleteDB(List<String> note_chk_values) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		dao.noteDeleteDB(note_chk_values);
	}

	@Override
	public MemberDTO selectMemberLevel(String sessionid) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.selectMemberLevel(sessionid);
	}

	@Override
	public List<MemberDTO> selectTeacher(String sessionid) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.selectTeacher(sessionid);
	}

	@Override
	public List<MemberDTO> selectStudent(String sessionid) {
		NoteDAO dao = sqlSession.getMapper(NoteDAO.class);
		return dao.selectStudent(sessionid);
	}
}
