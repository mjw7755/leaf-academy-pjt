package com.leaf.model.note;

import java.util.List;
import java.util.Map;

import com.leaf.model.member.MemberDTO;

public interface NoteDAO {
	public int writeNote(NoteDTO dto);
	public String getTeacherId(String studentId);
	public int writeMulNote(Map<String,Object> map);
	public List<NoteDTO> getNoteList(Map<String,Object> noteListMap);
	public int allNoteCount(String sessionid);
	public int noteDelete(List<String> note_chk_values);
	public NoteDTO noteContent(int n_id);
	public List<NoteDTO> sendNoteList(Map<String,Object> sendNoteListMap);
	public int sendAllNoteCount(String sessionid);
	public void noteOpenUpdate();
	public List<NoteDTO> noteDelChk();
	public void noteDeleteDB(int n_id);
	public MemberDTO selectMemberLevel(String sessionid);
	public List<MemberDTO> selectTeacher(String sessionid);
	public List<MemberDTO> selectStudent(String sessionid);
	}
