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
	
</body>
</html>