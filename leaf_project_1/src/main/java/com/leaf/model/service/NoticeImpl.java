package com.leaf.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeImpl implements NoticeDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDTO> noticeSelect(int page) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.noticeSelect(page);
	}

	@Override
	public int getCount() {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.getCount();
	}

	@Override
	public void noticeInsert(NoticeDTO dto) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.noticeInsert(dto);
	}

	@Override
	public int noticeDelete(int notice_id) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.noticeDelete(notice_id);
	}

	@Override
	public NoticeDTO noticeSelectId(int notice_id) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.noticeSelectId(notice_id);
	}

	@Override
	public int noticeUpdate(NoticeDTO dto) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.noticeUpdate(dto);			
	}

	@Override
	public int multiqnaDelete(List deleteTargets) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.multiqnaDelete(deleteTargets);
	}

	@Override
	public List<NoticeDTO> searchSelect(Map<String, Object> map) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.searchSelect(map);
	}

	@Override
	public void insertQna_ref(int qna_id) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.insertQna_ref(qna_id);
	}

	@Override
	public int getCount2(Map<String, Object> map) {
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		return dao.getCount2(map);
	}
}
