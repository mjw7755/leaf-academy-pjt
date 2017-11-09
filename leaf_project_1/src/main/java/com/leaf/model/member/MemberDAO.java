package com.leaf.model.member;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	public List<MemberDTO> getMemberList(int page); // selectAll
	public void insertMember(MemberDTO dto); // insert
	public int search_getCount(Map<String, Object> map); //paging

	public MemberDTO getMemberById(String member_id); // member_id���� ����
	public void updateMember(MemberDTO dto); // member_id �� ���� ������ �����ͼ� update
	
	public void deleteMember(MemberDTO dto); // member_id �� ���� ������ delete
	public void multideleteMember(List<String> deleteTarget); // ���� ����
	
	public void upMember(MemberDTO dto); // �����ֱ�
	public void multiupMember(List<String> upTarget); // ���� ���� �ֱ�
	
	public void levelupMember(MemberDTO dto); // level �÷��ֱ�
	public void multilevelupMember(List<String> levelupTarget); // ���� level �÷��ֱ�
	
	public void leveldownMember(MemberDTO dto); // level �����ֱ�
	public void multileveldownMember(List<String> leveldownTarget); // ���� level �����ֱ�
	
	public List<MemberDTO> searchMemberList(Map<String, Object> map); // search
	public int getCount(); //selectAll
	
	public String getSessionCheck(MemberDTO dto); // �α��� ��й�ȣ Ȯ��
	
}
