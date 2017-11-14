package com.leaf.model.member;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberDTO {
	
	@Id    // 테이블의 primary key로 매핑됨
	@Size(min=2, max=8, message="아이디는 2~8자리이어야 합니다.")
	@NotEmpty(message="아이디는 필수로 입력해야 합니다.")
	private String member_id;
	
	@Size(min=4, max=10, message="패스워드는 4~10자 이상이어야 합니다.")
	@NotEmpty(message="비밀번호는 필수로 입력해야 합니다.")
	private String member_pwd;
	
	@Size(min = 2, max = 6, message="이름은 2~6자리이어야 합니다.")
	@NotEmpty(message="이름은 필수로 입력해야 합니다.")
	private String member_name;
	
	@Size(min=10, max=12, message="번호는 10~12자리어야 합니다.")
	@NotEmpty(message="전화번호는 필수로 입력해야 합니다.")
	private String member_tel;
	
	@NotEmpty(message="이메일은 필수로 입력해야 합니다.")
	private String member_email;
	
	private String member_level;
	
	@NotEmpty(message="주소를 입력해주세요")
	private String member_address;

	
	private String sel_value;
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

	
	public String getSel_value() {
		return sel_value;
	}

	public void setSel_value(String sel_value) {
		this.sel_value = sel_value;
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
