package com.leaf.model.curriculum;

import java.util.List;
import java.util.Map;

import com.leaf.model.curriculum.CurriDTO;

public interface LectDAO {

public List<LectDTO> listLect(int page);
	
	public void insertLect(LectDTO dto);

	public int deleteLect(int lect_id);

	public void updateLect(LectDTO dto);

	public LectDTO updateFormLect(int lect_id);

	public LectDTO getLectByLect_id(int lect_id);

	public List<LectDTO> searchLect(Map<String, Object> map);

	public int getCount();

	public int getSearchCount(Map<String, Object> map);
	
	public int multiDeleteLect(List deleteTargets);

	public List<CurriDTO> subjectcurri(String member_id);

	public LectDTO getCheckDate(int lect_id);

	public String getLectName(int lect_id);
	
	public int getLectId(String sessionid);
}
