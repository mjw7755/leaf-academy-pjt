package com.leaf.model.teacher_intro;

import java.util.List;
import java.util.Map;

import com.leaf.model.teacher_intro.T_introDTO;

public interface T_introDAO {

	public int getCount();//게시글 갯수

	public List<T_introDTO> getT_introList(int page); //select
	
	public void insertT_intro(T_introDTO dto); //insert
	
	public int updateT_intro(T_introDTO dto); //update
	
	public T_introDTO getT_introByteacher_id(int teacher_id); 
	
	public int deleteT_intro(int teacher_id);//delete
	
	public int multideleteT_intro(List deleteTarget); //다중 삭제
	
	public List<T_introDTO> searchT_introList(Map map);//검색
	
	 public T_introDTO content(int teacher_id) throws Exception;
	/*public void addAttach(String fullName) throws Exception;*/
}
