package com.leaf.model.curriculum;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;



public interface CurriDAO {
	
public List<CurriDTO> getCurriList();
	

	public int deleteCurri(int curri_id);

	public void updateCurri(CurriDTO dto);

	public CurriDTO updateFormCurri(int curri_id);

	public List<CurriDTO> searchCurriList(Map<String, String> map);

	public void insertCurri(CurriDTO dto);


	public int curriDetail(int curri_id) throws ClassNotFoundException, SQLException;


	public CurriDTO getCurriByCurri_id(int curri_id);


	public int getCount();
	public List<CurriDTO> getCurriList(int page);
}
