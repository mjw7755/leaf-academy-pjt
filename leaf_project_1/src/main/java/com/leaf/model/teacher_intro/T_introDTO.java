package com.leaf.model.teacher_intro;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class T_introDTO {
	private int teacher_id, enabled;
	private String member_id, teacher_introduce, teacher_image;
	private String[] files;
	private MultipartFile uploadfile;
	
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_image() {
		return teacher_image;
	}
	public void setTeacher_image(String teacher_image) {
		this.teacher_image = teacher_image;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTeacher_introduce() {
		return teacher_introduce;
	}
	public void setTeacher_introduce(String teacher_introduce) {
		this.teacher_introduce = teacher_introduce;
	}
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public T_introDTO() {}
	public T_introDTO(int teacher_id, int enabled, String member_id, String teacher_introduce, String[] files) {
		super();
		this.teacher_id = teacher_id;
		this.enabled = enabled;
		this.member_id = member_id;
		this.teacher_introduce = teacher_introduce;
		this.files = files;
	}
	@Override
	public String toString() {
		return "T_introDTO [teacher_id=" + teacher_id + ", enabled=" + enabled + ", member_id=" + member_id
				+ ", teacher_introduce=" + teacher_introduce + ", files=" + Arrays.toString(files) + "]";
	}
	
	
	
}
