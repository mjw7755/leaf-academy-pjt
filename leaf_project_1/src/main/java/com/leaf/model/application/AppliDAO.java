package com.leaf.model.application;

import java.util.List;

import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

public interface AppliDAO {

	public List<AppliDTO> listAppli(); 
	
	public void insertAppli(AppliDTO dto); 

	public AppliDTO getAppliById(int appli_id); 
	
	public int deleteAppli(int appli_id);

	public LectDTO listformappli(int lect_id); 
	
	public CurriDTO curri(int curri_id);
	public LectDTO lect(int lect_id);
	public MemberDTO member(String member_id);
}
