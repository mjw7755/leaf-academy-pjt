package com.leaf.model.note;

import java.sql.Timestamp;
import java.util.Map;

public class NoteDTO {
	int n_id;
	String n_content, n_title, n_send_id, n_recv_id, n_send_del_yn, n_recv_del_yn;
	Map<String,String> n_recv_id_mul;
	Timestamp n_open_date, n_write_date;
	
	
	public NoteDTO() {}
	
	public NoteDTO(int n_id, String n_content, String n_title, String n_send_id, String n_recv_id, String n_send_del_yn,
			String n_recv_del_yn, Timestamp n_open_date, Timestamp n_write_date) {
		super();
		this.n_id = n_id;
		this.n_content = n_content;
		this.n_title = n_title;
		this.n_send_id = n_send_id;
		this.n_recv_id = n_recv_id;
		this.n_send_del_yn = n_send_del_yn;
		this.n_recv_del_yn = n_recv_del_yn;
		this.n_open_date = n_open_date;
		this.n_write_date = n_write_date;
	}
	
	
	
	public Map<String, String> getN_recv_id_mul() {
		return n_recv_id_mul;
	}

	public void setN_recv_id_mul(Map<String, String> n_recv_id_mul) {
		this.n_recv_id_mul = n_recv_id_mul;
	}

	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_send_id() {
		return n_send_id;
	}
	public void setN_send_id(String n_send_id) {
		this.n_send_id = n_send_id;
	}
	public String getN_recv_id() {
		return n_recv_id;
	}
	public void setN_recv_id(String n_recv_id) {
		this.n_recv_id = n_recv_id;
	}
	public String getN_send_del_yn() {
		return n_send_del_yn;
	}
	public void setN_send_del_yn(String n_send_del_yn) {
		this.n_send_del_yn = n_send_del_yn;
	}
	public String getN_recv_del_yn() {
		return n_recv_del_yn;
	}
	public void setN_recv_del_yn(String n_recv_del_yn) {
		this.n_recv_del_yn = n_recv_del_yn;
	}
	public Timestamp getN_open_date() {
		return n_open_date;
	}
	public void setN_open_date(Timestamp n_open_date) {
		this.n_open_date = n_open_date;
	}
	public Timestamp getN_write_date() {
		return n_write_date;
	}
	public void setN_write_date(Timestamp n_write_date) {
		this.n_write_date = n_write_date;
	}
	
	
}
