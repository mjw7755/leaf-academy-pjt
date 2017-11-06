package com.leaf.model.jageok;

import java.util.List;
import java.util.Map;

public interface JageokDAO {

	public List<JageokDTO> getJageokList(int page); // select All
	public int getCount(); //paging
	
	public void insertJageok(JageokDTO dto); // insert
	public List<JageokDTO> Jageoksearch(Map map); // search
	
	public JageokDTO getJageokById(int Jageok_id); // Jageok_id�� ����
	public void updateJageok(JageokDTO dto); // Jageok_id�� ���� ������ �����ͼ� update
	
	public void deleteJageok(JageokDTO dto); // Jageok_id�� ���� ������ ����
	public void multideleteJageok(List<String> deleteTarget); // ���߻���
	public void deletecancle(JageokDTO dto); // Jageok_id�� ���� ������ �������
}
