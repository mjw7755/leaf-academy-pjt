package com.leaf.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class FaqDAOImpl implements FaqDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FaqDTO> faqSelect() {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.faqSelect();
	}

	@Override
	public void faqInsert(FaqDTO dto) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		dao.faqInsert(dto);
	}

	@Override
	public int faqDelete(int faq_id) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.faqDelete(faq_id);
	}

	@Override
	public FaqDTO faqSelectId(int faq_id) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.faqSelectId(faq_id);
	}

	@Override
	public int faqUpdate(FaqDTO dto) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.faqUpdate(dto);
	}

	@Override
	public int multiqnaDelete(List deleteTargets) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.multiqnaDelete(deleteTargets);
	}

	@Override
	public List<FaqDTO> searchSelect(Map<String, String> map) {
		FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
		return dao.searchSelect(map);
	}
	
	
}
