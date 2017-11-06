package com.leaf.model.book;

import java.util.List;
import java.util.Map;

public interface  BookDAO {
	
	public List<BookDTO> getBookList(int page); //select All
	public int getCount(); //paging
	
	public void insertBook(BookDTO dto); // insert
	public List<BookDTO> searchBook(Map<?, ?> map); // search
	
	public BookDTO getBookById(int Book_id); // Book_idë¡? ? ?
	public void updateBook(BookDTO dto); // Book_id? ??? ?°?´?° ê°?? ¸??? update
	
	public void deleteBook(BookDTO dto); // Book_id? ??? ?°?´?° ?­? 
	public void multideleteBook(List<String> deleteTarget); // ?¤ì¤ì­? 
	public void deletecancleBook(BookDTO dto); // Book_id? ??? ?°?´?° ?­? ì·¨ì
	
}
