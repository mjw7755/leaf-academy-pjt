package com.leaf.model.application;

import java.util.List;

public interface AppliDAO {

	public List<AppliDTO> listAppli(); 
	
	public void insertAppli(AppliDTO dto); 

	public AppliDTO getAppliById(int appli_id); 
	
	public int deleteAppli(int appli_id); 
	
}
