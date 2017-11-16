package com.leaf.model.member;

import java.security.acl.Group;

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

	@NotEmpty(message="아이디를 입력해주세요.", groups={Group1.class})
	@Size(min=4, max=12, message="아이디는 4글자 이상 12글자 이하만 사용 가능 합니다.", groups= {Group2.class})
	@Pattern(message="사용할 수 없는 문자가 있습니다.(영 소, 대문자 숫자만 사용 가능)", regexp="^[A-Za-z0-9]{4,12}$", groups={Group3.class})
	private String member_id;
	
	@NotEmpty(message="비밀번호를 입력해주세요.", groups={Group4.class})
	@Size(min=4, max=16, message="비밀번호는 4글자 이상 16글자 이하만 사용 가능 합니다.", groups= {Group5.class})
	@Pattern(message="영문자 숫자 특수문자를 조합해주세요.", regexp="^((?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,16})$", groups={Group6.class})
	private String member_pwd;
	
	@NotEmpty(message="이름을 입력해주세요.", groups={Group7.class})
	@Size(min = 2, max = 6, message="이름은 2글자 이상 6글자 이하만 사용 가능 합니다.", groups= {Group8.class})
	private String member_name;
	
	@NotEmpty(message="전화번호를 입력해주세요.", groups={Group9.class})
	@Pattern(message="사용할 수 없는 문자가 있습니다.(숫자만 사용 가능)", regexp="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$", groups={Group10.class})
	private String member_tel;
	
	@NotEmpty(message="이메일을 입력해주세요.", groups={Group11.class})
	@Pattern(message="이메일을 양식에 맞게 적어주세요.(aaa@aaaa.com)", regexp="^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$",groups={Group12.class})
	private String member_email;
	
	private String member_level;
	
	@NotEmpty(message="우편번호를 입력해주세요.", groups={Group13.class})
	@Pattern(message="우편번호를 입력해주세요", regexp="^[0-9]{4,6}$", groups={Group14.class})
	private String member_addnum;
	
	@NotEmpty(message="주소를 입력해주세요.", groups={Group15.class})
	private String member_address;
	


	
	private String sel_value;
	private int enabled;
	
	public MemberDTO() {	}
	
	public MemberDTO(String member_id, String member_pwd, String member_name, String member_tel, String member_email,
			String member_level,String member_address, String member_addnum, int enabled) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_level = member_level;
		this.member_address = member_address;
		this.member_addnum = member_addnum;
		this.enabled = enabled;
	}

	
	public String getMember_addnum() {
		return member_addnum;
	}

	public void setMember_addnum(String member_addnum) {
		this.member_addnum = member_addnum;
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
