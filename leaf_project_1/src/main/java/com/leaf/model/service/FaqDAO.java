package com.leaf.model.service;

import java.util.List;
import java.util.Map;


public interface FaqDAO {
	public List<FaqDTO> faqSelect();
	
	public void faqInsert(FaqDTO dto);
	
	public int faqDelete(int faq_id);
	
	public FaqDTO faqSelectId(int faq_id);
	
	public int faqUpdate(FaqDTO dto);
	
	public int multiqnaDelete(List deleteTargets); // 다중 삭제
	
	public List<FaqDTO> searchSelect(Map<String, String> map); // search
}
