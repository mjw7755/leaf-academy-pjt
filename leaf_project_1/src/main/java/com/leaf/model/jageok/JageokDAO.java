package com.leaf.model.jageok;

import java.util.List;
import java.util.Map;

public interface JageokDAO {

	public List<JageokDTO> getJageokList(int page); // select All
	public int getCount(); //paging
	
	public void insertJageok(JageokDTO dto); // insert
	public List<JageokDTO> Jageoksearch(Map map); // search
	
	public JageokDTO getJageokById(int Jageok_id); // Jageok_id로 선택
	public void updateJageok(JageokDTO dto); // Jageok_id에 대한 데이터 가져와서 update
	
	public void deleteJageok(JageokDTO dto); // Jageok_id에 대한 데이터 삭제
	public void multideleteJageok(List<String> deleteTarget); // 다중삭제
	public void deletecancle(JageokDTO dto); // Jageok_id에 대한 데이터 삭제취소
}
