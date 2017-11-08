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
		<input type="hidden" name="notice_id" value="${dto.notice_id }">
		<input type="hidden" name="member_id" value="${sessionScope.sessionid }">
			notice_title : <input type="text" name="notice_title" value="${dto.notice_title}"><br>
			notice_content : <textarea rows="10" cols="50" name="notice_content" >${dto.notice_content}</textarea><br>
						<input type="button" value="취소"
													 onclick="window.location.href='notice_list.do' ">
			<input type="submit" value="수정하기">
</form>
</body>
</html>