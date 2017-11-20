package com.leaf.model.backend;

import java.util.List;
import java.util.Map;

import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

public interface BackEndDAO {
	
	public int deleteBackEnd();
	public List<LectDTO> searchlect(Map<String, Object> map);
	
	
	public List<CurriDTO> curri(int curri_id);
	public List<LectDTO> lect(int lect_id);
	public List<MemberDTO> member(String member_id);
}
