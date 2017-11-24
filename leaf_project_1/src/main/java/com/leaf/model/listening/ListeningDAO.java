package com.leaf.model.listening;

import java.util.List;

public interface ListeningDAO {
	public List<ListeningDTO> getClassList(String member_id);
	public List<String> getStudentList(int lect_id);
}
