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
			member_id : <input type="text" name="member_id" value="${dto.member_id}"><br>
			qna_title : <input type="text" name="qna_title" value="${dto.qna_title}"><br>
			qna_content : <input type="text" name="qna_content" value="${dto.qna_content}"><br>
			<input type="button" value="취소" 
													 onclick="window.location.href='qna_list.do' ">
			<input type="submit" value="수정하기">
</form>
</body>
</html>