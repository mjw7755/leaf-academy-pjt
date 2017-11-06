package com.leaf.model.service;

import java.util.List;
import java.util.Map;

public interface QnaDAO {
	public List<QnaDTO> qnaSelect(int page); // select
	
	public void qnaInsert(QnaDTO dto); // insert 
	
	public int qnaDelete(int qna_id); // delete
	
	public int qnaUpdate(QnaDTO dto); // update
	
	public QnaDTO qnaSelectId(int qna_id); // select id
	
	public int multiqnaDelete(List deleteTargets); // 다중 삭제
	
	public List<QnaDTO> searchSelect(Map<String, Object> map); // search
	
	public int getCount(); // selectAll
	
	public void replyBoardStep(QnaDTO dto); // 현재 답변의 단 게시물 보다 더 높은 스텝의 게시물이 있다면 스탭을 하나씩 상승시킴
	
	public int replyBoard(QnaDTO dto); // 답글 달기
	
	public List<QnaDTO> selectAllQna(); //select All qna
	
	public void insertQna_ref(int qna_id);
	
	public int getCount2(Map<String, Object> map);
	
}
