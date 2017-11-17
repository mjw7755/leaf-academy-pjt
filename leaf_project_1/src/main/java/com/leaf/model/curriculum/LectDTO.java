package com.leaf.model.curriculum;



public class LectDTO {
	private String  lect_name, lect_start_day,
	lect_end_day, lect_start_time,
	lect_end_time, lect_write_time,
	lect_modify_time;
private int lect_id, curri_id, enabled, lect_accept, lect_person_num, lect_charge;
private String  member_id, curri_level, curri_subject, curri_content;




public String getLect_name() {
	return lect_name;
}
public void setLect_name(String lect_name) {
	this.lect_name = lect_name;
}
public String getLect_start_day() {
	return lect_start_day;
}
public void setLect_start_day(String lect_start_day) {
	this.lect_start_day = lect_start_day;
}
public String getLect_end_day() {
	return lect_end_day;
}
public void setLect_end_day(String lect_end_day) {
	this.lect_end_day = lect_end_day;
}
public String getLect_start_time() {
	return lect_start_time;
}
public void setLect_start_time(String lect_start_time) {
	this.lect_start_time = lect_start_time;
}
public String getLect_end_time() {
	return lect_end_time;
}
public void setLect_end_time(String lect_end_time) {
	this.lect_end_time = lect_end_time;
}
public String getLect_write_time() {
	return lect_write_time;
}
public void setLect_write_time(String lect_write_time) {
	this.lect_write_time = lect_write_time;
}
public String getLect_modify_time() {
	return lect_modify_time;
}
public void setLect_modify_time(String lect_modify_time) {
	this.lect_modify_time = lect_modify_time;
}
public int getLect_id() {
	return lect_id;
}
public void setLect_id(int lect_id) {
	this.lect_id = lect_id;
}
public int getCurri_id() {
	return curri_id;
}
public void setCurri_id(int curri_id) {
	this.curri_id = curri_id;
}
public int getEnabled() {
	return enabled;
}
public void setEnabled(int enabled) {
	this.enabled = enabled;
}
public int getLect_accept() {
	return lect_accept;
}
public void setLect_accept(int lect_accept) {
	this.lect_accept = lect_accept;
}
public int getLect_person_num() {
	return lect_person_num;
}
public void setLect_person_num(int lect_person_num) {
	this.lect_person_num = lect_person_num;
}
public int getLect_charge() {
	return lect_charge;
}
public void setLect_charge(int lect_charge) {
	this.lect_charge = lect_charge;
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
@Override
public String toString() {
	return "LectDTO [lect_name=" + lect_name + ", lect_start_day=" + lect_start_day + ", lect_end_day=" + lect_end_day
			+ ", lect_start_time=" + lect_start_time + ", lect_end_time=" + lect_end_time + ", lect_write_time="
			+ lect_write_time + ", lect_modify_time=" + lect_modify_time + ", lect_id=" + lect_id + ", curri_id="
			+ curri_id + ", enabled=" + enabled + ", lect_accept=" + lect_accept + ", lect_person_num="
			+ lect_person_num + ", lect_charge=" + lect_charge + ", member_id=" + member_id + ", curri_level="
			+ curri_level + ", curri_subject=" + curri_subject + ", curri_content=" + curri_content + "]";
}

public LectDTO() {}

public LectDTO(String lect_name, String lect_start_day, String lect_end_day, String lect_start_time,
		String lect_end_time, String lect_write_time, String lect_modify_time, int lect_id, int curri_id, int enabled,
		int lect_accept, int lect_person_num, int lect_charge, String member_id, String curri_level,
		String curri_subject, String curri_content) {
	super();
	this.lect_name = lect_name;
	this.lect_start_day = lect_start_day;
	this.lect_end_day = lect_end_day;
	this.lect_start_time = lect_start_time;
	this.lect_end_time = lect_end_time;
	this.lect_write_time = lect_write_time;
	this.lect_modify_time = lect_modify_time;
	this.lect_id = lect_id;
	this.curri_id = curri_id;
	this.enabled = enabled;
	this.lect_accept = lect_accept;
	this.lect_person_num = lect_person_num;
	this.lect_charge = lect_charge;
	this.member_id = member_id;
	this.curri_level = curri_level;
	this.curri_subject = curri_subject;
	this.curri_content = curri_content;
}


	
}
