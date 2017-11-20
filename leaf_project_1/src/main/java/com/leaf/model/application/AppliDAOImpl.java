package com.leaf.model.application;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;

@Component
public class AppliDAOImpl implements AppliDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<AppliDTO> listAppli() {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.listAppli();
	}
	
	@Override
	public LectDTO listformappli(int lect_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.listformappli(lect_id);
	}
	
	@Override
	public void insertAppli(AppliDTO dto) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		dao.insertAppli(dto);
	}

	@Override
	public AppliDTO getAppliById(int appli_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.getAppliById(appli_id);
	}

	@Override
	public int deleteAppli(int appli_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.deleteAppli(appli_id);
	}

	@Override
	public CurriDTO curri(int curri_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.curri(curri_id);
	}

	@Override
	public LectDTO lect(int lect_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.lect(lect_id);
	}

	@Override
	public MemberDTO member(String member_id) {
		AppliDAO dao = sqlsession.getMapper(AppliDAO.class);
		return dao.member(member_id);
	}

}
