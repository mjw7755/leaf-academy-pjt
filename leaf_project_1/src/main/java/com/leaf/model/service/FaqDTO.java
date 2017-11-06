package com.leaf.model.service;

public class FaqDTO {
	private int faq_id;
	private String faq_title;
	private String faq_content;
	private int enabled;
	
	public FaqDTO() {}

	public FaqDTO(int faq_id, String faq_title, String faq_content, int enabled) {
		super();
		this.faq_id = faq_id;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.enabled = enabled;
	}

	public int getFaq_id() {
		return faq_id;
	}

	public void setFaq_id(int faq_id) {
		this.faq_id = faq_id;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	
}
