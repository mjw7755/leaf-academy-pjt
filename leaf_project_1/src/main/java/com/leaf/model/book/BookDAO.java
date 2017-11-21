package com.leaf.model.book;

import java.util.List;
import java.util.Map;

public interface  BookDAO {
	
	public List<BookDTO> getBookList(int page); 
	public int getCount();
	public int search_getCount(Map<String, Object> map);
	
	public void insertBook(BookDTO dto);
	public List<BookDTO> searchBook(Map<String, Object> map); 
	
	public BookDTO getBookById(int Book_id);
	public void updateBook(BookDTO dto); 
	
	public void deleteBook(BookDTO dto); 
	public void multideleteBook(List<String> deleteTarget); 
	public void deletecancleBook(BookDTO dto); 
	
}
