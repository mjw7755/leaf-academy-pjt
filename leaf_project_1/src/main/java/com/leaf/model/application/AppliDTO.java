package com.leaf.model.application;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
public class AppliDTO {

	@NotEmpty(message="우편번호를 입력해주세요.")
	@Pattern(message="우편번호를 입력해주세요", regexp="^[0-9]{4,6}$")
	private String appli_addnum;
	
	@NotEmpty(message="주소를 입력해주세요.")
	private String appli_address;
	private String appli_address2;
	private String member_id,appli_reciever, appli_tel, 
					appli_write_time, appli_caution;
	private int appli_id, lect_id,appli_accept, enabled;
	private String curri_subject, lect_charge;
	private int curri_id;
	
	private String member_tel, member_address, member_addnum, member_name,member_email;

	
	
	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getAppli_addnum() {
		return appli_addnum;
	}

	public void setAppli_addnum(String appli_addnum) {
		this.appli_addnum = appli_addnum;
	}

	public String getAppli_address() {
		return appli_address;
	}

	public void setAppli_address(String appli_address) {
		this.appli_address = appli_address;
	}

	public String getAppli_address2() {
		return appli_address2;
	}

	public void setAppli_address2(String appli_address2) {
		this.appli_address2 = appli_address2;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAppli_reciever() {
		return appli_reciever;
	}

	public void setAppli_reciever(String appli_reciever) {
		this.appli_reciever = appli_reciever;
	}

	public String getAppli_tel() {
		return appli_tel;
	}

	public void setAppli_tel(String appli_tel) {
		this.appli_tel = appli_tel;
	}

	public String getAppli_write_time() {
		return appli_write_time;
	}

	public void setAppli_write_time(String appli_write_time) {
		this.appli_write_time = appli_write_time;
	}

	public String getAppli_caution() {
		return appli_caution;
	}

	public void setAppli_caution(String appli_caution) {
		this.appli_caution = appli_caution;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getAppli_id() {
		return appli_id;
	}

	public void setAppli_id(int appli_id) {
		this.appli_id = appli_id;
	}

	public int getLect_id() {
		return lect_id;
	}

	public void setLect_id(int lect_id) {
		this.lect_id = lect_id;
	}

	public int getAppli_accept() {
		return appli_accept;
	}

	public void setAppli_accept(int appli_accept) {
		this.appli_accept = appli_accept;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getCurri_subject() {
		return curri_subject;
	}

	public void setCurri_subject(String curri_subject) {
		this.curri_subject = curri_subject;
	}

	public String getLect_charge() {
		return lect_charge;
	}

	public void setLect_charge(String lect_charge) {
		this.lect_charge = lect_charge;
	}

	public int getCurri_id() {
		return curri_id;
	}

	public void setCurri_id(int curri_id) {
		this.curri_id = curri_id;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_addnum() {
		return member_addnum;
	}

	public void setMember_addnum(String member_addnum) {
		this.member_addnum = member_addnum;
	}
	
	
	public AppliDTO() {	}

	@Override
	public String toString() {
		return "AppliDTO [appli_addnum=" + appli_addnum + ", appli_address=" + appli_address + ", appli_address2="
				+ appli_address2 + ", member_id=" + member_id + ", appli_reciever=" + appli_reciever + ", appli_tel="
				+ appli_tel + ", appli_write_time=" + appli_write_time + ", appli_caution=" + appli_caution
				+ ", member_name=" + member_name + ", appli_id=" + appli_id + ", lect_id=" + lect_id + ", appli_accept="
				+ appli_accept + ", enabled=" + enabled + ", curri_subject=" + curri_subject + ", lect_charge="
				+ lect_charge + ", curri_id=" + curri_id + ", member_tel=" + member_tel + ", member_address="
				+ member_address + ", member_addnum=" + member_addnum + "]";
	}

	public AppliDTO(String appli_addnum, String appli_address, String appli_address2, String member_id,
			String appli_reciever, String appli_tel, String appli_write_time, String appli_caution, String member_name,
			int appli_id, int lect_id, int appli_accept, int enabled, String curri_subject, String lect_charge,
			int curri_id, String member_tel, String member_address, String member_addnum) {
		super();
		this.appli_addnum = appli_addnum;
		this.appli_address = appli_address;
		this.appli_address2 = appli_address2;
		this.member_id = member_id;
		this.appli_reciever = appli_reciever;
		this.appli_tel = appli_tel;
		this.appli_write_time = appli_write_time;
		this.appli_caution = appli_caution;
		this.member_name = member_name;
		this.appli_id = appli_id;
		this.lect_id = lect_id;
		this.appli_accept = appli_accept;
		this.enabled = enabled;
		this.curri_subject = curri_subject;
		this.lect_charge = lect_charge;
		this.curri_id = curri_id;
		this.member_tel = member_tel;
		this.member_address = member_address;
		this.member_addnum = member_addnum;
	}
	
	
}
