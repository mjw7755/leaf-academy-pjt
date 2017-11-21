package com.leaf.model.note;

import java.util.List;
import java.util.Map;

public interface NoteDAO {
	public int writeNote(NoteDTO dto);
	public String getTeacherId(String studentId);
	public int writeMulNote(Map<String,Object> map);
	public List<NoteDTO> getNoteList(Map<String,Object> noteListMap);
	public int allNoteCount(String sessionid);
	}
