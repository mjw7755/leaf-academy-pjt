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
<form action="update.co">
			teacher_id : <input readonly="readonly" type="text" name="teacher_id" value="${dto.teacher_id}"><br>
			강사명 : <input type="text" name="member_id" value="${dto.member_id}"><br>
			약력 : <input type="text" name="teacher_introduce" value="${dto.teacher_introduce}"><br>
			<input type="submit" value="수정하기">
</form>
</body>
</html>