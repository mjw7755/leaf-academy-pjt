<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선생님께 쪽지보내기</title>
</head>
<body>
	<table>
	<form action="noteWrite.do">
		<tr>
			<td>(보낼사람 ID) : <input type="text" name="n_send_id" id="n_send_id" value="${sessionScope.sessionid}"></td><td><a href="noteList.do">쪽지함으로</a></td>
		</tr>
		
		<tr>
			<td>(받는사람 ID) : <input type="text" name="n_recv_id" id="n_recv_id" value=""></td>
		</tr>
		
		<tr>
			<td>제목 : <input type="text" name="n_title" id="n_title" style="width:500px;"></td>
		</tr>
		
		<tr>
			<td>내용 : </td>
		</tr>
		
		<tr>
			<td><input type="text" name="n_content" id="n_content" style="width:500px; height:200px"></td>
		</tr>
		
		<tr>
			<td><!-- <input type="submit" value="보내기"> --><button id="sendBtn">보내기</button></td>
		</tr>
		</form>
	</table>
	<div class="alert_div" style="display:none;">
		
	</div>
	<script>
		//웹 소켓 객체를 저장할 변수를 선언
		var conn;
		
		$(function(){
			//입장 버튼을 클릭했을 때 이벤트 처리
			
				//웹 소켓 연결
				conn = new WebSocket(
					"ws://192.168.0.134:8080/controller/note.do");
				//웹 소켓 이벤트 처리
				
				conn.onopen = onOpen;
				conn.onmessage = onMessage;
				conn.onclose = onClose;
				conn.onerror = onError;
			
			//퇴장 버튼을 누를 때 이벤트 처리
			/* $('#exitBtn').bind('click', function(){
				//웹 소켓 연결 해제
				websocket.close();
			}); */
			
			//전송 버튼을 누를 때 이벤트 처리
			$('#sendBtn').bind('click', function(){
				
				var n_send_id = $('#n_send_id').val();
				var n_recv_id = $('#n_recv_id').val();
				var content = $('#n_content').val();
				var title = $('#n_title').val();
				console.log(n_send_id);
				console.log(n_recv_id);
				console.log(content);
				console.log(title);
				
				send({
		               n_type: "message",
		               n_sendid: n_send_id,
		               n_recvid: n_recv_id,
		               n_content: content,
		               n_title: title,
		            });
				
				//nickname 과 message에 입력된 내용을 서버에 전송
				$('#message').val('');
			});
			
			
			//message 창에서 Enter를 눌렀을 때도 메시지를 전송
			//키보드를 누를 때 이벤트 처리
			$('#message').keypress(function(event){
				var keycode = 
					event.keyCode?event.keyCode:event.whice;
				if(keycode == 13){
					//nickname 과 message에 입력된 내용을 서버에 전송
					var nick = $('#nickname').val();
					var msg = $('#message').val();
					//메시지 전송
					websocket.send(nick + ":" + msg);
					//메시지 입력창 초기화
					$('#message').val('');
				}
			});
		});
		
		//WebSocket이 연결된 경우 호출되는 함수
		function onOpen(evt){
			console.log("웹 소켓에 연결 성공");
			send({n_type : "login", n_name : "" });
		}
		
		//WebSocket이 연결 해제된 경우 호출되는 함수
		function onClose(evt){
			console.log("웹 소켓에 연결 해제");
		}
		
		function onError(evt){
			console.log(evt.data);
		}
		
		//서버에서 메시지가 왔을 때 호출되는 함수
		function onMessage(evt){
			//서버가 전송한 메시지 가져오기
			var data = evt.data;
			//메시지를 출력
			alert(data);
			if(data != null){
				$('.alert_div').append("쪽지가 도착했습니다.");
				$('.alert_div').slideDown("fast");
				setTimeout(function(){$('#chatMessageArea').slideUp("fast");},3000)
			}
		}
		
		function send(message) {
			var sessionid = "${sessionScope.sessionid}";
		      //attach the other peer username to our messages
		      
		      if (sessionid) {
		         message.n_name = sessionid;
		      }
		      conn.send(JSON.stringify(message));
		   };
	</script>
</body>
</html>