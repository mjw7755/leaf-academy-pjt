package com.leaf.model.member;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	public List<MemberDTO> getMemberList(int page); // selectAll
	public void insertMember(MemberDTO dto); // insert
	public MemberDTO getMemberById(String member_id); // member_id으로 선택
	public void updateMember(MemberDTO dto); // member_id 에 대한 데이터 가져와서 update
	
	public void deleteMember(MemberDTO dto); // member_id 에 대한 데이터 delete
	public void multideleteMember(List<String> deleteTarget); // 다중 삭제
	
	public void upMember(MemberDTO dto); // 권한주기
	public void multiupMember(List<String> upTarget); // 다중 권한 주기
	
	public void levelupMember(MemberDTO dto); // level 올려주기
	public void multilevelupMember(List<String> levelupTarget); // 다중 level 올려주기
	
	public void leveldownMember(MemberDTO dto); // level 내려주기
	public void multileveldownMember(List<String> leveldownTarget); // 다중 level 내려주기
	
	public List<MemberDTO> searchMemberList(Map map); // search
	public int getCount(); //selectAll
}
