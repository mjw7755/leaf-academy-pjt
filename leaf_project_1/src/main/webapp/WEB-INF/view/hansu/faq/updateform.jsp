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
<form action="faq_update.do">
			faq_id : <input readonly="readonly" type="text" name="faq_id" value="${dto.faq_id}"><br>
			faq_title : <input type="text" name="faq_title" value="${dto.faq_title}"><br>
			faq_content : <%-- <input type="text" name="faq_content" value="${dto.faq_content}"> --%>
			<td><textarea rows="10" cols="50" name="faq_content" >${dto.faq_content}</textarea></td><br>
			<input type="button" value="취소"  
													 onclick="window.location.href='faq_list.do' ">
			<input type="submit" value="수정하기">
</form>
</body>
</html>