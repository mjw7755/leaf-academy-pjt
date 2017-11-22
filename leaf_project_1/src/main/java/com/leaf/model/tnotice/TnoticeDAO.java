package com.leaf.model.tnotice;

import java.util.List;
import java.util.Map;

public interface  TnoticeDAO {
	
	public List<TnoticeDTO> getTnoticeList(int page); 
	public int getCount();
	public int search_getCount(Map<String, Object> map);
	
	public void insertTnotice(TnoticeDTO dto);
	public List<TnoticeDTO> searchTnotice(Map<String, Object> map); 
	
	public TnoticeDTO getTnoticeById(int tnotice_id);
	public void updateTnotice(TnoticeDTO dto); 
	
	public void deleteTnotice(TnoticeDTO dto); 
	
}
