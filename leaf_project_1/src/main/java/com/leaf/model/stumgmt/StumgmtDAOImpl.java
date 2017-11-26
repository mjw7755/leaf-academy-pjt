package com.leaf.model.stumgmt;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.curriculum.LectDTO;
import com.leaf.model.member.MemberDTO;
@Component
public class StumgmtDAOImpl implements StumgmtDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> getStudents(int lect_id) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		return dao.getStudents(lect_id);
	}

	@Override
	public String getStudentName(String member_id) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		return dao.getStudentName(member_id);
	}

	@Override
	public void insertStuExcel(Map<String,Object> makeExcelName) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		dao.insertStuExcel(makeExcelName);
	}

	@Override
	public String getStuExcel(Map<String,Object> getExcelMap) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		return dao.getStuExcel(getExcelMap);
	}

	@Override
	public List<LectDTO> getMyLect(String sessionid) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		return dao.getMyLect(sessionid);
	}

	@Override
	public void payStudentInsert(Map<String,Integer> payment_id_map) {
		StumgmtDAO dao = sqlSession.getMapper(StumgmtDAO.class);
		dao.payStudentInsert(payment_id_map);
	}
	
}
