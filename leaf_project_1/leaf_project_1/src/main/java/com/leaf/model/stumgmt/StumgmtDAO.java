package com.leaf.model.stumgmt;

import java.util.List;
import java.util.Map;

import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

public interface StumgmtDAO {
	public List<MemberDTO> getStudents(int lect_id);
	public String getStudentName(String member_id);
	public void insertStuExcel(Map<String,Object> makeExcelName);
	public String getStuExcel(Map<String,Object> getExcelMap);
	public List<LectDTO> getMyLect(String sessionid);
	public void payStudentInsert(Map<String,Integer> payment_id_map);
}
