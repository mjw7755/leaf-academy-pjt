package com.leaf.model.tnotice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TnoticeDAOImpl implements TnoticeDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<TnoticeDTO> getTnoticeList(int page) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		return dao.getTnoticeList(page);
	}

	@Override
	public int getCount() {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		return dao.getCount();
	}

	@Override
	public int search_getCount(Map<String, Object> map) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		return dao.search_getCount(map);
	}

	@Override
	public void insertTnotice(TnoticeDTO dto) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		dao.insertTnotice(dto);
	}

	@Override
	public List<TnoticeDTO> searchTnotice(Map<String, Object> map) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		return dao.searchTnotice(map);
	}

	@Override
	public TnoticeDTO getTnoticeById(int tnotice_id) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		return dao.getTnoticeById(tnotice_id);
	}

	@Override
	public void updateTnotice(TnoticeDTO dto) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		dao.updateTnotice(dto);
	}

	@Override
	public void deleteTnotice(TnoticeDTO dto) {
		TnoticeDAO dao = sqlsession.getMapper(TnoticeDAO.class);
		dao.deleteTnotice(dto);
	}
}
