package com.leaf.handler.websocketHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.leaf.model.note.NoteClientVO;

@Component
public class WebSocketHandler implements org.springframework.web.socket.WebSocketHandler {

	Gson gson = new Gson();
	NoteClientVO vo = new NoteClientVO();
	List<NoteClientVO> list = new ArrayList();
	
	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		// TODO Auto-generated method stub
		list.remove(vo);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {		
		// TODO Auto-generated method stu
		vo.setWebSocketSession(arg0);
		list.add(vo);
	}

	@Override
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("접속자 어레이 번호"+arg0.getId());
		System.out.println("json데이터 : "+(String)arg1.getPayload());
		Map<String,Object> data = gson.fromJson((String)arg1.getPayload(), new TypeToken<Map<String,Object>>(){}.getType());
		
		if(data.get("type").equals("login")) {
			System.out.println("로그인 완료");
			list.set(Integer.parseInt(arg0.getId()),new NoteClientVO((String)data.get("name")));
		}
		
	}

	@Override
	public void handleTransportError(WebSocketSession arg0, Throwable arg1) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean supportsPartialMessages() {
		// TODO Auto-generated method stub
		return false;
	}

}
