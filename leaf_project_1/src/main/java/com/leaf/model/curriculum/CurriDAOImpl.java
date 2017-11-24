package com.leaf.model.curriculum;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.curriculum.LectDAO;



@Component
public class CurriDAOImpl implements CurriDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CurriDTO> listCurri() {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.listCurri();
	}

	@Override
	public void insertCurri(CurriDTO dto) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		dao.insertCurri(dto);
	}

	@Override
	public int deleteCurri(int curri_id) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.deleteCurri(curri_id);
	}

	@Override
	public void updateCurri(CurriDTO dto) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		dao.updateCurri(dto);
	}

	@Override
	public CurriDTO updateFormCurri(int curri_id) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.getCurriByCurri_id(curri_id);
	}

	@Override
	public CurriDTO getCurriByCurri_id(int curri_id) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.getCurriByCurri_id(curri_id);
	}

	@Override
	public List<CurriDTO> searchCurri(Map<String, Object> map) {
		CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.searchCurri(map);
	}

	
	 /*@Override
	 public CurriDTO detailCurri(int lect_id ) throws ClassNotFoundException, SQLException{
		CurriDAO dao =  sqlSession.getMapper(CurriDAO.class);
		 return dao.detailCurri(lect_id);
	 }*/

	 @Override
	 public List<CurriDTO> detailCurri(int lect_id ) throws ClassNotFoundException, SQLException{
		CurriDAO dao =  sqlSession.getMapper(CurriDAO.class);
		 return dao.detailCurri(lect_id);
	 }
	 
	@Override
	public int getCount() {
		CurriDAO dao =  sqlSession.getMapper(CurriDAO.class);
		return dao.getCount();
	}

	@Override
	public List<CurriDTO> listCurri(int page) {
		CurriDAO dao =  sqlSession.getMapper(CurriDAO.class);
		return dao.listCurri(page);
	}

	@Override
	public int getSearchCount(Map<String, Object> map) {
		 CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.getSearchCount(map);
	}

	@Override
	public List<CurriDTO> monthlistCurri(Map map) {
		 CurriDAO dao = sqlSession.getMapper(CurriDAO.class);
		return dao.monthlistCurri(map);
	}
}
