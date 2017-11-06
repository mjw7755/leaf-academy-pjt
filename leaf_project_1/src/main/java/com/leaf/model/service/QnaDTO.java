package com.leaf.model.service;

import java.sql.Timestamp;

public class QnaDTO{
	private int qna_id;					// qna_id 번호
	private String member_id;			// member_id 아이디
	private String qna_title;			// qna_title 제목
	private String qna_content;			// qna_content 내용
	private String qna_writedate;	// qna_writedate 게시판 만든 날짜
	private String qna_modifydate;	// qna_modifydate 게시판 수정 날짜
	private int qna_level;				// qna_level 그룹 레벨
	private int qna_ref;				// qna_ref 그룹( 글에 대한...)
	private int qna_step;				// qna_step 그룹 스텝
	private int enabled;				// enabled

	public QnaDTO() {}

	public QnaDTO(int qna_id, String member_id, String qna_title, String qna_content, String qna_writedate,
			String qna_modifydate, int qna_level, int qna_ref, int qna_step, int enabled) {
		super();
		this.qna_id = qna_id;
		this.member_id = member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_writedate = qna_writedate;
		this.qna_modifydate = qna_modifydate;
		this.qna_level = qna_level;
		this.qna_ref = qna_ref;
		this.qna_step = qna_step;
		this.enabled = enabled;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_writedate() {
		return qna_writedate;
	}

	public void setQna_writedate(String qna_writedate) {
		this.qna_writedate = qna_writedate;
	}

	public String getQna_modifydate() {
		return qna_modifydate;
	}

	public void setQna_modifydate(String qna_modifydate) {
		this.qna_modifydate = qna_modifydate;
	}

	public int getQna_level() {
		return qna_level;
	}

	public void setQna_level(int qna_level) {
		this.qna_level = qna_level;
	}

	public int getQna_ref() {
		return qna_ref;
	}

	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}

	public int getQna_step() {
		return qna_step;
	}

	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "QnaDTO [qna_id=" + qna_id + ", member_id=" + member_id + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_writedate=" + qna_writedate + ", qna_modifydate=" + qna_modifydate
				+ ", qna_level=" + qna_level + ", qna_ref=" + qna_ref + ", qna_step=" + qna_step + ", enabled="
				+ enabled + "]";
	}
	
	
}
