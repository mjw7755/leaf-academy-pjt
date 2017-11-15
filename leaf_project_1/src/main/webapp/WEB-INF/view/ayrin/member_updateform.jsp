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
<br><br><br><br><br><br>
<form action="member_update.do">
	ID : <input type="text" type="text" name="member_id" value="${dto.member_id}"><br>
	NAME : <input type="text" name="member_name" value="${dto.member_name}"><br>
	PWD : <input type="text" name="member_pwd" value="${dto.member_pwd}"><br>
	TEL : <input type="text" name="member_tel" value="${dto.member_tel}"><br>
	EMAIL : <input type="text" name="member_email" value="${dto.member_email}"><br>
	
	<input type="submit" value="수정하기">
</form>
<br><br><br><br><br><br>
</body>
</html>
<%-- LEVEL : <input type="readonly" name="member_level" value="${dto.member_level}"><br>
ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>