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
<form action="review_update.do">
	<input type="hidden" readonly="readonly" name="teacher_id" value="${dto.teacher_id}">
	<input readonly="readonly" type="hidden" name="review_id" value="${dto.review_id}"><br>
	제목 : <input type="text" name="r_headline" value="${dto.r_headline}"><br>
	내용 : <input type="text" name="r_content" value="${dto.r_content}"><br>
	<input type="submit" value="수정하기">
</form>
</body>
</html>