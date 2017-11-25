package com.leaf.model.member;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	public List<MemberDTO> getMemberList(int page); 
	public void insertMember(MemberDTO dto); 
	public int search_getCount(Map<String, Object> map); 

	public MemberDTO getMemberById(String member_id); 
	public void updateMember(MemberDTO dto); 
	
	public void deleteMember(MemberDTO dto);
	public void multideleteMember(List<String> deleteTarget); 
	
	public void upMember(MemberDTO dto); 
	public void multiupMember(List<String> upTarget); 
	
	public void levelupMember(MemberDTO dto); 
	public void multilevelupMember(List<String> levelupTarget); 
	
	public void leveldownMember(MemberDTO dto); 
	public void multileveldownMember(List<String> leveldownTarget); 
	
	public List<MemberDTO> searchMemberList(Map<String, Object> map); 
	public int getCount(); 
	
	public int getSessionCheck(MemberDTO dto); 
	boolean supports(Class<?> clazz);
	
	public int chkDupId(MemberDTO dto);
	public void memberbye(MemberDTO dto);
	public boolean checkPw(String member_id, String member_pwd);
	public void updateMember2(MemberDTO dto);
	public String member_check(String member_id);
	
	public int findOneByEmail(String member_email);
	
	boolean send(String subject, String text, String from, String to);
}
