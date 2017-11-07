package com.leaf.model.teacher_intro;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getCount() {
	      ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
	      return dao.getCount();
	}


	@Override
	public List<ReviewDTO> get_headline(String teacher_id) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.get_headline(teacher_id);
	}

	@Override
	public void insertReivew(ReviewDTO dto) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		dao.insertReivew(dto);
	}


	@Override
	public List<ReviewDTO> getReviewList(int page, String teacher_id) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.getReviewList(page, teacher_id);
	}


	@Override
	public int updateReview(ReviewDTO dto) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.updateReview(dto);
	}


	@Override
	public ReviewDTO getReviewByreview_id(int review_id) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.getReviewByreview_id(review_id);
	}


	@Override
	public int deleteReview(int review_id) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.deleteReview(review_id);
	}


	@Override
	public int multideleteReview(List deleteTarget) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.multideleteReview(deleteTarget);
	}


	@Override
	public List<ReviewDTO> searchReviewList(Map map) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.searchReviewList(map);
	}


	@Override
	public ReviewDTO review_content(int review_id) throws Exception {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.review_content(review_id);
	}

	@Override
	public List<ReviewDTO> searchSelect(Map<String, Object> map) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.searchSelect(map);
	}

	@Override
	public int getCount2(Map<String, Object> map) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		return dao.getCount2(map);
	}

}
