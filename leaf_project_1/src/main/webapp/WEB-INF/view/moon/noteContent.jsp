<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>보낸사람 : ${dto.n_send_id }</td>
	</tr>
	
	<tr>
		<td>제목 : ${dto.n_title }</td>
	</tr>
	
	<tr>
		<td>내용</td>
	</tr>
	<tr>
		<td><input type="text" style="height:200px; width:500px;" value="${dto.n_content }"></td>
	</tr>
	
	<tr>
		<td><a href="noteList.do">목록으로</a></td>
	</tr>
</table>
</body>
</html>