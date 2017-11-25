package com.leaf.model.curriculum;

import java.util.List;
import java.util.Map;



public interface CurriDAO {
	
public List<CurriDTO> listCurri();
	

	public int deleteCurri(int curri_id);

	public void updateCurri(CurriDTO dto);

	public CurriDTO updateFormCurri(int curri_id);

	public void insertCurri(CurriDTO dto);

	public List<LectDAO> detailCurri(int curri_id);
	
	public CurriDTO curri_info(int curri_id);

	public CurriDTO getCurriByCurri_id(int curri_id);

	public int getCount();
	
	public List<CurriDTO> searchCurri(Map<String, Object> map);

	public int getSearchCount(Map<String, Object> map);

	public List<CurriDTO> listCurri(int page);




	public List<CurriDTO> monthlistCurri(Map map);
}
