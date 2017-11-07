package com.leaf.model.book;

import java.util.List;
import java.util.Map;

public interface  BookDAO {
	
	public List<BookDTO> getBookList(int page); //select All
	public int getCount(); //paging
	public int search_getCount(Map<String, Object> map); //paging
	
	public void insertBook(BookDTO dto); // insert
	public List<BookDTO> searchBook(Map<String, Object> map); // search
	
	public BookDTO getBookById(int Book_id); // Book_id�� ����
	public void updateBook(BookDTO dto); // Book_id�� ���� ������ �����ͼ� update
	
	public void deleteBook(BookDTO dto); // Book_id�� ���� ������ ����
	public void multideleteBook(List<String> deleteTarget); // ���߻���
	public void deletecancleBook(BookDTO dto); // Book_id�� ���� ������ �������
	
}
