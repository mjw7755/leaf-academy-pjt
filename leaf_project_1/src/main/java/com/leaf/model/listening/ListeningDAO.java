package com.leaf.model.listening;

import java.util.List;

public interface ListeningDAO {
	public List<ListeningDTO> getTeacherClassList(String member_id);
	public List<ListeningDTO> getStudentClassList(String member_id);
	public List<String> getStudentList(int lect_id);
	public String getTeacherid(int lect_id);
}
