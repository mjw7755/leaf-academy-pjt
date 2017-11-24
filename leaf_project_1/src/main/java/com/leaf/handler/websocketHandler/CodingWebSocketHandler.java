package com.leaf.handler.websocketHandler;

import java.util.ArrayList;
import java.util.HashMap;
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
	public static List<WebSocketSession> list= new ArrayList<WebSocketSession>();
	public static ArrayList<String> names = new ArrayList<String>();
	public static HashMap<String,ArrayList<String>> codes = new HashMap<String,ArrayList<String>>();
	public static HashMap<String,String> teacherPlace = new HashMap<String,String>();
	public static HashMap<String,ArrayList<String>> call = new HashMap<String,ArrayList<String>>();
	public static HashMap<String,String> openClass = new HashMap<String,String>();
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception {
		System.out.println("채팅 연결끊음");
    	//codes.remove(names.get(list.indexOf(arg0)));
		int index = list.indexOf(arg0);
		String name = names.get(index);
		if(teacherPlace.get(name)!=null) {
			teacherPlace.remove(name);
		}
    	names.remove(index);
    	list.remove(index);
	}
    //클라이언트가 연결 되었을때 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception {
		System.out.println("채팅 연결성공");
		arg0.sendMessage(new TextMessage("{\"type\": \"enter\"}"));
	}
    //클라이언트가 메시지를 보냈을때 호출되는 메소드
	@Override
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception {
		Gson gson = new Gson();
		
		Map<String, Object> data = gson.fromJson((String)arg1.getPayload(),
				new TypeToken <Map<String, Object>>() {}.getType());
		String name = (String)data.get("name");
		String targetid = (String)data.get("targetid");
		String teacherid = (String) data.get("teacherid");
		
		if(data.get("type").equals("teacherLogin")) {
			if(codes.get(name)==null) {
				names.add(name);
				list.add(arg0);
				codes.put(name, new ArrayList<String>());
				call.put(name, new ArrayList<String>());
				openClass.put(name, (String)data.get("openClass"));
				arg0.sendMessage(new TextMessage("{\"type\": \"opening\""
						+ ",\"openClass\":\""+openClass.get(name)+"\""
						+ ",\"callStudents\":\""+call.get(name)+"\"}"));
			} else {
				arg0.sendMessage(new TextMessage("{\"type\": \"connFalse\"}"));
			}
		} else if(data.get("type").equals("login")) {
			names.add(name);
			list.add(arg0);
			
			if(name.equals(teacherid)) {
				teacherPlace.put(name, targetid);
			}
			
			if(codes.get(name)==null) {
				try {
					codes.put(name, new ArrayList<String>());
					codes.get(teacherid).get(0);
					codes.get(name).addAll(codes.get(teacherid));
					arg0.sendMessage(new TextMessage("{\"type\": \"coding\""
							+ ",\"codes\": \""+codes.get(name)+"\"}"));
				} catch (Exception e) {
					
				}
			} else {
				if(teacherid.equals(name)) {
					arg0.sendMessage(new TextMessage("{\"type\": \"coding\""
							+ ",\"codes\": \""+codes.get(targetid)+"\"}"));
				} else {
					arg0.sendMessage(new TextMessage("{\"type\": \"coding\""
							+ ",\"codes\": \""+codes.get(name)+"\"}"));
				}
			}
		} else if(data.get("type").equals("coding")) {
			String str = (String)data.get("str");
			int index = (int)Float.parseFloat(data.get("codingIndex")+"");
			System.out.println(codes.get(name));
			if(str==null) {
					
			} else if(str.equals("back")) {
				try {
					if(teacherid==null) {
						codes.get(name).remove(index-1);
					} else {
						if(!teacherid.equals(name)) {
							codes.get(name).remove(index-1);
						} else if(teacherPlace.get(teacherid)!=null && teacherPlace.get(teacherid).equals(targetid)) {
							codes.get(targetid).remove(index-1);
						}
					}
				} catch (Exception e) {}
			} else if(str.equals("del")) {
				try {
					if(teacherid==null) {
						codes.get(name).remove(index);
					} else {
						if(!teacherid.equals(name)) {
							codes.get(name).remove(index);
						} else if(teacherPlace.get(teacherid)!=null && teacherPlace.get(teacherid).equals(targetid)) {
							codes.get(targetid).remove(index);
						}
					}
				} catch (Exception e) {}
			} else {
				if(teacherid==null) {
					codes.get(name).add(index,str);
				} else {
					if(!teacherid.equals(name)) {
						codes.get(name).add(index,str);
					} else if(teacherPlace.get(teacherid)!=null && teacherPlace.get(teacherid).equals(targetid)) {
						codes.get(targetid).add(index,str);
					}
				}
				str="add";
			}
			String tempName = "";
			if(name.equals(teacherid)) {
				tempName = targetid;
			} else {
				tempName = name;
			}
			
			if(teacherid==null) {
				arg0.sendMessage(new TextMessage("{\"type\": \"coding\""
						+ ",\"codingType\" : \""+str+"\""
						+ ",\"changeIndex\" : \""+index+"\""
						+ ",\"codes\": \""+codes.get(name)+"\"}"));
			} else {
				if(teacherid.equals(name)) {
					list.get(names.indexOf(targetid)).sendMessage(new TextMessage("{\"type\": \"coding\""
							+ ",\"codingType\" : \""+str+"\""
							+ ",\"changeIndex\" : \""+index+"\""
							+ ",\"codes\": \""+codes.get(tempName)+"\"}"));
				} else {
					if(teacherPlace.get(teacherid)!=null && teacherPlace.get(teacherid).equals(tempName)) {
						list.get(names.indexOf(targetid)).sendMessage(new TextMessage("{\"type\": \"coding\""
								+ ",\"codingType\" : \""+str+"\""
								+ ",\"changeIndex\" : \""+index+"\""
								+ ",\"codes\": \""+codes.get(tempName)+"\"}"));
					} else {
						list.get(names.indexOf(targetid)).sendMessage(new TextMessage("{\"type\": \"coding\""
								+ ",\"studentid\" : \""+tempName+"\""
								+ ",\"codes\": \""+codes.get(tempName)+"\"}"));
					}
					
				}
				arg0.sendMessage(new TextMessage("{\"type\": \"coding\""
						+ ",\"codingType\" : \""+str+"\""
						+ ",\"changeIndex\" : \""+index+"\""
						+ ",\"codes\": \""+codes.get(tempName)+"\"}"));
			}
			
		} else if(data.get("type").equals("call")) {
			if(call.get(teacherid).indexOf(name)==-1) {
				call.get(teacherid).add(name);
				list.get(names.indexOf(teacherid)).sendMessage(new TextMessage("{\"type\": \"call\""
						+ ",\"studentid\": \""+name+"\"}"));
			}
		} else if(data.get("type").equals("callCancle")) {
			call.get(name).remove(targetid);
		
		} else if(data.get("type").equals("classClose")) {
			String studentStr =  data.get("studentList").toString();
			String[] studentList = studentStr.substring(0, studentStr.length()-1).split(" ");
			int studentLength = studentList.length;
			for(int i=0; i<studentLength; i++) {
				int index = names.indexOf(studentList[i]);
				//list.get(names.indexOf(studentList[i])).sendMessage(new TextMessage("{\"type\": \"opening\"}"));
				codes.remove(studentList[i]);
				names.remove(index);
		    	list.remove(index);
			}
			//arg0.sendMessage(new TextMessage("{\"type\": \"opening\"}"));
			call.remove(name);
			codes.remove(name);
			names.remove(name);
			openClass.remove(name);
	    	list.remove(arg0);
		} else if(data.get("type").equals("conn")) {
			if(openClass.get(name)!=null) {
				arg0.sendMessage(new TextMessage("{\"type\": \"opening\""
						+ ",\"openClass\":\""+openClass.get(name)+"\""
						+ ",\"callStudents\":\""+call.get(name)+"\"}"));
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
