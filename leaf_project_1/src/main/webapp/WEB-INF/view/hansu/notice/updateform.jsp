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
<form action="notice_update.do">
			notice_id : <input readonly="readonly" type="text" name="notice_id" value="${dto.notice_id}"><br>
			member_id : <input type="text" name="member_id" value="${dto.member_id}"><br>
			notice_title : <input type="text" name="notice_title" value="${dto.notice_title}"><br>
			notice_content : <input type="text" name="notice_content" value="${dto.notice_content}"><br>
			<input type="submit" value="수정하기">
</form>
</body>
</html>