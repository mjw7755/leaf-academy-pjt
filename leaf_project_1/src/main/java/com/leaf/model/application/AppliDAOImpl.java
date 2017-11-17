package com.leaf.model.application;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

}
