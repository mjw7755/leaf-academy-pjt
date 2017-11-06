package com.leaf.model.jageok;

public class JageokDTO {

	private String member_id, jageok_title, jageok_date, jageok_cost;
	private int jageok_id, enabled;
	
	public JageokDTO() { }
	
	public JageokDTO(String member_id, String jageok_title, String jageok_date, String jageok_cost, int jageok_id,
			int enabled) {
		super();
		this.member_id = member_id;
		this.jageok_title = jageok_title;
		this.jageok_date = jageok_date;
		this.jageok_cost = jageok_cost;
		this.jageok_id = jageok_id;
		this.enabled = enabled;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getJageok_title() {
		return jageok_title;
	}
	public void setJageok_title(String jageok_title) {
		this.jageok_title = jageok_title;
	}
	public String getJageok_date() {
		return jageok_date;
	}
	public void setJageok_date(String jageok_date) {
		this.jageok_date = jageok_date;
	}
	public String getJageok_cost() {
		return jageok_cost;
	}
	public void setJageok_cost(String jageok_cost) {
		this.jageok_cost = jageok_cost;
	}
	public int getJageok_id() {
		return jageok_id;
	}
	public void setJageok_id(int jageok_id) {
		this.jageok_id = jageok_id;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "JageokDTO [member_id=" + member_id + ", jageok_title=" + jageok_title + ", jageok_date=" + jageok_date
				+ ", jageok_cost=" + jageok_cost + ", jageok_id=" + jageok_id + ", enabled=" + enabled + "]";
	}
}
