package com.leaf.model.member;

public class MemberDTO {

	private String member_id, member_pwd, member_name, member_tel, member_email, member_level,member_address;
	private int enabled;
	
	public MemberDTO() {	}
	
	public MemberDTO(String member_id, String member_pwd, String member_name, String member_tel, String member_email,
			String member_level,String member_address, int enabled) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_level = member_level;
		this.member_address = member_address;
		this.enabled = enabled;
	}

	
	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_id() {
		return member_id;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_tel=" + member_tel + ", member_email=" + member_email + "]";
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
}
