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

public class VideoChatWebSocketHandler implements WebSocketHandler {
	//접속한 클라이언트들의 정보를 저장할 컬렉션 객체
		public static List<WebSocketSession> list=
			new ArrayList<WebSocketSession>();
		public static ArrayList<String> names = new ArrayList<String>();
		
		@Override
		public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
			System.out.println("연결끊음");
			//리스트에서 제거 
			names.remove(list.indexOf(arg0));
			list.remove(arg0);
		}
	    //클라이언트가 연결 되었을때 호출되는 메소드
		@Override
		public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {
			System.out.println("연결성공");
			//리스트에 추가
		}
	    //클라이언트가 메시지를 보냈을때 호출되는 메소드
		@Override
		public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
			String temp = ((String)arg1.getPayload()).substring(((String)arg1.getPayload()).indexOf(":{")+1, ((String)arg1.getPayload()).indexOf("},")+1);
			Gson gson = new Gson();
			
			Map<String, Object> data = gson.fromJson((String)arg1.getPayload(),
					new TypeToken <Map<String, Object>>() {}.getType());
			
			String name = (String)data.get("name");
			if(data.get("type").equals("login")) {
				if(names.indexOf(name)!=-1) {
					arg0.sendMessage(new TextMessage("{\"type\": \"login\",\"success\": false}"));
	            } else {
	            	list.add(arg0);
	            	names.add(name);
	            	arg0.sendMessage(new TextMessage("{\"type\": \"login\",\"success\": true}"));
	            }
			} else if(data.get("type").equals("offer")) {
				list.get(names.indexOf(name)).sendMessage(new TextMessage("{\"type\": \"offer\",\"offer\": "+temp+",\"name\": \""+name+"\"}"));
			} else if(data.get("type").equals("answer")) {
				list.get(names.indexOf(name)==1?0:1).sendMessage(new TextMessage("{\"type\": \"answer\",\"answer\": "+temp+"}"));
			} else if(data.get("type").equals("candidate")) {
				arg0.sendMessage(new TextMessage("{\"type\": \"candidate\",\"candidate\": "+temp+"}"));
			} else if(data.get("type").equals("leave")) {
				arg0.sendMessage(new TextMessage("{\"type\": \"leave\"}"));
			} else {
				arg0.sendMessage(new TextMessage("{\"type\": \"error\",\"message\": \"Command not found: "+data.get("type")+"\"}"));
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
