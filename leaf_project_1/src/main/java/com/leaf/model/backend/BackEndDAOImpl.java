package com.leaf.model.backend;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.curriculum.CurriDTO;
import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;
@Component
public class BackEndDAOImpl implements BackEndDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<CurriDTO> curri(int curri_id) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.curri(curri_id);
	}

	@Override
	public List<LectDTO> lect(int lect_id) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.lect(lect_id);
	}

	@Override
	public List<MemberDTO> member(String member_id) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.member(member_id);
	}

	@Override
	public int deleteBackEnd() {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.deleteBackEnd();
	}

	@Override
	public List<LectDTO> searchlect(Map<String, Object> map) {
		BackEndDAO dao= sqlsession.getMapper(BackEndDAO.class);
		return dao.searchlect(map);
	}
}
