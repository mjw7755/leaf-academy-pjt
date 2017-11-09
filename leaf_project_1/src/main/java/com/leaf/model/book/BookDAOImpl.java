package com.leaf.model.book;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<BookDTO> getBookList(int page) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		return dao.getBookList(page);
	}

	@Override
	public int getCount() {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		return dao.getCount();
	}

	@Override
	public void insertBook(BookDTO dto) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		dao.insertBook(dto);
	}

	@Override
	public BookDTO getBookById(int Book_id) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		return dao.getBookById(Book_id);
	}

	@Override
	public void updateBook(BookDTO dto) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		dao.updateBook(dto);
	}

	@Override
	public void deleteBook(BookDTO dto) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		dao.deleteBook(dto);
	}

	@Override
	public void multideleteBook(List<String> deleteTarget) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		dao.multideleteBook(deleteTarget);
	}

	@Override
	public void deletecancleBook(BookDTO dto) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		dao.deletecancleBook(dto);
	}
	
	@Override
	public int search_getCount(Map<String, Object> map) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		return dao.search_getCount(map);
	}
	
	@Override
	public List<BookDTO> searchBook(Map<String, Object> map) {
		BookDAO dao = sqlsession.getMapper(BookDAO.class);
		return dao.searchBook(map);
	}

}
