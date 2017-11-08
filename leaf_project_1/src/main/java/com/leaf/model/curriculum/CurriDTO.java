package com.leaf.model.curriculum;

public class CurriDTO {
	private int curri_id, curri_accept, enabled;
	private String member_id, curri_level, curri_subject, curri_content,
					curri_write_time, curri_modify_time;
	
	public CurriDTO() {}

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCurri_level() {
		return curri_level;
	}

	public void setCurri_level(String curri_level) {
		this.curri_level = curri_level;
	}

	public String getCurri_subject() {
		return curri_subject;
	}

	public void setCurri_subject(String curri_subject) {
		this.curri_subject = curri_subject;
	}

	public String getCurri_content() {
		return curri_content;
	}

	public void setCurri_content(String curri_content) {
		this.curri_content = curri_content;
	}

	public String getCurri_write_time() {
		return curri_write_time;
	}

	public void setCurri_write_time(String curri_write_time) {
		this.curri_write_time = curri_write_time;
	}

	public String getCurri_modify_time() {
		return curri_modify_time;
	}

	public void setCurri_modify_time(String curri_modify_time) {
		this.curri_modify_time = curri_modify_time;
	}

	public int getCurri_accept() {
		return curri_accept;
	}

	public void setCurri_accept(int curri_accept) {
		this.curri_accept = curri_accept;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "CurriDTO [curri_id=" + curri_id + ", curri_accept=" + curri_accept + ", enabled=" + enabled
				+ ", member_id=" + member_id + ", curri_level=" + curri_level + ", curri_subject=" + curri_subject
				+ ", curri_content=" + curri_content + ", curri_write_time=" + curri_write_time + ", curri_modify_time="
				+ curri_modify_time + "]";
	}

	public CurriDTO(int curri_id, int curri_accept, int enabled, String member_id, String curri_level,
			String curri_subject, String curri_content, String curri_write_time, String curri_modify_time) {
		super();
		this.curri_id = curri_id;
		this.curri_accept = curri_accept;
		this.enabled = enabled;
		this.member_id = member_id;
		this.curri_level = curri_level;
		this.curri_subject = curri_subject;
		this.curri_content = curri_content;
		this.curri_write_time = curri_write_time;
		this.curri_modify_time = curri_modify_time;
	}

}
