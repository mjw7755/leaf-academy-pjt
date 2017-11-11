package com.leaf.model.note;

import org.springframework.web.socket.WebSocketSession;

public class NoteClientVO {
	private WebSocketSession webSocketSession;
	private String member_id;
	
	public NoteClientVO() {
		// TODO Auto-generated constructor stub
	}
	
	public NoteClientVO(String member_id) {
		this.member_id = member_id;
	}
	
	public WebSocketSession getWebSocketSession() {
		return webSocketSession;
	}
	public void setWebSocketSession(WebSocketSession webSocketSession) {
		this.webSocketSession = webSocketSession;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
