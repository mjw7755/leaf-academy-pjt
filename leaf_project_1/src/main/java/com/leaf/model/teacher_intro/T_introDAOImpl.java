package com.leaf.model.teacher_intro;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.leaf.model.teacher_intro.T_introDAO;

@Component
public class T_introDAOImpl implements T_introDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	   public int getCount() {
	      T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
	      return dao.getCount();
	   }
	   
	   @Override
	   public List<T_introDTO> getT_introList(int page) {
	      T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
	      return dao.getT_introList(page);
	   }

	@Override
	public void insertT_intro(T_introDTO dto) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		dao.insertT_intro(dto);		
	}

	@Override
	public int updateT_intro(T_introDTO dto) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		System.out.println(dto.toString());
		return dao.updateT_intro(dto);
		
	}

	@Override
	public T_introDTO getT_introByteacher_id(int teacher_id) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		return dao.getT_introByteacher_id(teacher_id);
	}

	@Override
	public int deleteT_intro(int teacher_id) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		return dao.deleteT_intro(teacher_id);
	}

	@Override
	public int multideleteT_intro(List deleteTarget) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		return dao.multideleteT_intro(deleteTarget);
	}

	@Override
	public List<T_introDTO> searchT_introList(Map map) {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		return dao.searchT_introList(map);
	}

	@Override
	public T_introDTO content(int teacher_id) throws Exception {
		T_introDAO dao = sqlSession.getMapper(T_introDAO.class);
		return dao.content(teacher_id);
	}

	}

	/*@Override
	public void addAttach(String fullName) {
	    sqlSession.insert("board.addAttach", fullName);//board변경 필
	}*/



