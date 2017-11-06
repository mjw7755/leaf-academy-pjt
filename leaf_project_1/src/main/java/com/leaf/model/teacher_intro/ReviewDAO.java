package com.leaf.model.teacher_intro;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReviewDAO {
	public int getCount();//게시글 갯수

	public List<ReviewDTO> getReviewList(@Param("page")int page, @Param("teacher_id")String teacher_id); //select(all)
	
	public List<ReviewDTO> get_headline(String teacher_id); //select(headline)
	
	public void insertReivew(ReviewDTO dto); //insert
	
	public int updateReview(ReviewDTO dto); //update
	
	public ReviewDTO getReviewByreview_id(int review_id);
	
	public int deleteReview(int review_id);//delete
	
	public int multideleteReview(List deleteTarget); //다중 삭제
	
	public List<ReviewDTO> searchReviewList(Map map);//검색
	
	public ReviewDTO review_content(int review_id) throws Exception;
	
}
