package com.leaf.model.curriculum;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface LectDAO {

	public List<LectDTO> getLectList(int page);
	
	public void insertLect(LectDTO dto);

	public int deleteLect(int lect_id);

	public void updateLect(LectDTO dto);

	public LectDTO updateFormLect(int lect_id);

	public LectDTO getLectByLect_id(int lect_id);

	public List<LectDTO> searchLectList(Map<String, Object> map);

	public int getCount();

	public int getSearchCount(Map<String, Object> map);
	
	public int multiLectDelete(List deleteTargets);

	
	
}
