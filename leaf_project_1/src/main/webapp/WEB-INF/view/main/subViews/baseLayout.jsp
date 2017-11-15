<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<!-- css 영역 -->
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet">

<!-- js 영역 -->
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href='<tiles:getAsString name="js"/>' type="text/css"	rel="stylesheet">
<style type="text/css">
body{
	margin: 0;
	padding: 0;
}
</style>

</head>
<body>
	<div class="wrapper">
	<table width="100%">
	
		<tr height="10%">
			<!-- header 영역 -->
				<td><tiles:insertAttribute name="header" /></td>
			
		</tr>
		
		<tr height="80%" align="center">
			<!-- content 영역 -->
			<div class="container-div">
				<td><tiles:insertAttribute name="content" /></td>
			</div>
		</tr>
		
		<tr height="10%">
			<!-- footer 영역 -->
			<div class="footer-div">
				<td><tiles:insertAttribute name="footer" /></td>
			</div>
		</tr>
	</table>
		</div>

<script>
var conn;
		//웹 소켓 객체를 저장할 변수를 선언
		$(function(){
			//입장 버튼을 클릭했을 때 이벤트 처리
			
			
			var sessionId = "${sessionScope.sessionid}";
			
			if(sessionId != ""){
				
				//웹 소켓 연결
				conn = new WebSocket(
					"ws://192.168.0.134:8080/controller/note.do");
				
				//웹 소켓 이벤트 처리	
				
				
				conn.onopen = onOpen;
				conn.onmessage = onMessage;
				conn.onclose = onClose;
				conn.onerror = onError;
					
			}
				
			//퇴장 버튼을 누를 때 이벤트 처리
			/* $('#exitBtn').bind('click', function(){
				//웹 소켓 연결 해제
				websocket.close();
			}); */
			$("#loginBtn").bind('click',function(){
				var login_member_id = $("#login_member_id").val();
				send({
		               n_type: "login",
		            });
			});
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
			});
			
			
			//message 창에서 Enter를 눌렀을 때도 메시지를 전송
			//키보드를 누를 때 이벤트 처리
			$('#message').keypress(function(event){
				var keycode = 
					event.keyCode?event.keyCode:event.whice;
				if(keycode == 13){
					send({
			               n_type: "login",
			            });
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
			send({n_type:"logout", n_name : ""});
		}
		
		function onError(evt){
			console.log(evt.data);
			send({n_type:"logout", n_name : ""});
		}
		
		//서버에서 메시지가 왔을 때 호출되는 함수
		function onMessage(evt){
			//서버가 전송한 메시지 가져오기
			var data = evt.data;
			//메시지를 출력
			if(data != null){
				if(data == "dupl"){
					alert(data);
					$.ajax({
						url:"loginDupl.do",
						success: function(data){
							alert("다른곳에서 로그인되었습니다. 접속을 종료합니다.");
							window.location.reload(true);
						},
						error:function(e){
							alert(e);
						}
						
					})
				}else {
					$('.alert_div').slideDown("fast");
					setTimeout(function(){$('.alert_div').slideUp("fast");},3000);					
				}
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