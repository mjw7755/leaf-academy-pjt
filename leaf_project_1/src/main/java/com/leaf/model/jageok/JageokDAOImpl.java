package com.leaf.model.jageok;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JageokDAOImpl implements JageokDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<JageokDTO> getJageokList(int page) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		return dao.getJageokList(page);
	}

	@Override
	public int getCount() {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		return dao.getCount();
	}

	@Override
	public void insertJageok(JageokDTO dto) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		dao.insertJageok(dto);
	}

	@Override
	public List<JageokDTO> Jageoksearch(Map map) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		return dao.Jageoksearch(map);
	}

	@Override
	public JageokDTO getJageokById(int Jageok_id) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		return dao.getJageokById(Jageok_id);
	}

	@Override
	public void updateJageok(JageokDTO dto) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		dao.updateJageok(dto);
	}

	@Override
	public void deleteJageok(JageokDTO dto) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		dao.deleteJageok(dto);
	}

	@Override
	public void multideleteJageok(List<String> deleteTarget) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		dao.multideleteJageok(deleteTarget);
	}

	@Override
	public void deletecancle(JageokDTO dto) {
		JageokDAO dao = sqlsession.getMapper(JageokDAO.class);
		dao.deletecancle(dto);
	}

}
