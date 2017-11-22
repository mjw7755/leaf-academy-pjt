package com.leaf.model.tnotice;

public class TnoticeDTO {

	private String member_id, tnotice_title, tnotice_content;
	private int tnotice_id, enabled;

	public TnoticeDTO() {}	
	
	public TnoticeDTO(String member_id, String tnotice_title, String tnotice_content, int tnotice_id, int enabled) {
		super();
		this.member_id = member_id;
		this.tnotice_title = tnotice_title;
		this.tnotice_content = tnotice_content;
		this.tnotice_id = tnotice_id;
		this.enabled = enabled;
	}
		
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTnotice_title() {
		return tnotice_title;
	}
	public void setTnotice_title(String tnotice_title) {
		this.tnotice_title = tnotice_title;
	}
	public String getTnotice_content() {
		return tnotice_content;
	}
	public void setTnotice_content(String tnotice_content) {
		this.tnotice_content = tnotice_content;
	}
	public int getTnotice_id() {
		return tnotice_id;
	}
	public void setTnotice_id(int tnotice_id) {
		this.tnotice_id = tnotice_id;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

}
