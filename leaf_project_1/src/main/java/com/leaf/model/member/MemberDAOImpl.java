package com.leaf.model.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<MemberDTO> getMemberList(int page) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.getMemberList(page);
	}

	@Override
	public void insertMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.insertMember(dto);
	}

	@Override
	public MemberDTO getMemberById(String member_id) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.getMemberById(member_id);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.updateMember(dto);
	}

	@Override
	public void deleteMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.deleteMember(dto);
	}

	@Override
	public void multideleteMember(List<String> deleteTarget) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.multideleteMember(deleteTarget);
	}

	@Override
	public void upMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.upMember(dto);
	}

	@Override
	public void multiupMember(List<String> upTarget) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.multiupMember(upTarget);
	}

	@Override
	public List<MemberDTO> searchMemberList(Map<String, Object> map) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.searchMemberList(map);
	}

	@Override
	public int getCount() {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.getCount();
	}

	@Override
	public void levelupMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.levelupMember(dto);
	}

	@Override
	public void multilevelupMember(List<String> levelupTarget) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.multilevelupMember(levelupTarget);
	}

	@Override
	public void leveldownMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.leveldownMember(dto);
	}

	@Override
	public void multileveldownMember(List<String> leveldownTarget) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.multileveldownMember(leveldownTarget);
	}

	@Override
	public int search_getCount(Map<String, Object> map) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.search_getCount(map);
	}

	@Override
	public String getSessionCheck(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.getSessionCheck(dto);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public int chkDupId(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.chkDupId(dto);
	}

	@Override
	public void memberbye(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.memberbye(dto);
	}

	@Override
	public boolean checkPw(String member_id, String member_pwd) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		/*
		 * boolean result = false; Map<String, String> map = new HashMap<String,
		 * String>(); map.put("member_id", member_id); map.put("member_pwd",
		 * member_pwd); int count = sqlsession.selectOne("member.checkPw", map);
		 * if(count == 1) result= true;
		 */
		return dao.checkPw(member_id, member_pwd);
	}

	@Override
	public void updateMember2(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.updateMember2(dto);
	}

	@Override
	public String member_check(String member_id) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.member_check(member_id);
	}

}
