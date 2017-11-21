package com.leaf.model.stumgmt;

public class StudentDTO {
	private String member_id, student_excel;
	private int student_id, lect_id, student_call, student_conn;
	
	public StudentDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getStudent_excel() {
		return student_excel;
	}

	public void setStudent_excel(String student_excel) {
		this.student_excel = student_excel;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}

	public int getLect_id() {
		return lect_id;
	}

	public void setLect_id(int lect_id) {
		this.lect_id = lect_id;
	}

	public int getStudent_call() {
		return student_call;
	}

	public void setStudent_call(int student_call) {
		this.student_call = student_call;
	}

	public int getStudent_conn() {
		return student_conn;
	}

	public void setStudent_conn(int student_conn) {
		this.student_conn = student_conn;
	}

}
