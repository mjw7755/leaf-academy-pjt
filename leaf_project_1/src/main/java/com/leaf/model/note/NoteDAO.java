package com.leaf.model.note;

public interface NoteDAO {
	public int writeNote(NoteDTO dto);
	public String getTeacherId(String studentId);
	}
