package com.leaf.model.teacher_intro;

public class ReviewDTO {
	private String member_id, r_headline, r_content, r_write_time, r_modify_time;
	private int review_id, enabled, teacher_id;
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getR_headline() {
		return r_headline;
	}
	public void setR_headline(String r_headline) {
		this.r_headline = r_headline;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_write_time() {
		return r_write_time;
	}
	public void setR_write_time(String r_write_time) {
		this.r_write_time = r_write_time;
	}
	public String getR_modify_time() {
		return r_modify_time;
	}
	public void setR_modify_time(String r_modify_time) {
		this.r_modify_time = r_modify_time;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public ReviewDTO() {}
	public ReviewDTO(String member_id, int teacher_id, String r_headline, String r_content, String r_write_time,
			String r_modify_time, int review_id, int enabled) {
		super();
		this.member_id = member_id;
		this.teacher_id = teacher_id;
		this.r_headline = r_headline;
		this.r_content = r_content;
		this.r_write_time = r_write_time;
		this.r_modify_time = r_modify_time;
		this.review_id = review_id;
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "ReviewDTO [member_id=" + member_id + ", teacher_id=" + teacher_id + ", r_headline=" + r_headline
				+ ", r_content=" + r_content + ", r_write_time=" + r_write_time + ", r_modify_time=" + r_modify_time
				+ ", review_id=" + review_id + ", enabled=" + enabled + "]";
	}
	
	
}
