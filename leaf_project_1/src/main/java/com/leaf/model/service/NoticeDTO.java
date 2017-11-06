package com.leaf.model.service;

public class NoticeDTO {
	private int notice_id;
	private String member_id;
	private String notice_title;
	private String notice_content;
	private String notice_writedate;
	private String notice_modifydate;
	private int enabled;
	
	public NoticeDTO() {}

	public NoticeDTO(int notice_id, String member_id, String notice_title, String notice_content,
			String notice_writedate, String notice_modifydate, int enabled) {
		super();
		this.notice_id = notice_id;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writedate = notice_writedate;
		this.notice_modifydate = notice_modifydate;
		this.enabled = enabled;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writedate() {
		return notice_writedate;
	}

	public void setNotice_writedate(String notice_writedate) {
		this.notice_writedate = notice_writedate;
	}

	public String getNotice_modifydate() {
		return notice_modifydate;
	}

	public void setNotice_modifydate(String notice_modifydate) {
		this.notice_modifydate = notice_modifydate;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	
}
