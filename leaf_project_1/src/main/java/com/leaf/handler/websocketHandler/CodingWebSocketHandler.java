package com.leaf.handler.websocketHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class CodingWebSocketHandler implements WebSocketHandler {
	//접속한 클라이언트들의 정보를 저장할 컬렉션 객체
	public static List<WebSocketSession> list=
			new ArrayList<WebSocketSession>();
	public static ArrayList<String> names = new ArrayList<String>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		System.out.println("채팅 연결끊음");
		//리스트에서 제거 
		names.remove(list.indexOf(arg0));
		list.remove(arg0);
	}
    //클라이언트가 연결 되었을때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {
		System.out.println("채팅 연결성공");
	}
    //클라이언트가 메시지를 보냈을때 호출되는 메소드
	@Override
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
		Gson gson = new Gson();
		
		Map<String, Object> data = gson.fromJson((String)arg1.getPayload(),
				new TypeToken <Map<String, Object>>() {}.getType());
		
		String name = (String)data.get("name");
		
		if(data.get("type").equals("login")) {
			try {
				list.get(0).sendMessage(new TextMessage("{\"type\": \"login\",\"name\": \""+data.get("name")+"\"}"));
			} catch (Exception e) {
				System.out.println("첫번째 접속자");
			}
        	list.add(arg0);
        	names.add(name);
		} else if(data.get("type").equals("first")) {
			list.get(names.indexOf(data.get("targetName"))).sendMessage(new TextMessage("{\"type\": \"first\",\"message\": \""+data.get("message")+"\"}"));
		} else if(data.get("type").equals("coding")) {
			for(WebSocketSession socket:list){
				if(!arg0.getId().equals(socket.getId())) {
					socket.sendMessage(new TextMessage("{\"type\": \"coding\",\"selectionStart\": \""+data.get("selectionStart")+"\",\"str\": \""+data.get("str")+"\"}"));
				}
			}
		} 

	}
    //메시지 전송에 실패했을때 호출되는 메소드
	@Override
	public void handleTransportError(WebSocketSession arg0, Throwable arg1) throws Exception {
		

	}
    //메시지가 긴 경우 분할해서 보낼수있는지 여부를 설정하는 메소드
	@Override
	public boolean supportsPartialMessages() {
		
		return false;
	}

}
