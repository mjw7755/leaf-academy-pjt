package com.leaf.model.service;

import java.util.List;
import java.util.Map;



public interface NoticeDAO {
	public List<NoticeDTO> noticeSelect(int page); // select

	public int getCount(); // count
	
	public void noticeInsert(NoticeDTO dto); // insert

	public int noticeDelete(int notice_id); // delete
	
	public NoticeDTO noticeSelectId(int notice_id); // select id

	public int noticeUpdate(NoticeDTO dto); // update

	public int multiqnaDelete(List deleteTargets); // 다중 삭제

	public List<NoticeDTO> searchSelect(Map<String, Object> map); // search
	
	public void insertQna_ref(int qna_id);
	
	public int getCount2(Map<String, Object> map);
}
