<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<form action="qna_update.do">
			qna_id : <input readonly="readonly" type="text" name="qna_id" value="${dto.qna_id}"><br>
			<input type="hidden" name="member_id" value="${sessionScope.sessionid }">
			qna_title : <input type="text" name="qna_title" value="${dto.qna_title}"><br>
			qna_content : <textarea rows="10" cols="50" name="qna_content" >${dto.qna_content}</textarea><br>
			<input type="button" value="취소" 
													 onclick="window.location.href='qna_list.do' ">
			<input type="submit" value="수정하기">
</form>
</body>
</html>