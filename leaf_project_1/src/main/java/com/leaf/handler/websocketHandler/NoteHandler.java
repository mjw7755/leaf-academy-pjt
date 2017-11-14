package com.leaf.handler.websocketHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.leaf.model.note.NoteClientVO;
import com.leaf.model.note.NoteDAO;
import com.leaf.model.note.NoteDTO;

@Component
public class NoteHandler implements org.springframework.web.socket.WebSocketHandler {

	@Resource
	NoteDAO noteDAO;
	
	Gson gson = new Gson();
	NoteClientVO vo = new NoteClientVO();
	List<WebSocketSession> socketList = new ArrayList();
	List<String> userList = new ArrayList();
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		// TODO Auto-generated method stub
		userList.remove(socketList.indexOf(arg0));
		socketList.remove(arg0);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {		
		// TODO Auto-generated method stu
		socketList.add(arg0);
	}

	@Override
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
		// TODO Auto-generated method stub
		String message = (String)arg1.getPayload();
		System.out.println("접속자 어레이 번호"+arg0.getId());
		System.out.println("json데이터 : "+(String)arg1.getPayload());
		Map<String,Object> data = gson.fromJson((String)arg1.getPayload(), new TypeToken<Map<String,Object>>(){}.getType());
		System.out.println("타입이 뭐야? "+data.get("n_type"));
		
		if(data.get("n_type").equals("login")) {
			userList.add((String)data.get("n_name"));
			System.out.println("로그인 완료");
		}
		
		if(data.get("n_type").equals("message")) {
			System.out.println("메세지일때");
			NoteDTO dto = new NoteDTO();
			dto.setN_content((String)data.get("n_content"));
			dto.setN_title((String)data.get("n_title"));
			dto.setN_recv_id((String)data.get("n_recvid"));
			dto.setN_send_id((String)data.get("n_sendid"));
			int recv_user_num = userList.indexOf((String)data.get("n_recvid"));
			System.out.println("받는사람 있을까?"+recv_user_num);
			
			/*noteDAO.writeNote(dto);*/
			
			
			if(recv_user_num > -1) {
				WebSocketSession recv_session = socketList.get(recv_user_num);
				recv_session.sendMessage(new TextMessage(message));
				System.out.println("해당유저에 메세지 전달 완료");
			}else {
				System.out.println("해당 유저 없음");
			}
			
		}
		
		if(data.get("n_type").equals("logout")) {
			socketList.remove(arg0);
			userList.remove((String)data.get("n_name"));
			System.out.println("소켓은 지워졌니?"+socketList.remove(arg0));
			System.out.println("유저는 지워졌니?"+userList.remove((String)data.get("n_name")));
			System.out.println("클라이언트가 지워졌어요(로그아웃함)");
		}
		
		System.out.println("셋팅 완료");
		System.out.println("첫번쨰 유저 지워졌는가? "+userList.get(0).toString());
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
