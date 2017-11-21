package com.leaf.model.jageok;

import java.util.List;
import java.util.Map;

public interface JageokDAO {

	public List<JageokDTO> getJageokList(int page);
	public int getCount();
	public int search_getCount(Map<String, Object> map);

	public void insertJageok(JageokDTO dto);
	public List<JageokDTO> Jageoksearch(Map<String, Object> map);
	
	public JageokDTO getJageokById(int Jageok_id);
	public void updateJageok(JageokDTO dto); 
	
	public void deleteJageok(JageokDTO dto); 
	public void multideleteJageok(List<String> deleteTarget); 
	public void deletecancle(JageokDTO dto); 
}
