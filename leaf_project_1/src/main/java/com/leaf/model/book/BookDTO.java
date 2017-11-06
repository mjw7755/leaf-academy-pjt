package com.leaf.model.book;

public class BookDTO {

	private String member_id, book_title, book_writer, book_cost;
	private int book_id, enabled;

	public BookDTO() {	}
	
	public BookDTO(String member_id, String book_title, String book_writer, String book_cost, int book_id,
			int enabled) {
		super();
		this.member_id = member_id;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_cost = book_cost;
		this.book_id = book_id;
		this.enabled = enabled;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_cost() {
		return book_cost;
	}
	public void setBook_cost(String book_cost) {
		this.book_cost = book_cost;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "BookDTO [member_id=" + member_id + ", book_title=" + book_title + ", book_writer=" + book_writer
				+ ", book_cost=" + book_cost + ", book_id=" + book_id + ", enabled=" + enabled + "]";
	}
}
