package com.leaf.handler.websocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.leaf.model.payment.PaymentDAO;

@Component
public class NoteHandler implements org.springframework.web.socket.WebSocketHandler {

	@Resource
	NoteDAO noteDAO;
	
	@Resource
	PaymentDAO paymentDAO;
	
	Gson gson = new Gson();
	NoteClientVO vo = new NoteClientVO();
	List<WebSocketSession> socketList = new ArrayList<WebSocketSession>();
	List<String> userList = new ArrayList<String>();
	
	
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
		Map<String,Object> data = gson.fromJson((String)arg1.getPayload(), new TypeToken<Map<String,Object>>(){}.getType());
		
		
		
		//로그인 요청
		if(data.get("n_type").equals("login")) {
			if(userList.indexOf((String)data.get("n_name")) > -1) {
				int jungbok = userList.indexOf((String)data.get("n_name"));
				WebSocketSession dupl = socketList.get(jungbok);
				dupl.sendMessage(new TextMessage("dupl"));
				userList.remove((String)data.get("n_name"));
				socketList.remove(dupl);				
			}else {
				userList.add((String)data.get("n_name"));
				System.out.println("로그인 완료");	
			}
		}
		
		
		//메세지 요청
		if(data.get("n_type").equals("message")) {
			Map<String, Object> mul_recv_note = new HashMap<String, Object>();
			ArrayList<String> n_recvids = new ArrayList<String>();
			ArrayList<NoteDTO> n_recvids_arr = new ArrayList<NoteDTO>();
			n_recvids = (ArrayList)data.get("chkvalues");
			
			for(int i=0; i<n_recvids.size(); i++) {
				
				System.out.println("id값 제대로 들어왔을까? "+n_recvids.get(i));
			}
			
			
			
			
			System.out.println("받는사람 몇명?"+n_recvids.size());
			
			if(n_recvids.size() > 1) {
				/*다중 쪽지*/
				for(int i=0;i<n_recvids.size(); i++) {
					NoteDTO dto = new NoteDTO();
					dto.setN_content((String)data.get("n_content"));
					dto.setN_title((String)data.get("n_title"));
					dto.setN_recv_id(n_recvids.get(i));
					dto.setN_send_id((String)data.get("n_sendid"));
					n_recvids_arr.add(dto);
				}
				System.out.println("다중쪽지 시작");
				mul_recv_note.put("n_recvids_arr", n_recvids_arr);
				noteDAO.writeMulNote(mul_recv_note);
				System.out.println("다중쪽지 완료");
				
				
				for(int i=0; i<n_recvids_arr.size(); i++) {
					int recv_users = userList.indexOf(n_recvids_arr.get(i));
					if(recv_users > -1) {
						WebSocketSession recv_session = socketList.get(recv_users);
						recv_session.sendMessage(new TextMessage(message));
						System.out.println("해당유저에 메세지 전달 완료");
					}else {
						System.out.println("해당 유저 없음");
					}
				}
			}else {
				NoteDTO dto = new NoteDTO();
				/*단일 쪽지*/
				dto.setN_content((String)data.get("n_content"));
				dto.setN_title((String)data.get("n_title"));
				dto.setN_recv_id((String)data.get("n_recvid"));
				dto.setN_send_id((String)data.get("n_sendid"));	
				System.out.println("받는사람 등장 : "+dto.getN_recv_id());
				noteDAO.writeNote(dto);
			}
			System.out.println("받는사람 아이디 : "+(String)data.get("n_recvid"));
			int recv_user_num = userList.indexOf((String)data.get("n_recvid"));
			System.out.println("받는사람 있을까?"+recv_user_num);

			if(recv_user_num > -1) {
				WebSocketSession recv_session = socketList.get(recv_user_num);
				recv_session.sendMessage(new TextMessage(message));
				System.out.println("해당유저에 메세지 전달 완료");
			}else {
				System.out.println("해당 유저 없음");
			}
			
		}
		
		
		//로그아웃 요청
		if(data.get("n_type").equals("logout")) {
			socketList.remove(arg0);
			userList.remove((String)data.get("n_name"));
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
