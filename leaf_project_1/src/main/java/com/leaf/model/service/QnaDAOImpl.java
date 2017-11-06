package com.leaf.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QnaDAOImpl implements QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<QnaDTO> qnaSelect(int page) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.qnaSelect(page);
	}

	@Override
	public void qnaInsert(QnaDTO dto) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		dao.qnaInsert(dto);
	}

	@Override
	public int qnaDelete(int qna_id) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.qnaDelete(qna_id);
	}

	@Override
	public int qnaUpdate(QnaDTO dto) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.qnaUpdate(dto);
	}

	@Override
	public QnaDTO qnaSelectId(int qna_id) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.qnaSelectId(qna_id);
	}



	@Override
	public int multiqnaDelete(List deleteTargets) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.multiqnaDelete(deleteTargets);
	}

	@Override
	public List<QnaDTO> searchSelect(Map<String, Object> map) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.searchSelect(map);
	}

	@Override
	public int getCount() {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.getCount();
	}

	@Override
	public void replyBoardStep(QnaDTO dto) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		dao.replyBoardStep(dto);
	}

	@Override
	public int replyBoard(QnaDTO dto) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.replyBoard(dto);
	}

	@Override
	public List<QnaDTO> selectAllQna() {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.selectAllQna();
	}

	@Override
	public void insertQna_ref(int qna_id) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		dao.insertQna_ref(qna_id);
	}

	@Override
	public int getCount2(Map<String, Object> map) {
		QnaDAO dao = sqlSession.getMapper(QnaDAO.class);
		return dao.getCount2(map);
	}


	
	
}
