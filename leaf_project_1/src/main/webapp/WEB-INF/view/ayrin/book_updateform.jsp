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
<form action="book_update.lcs">
         NO. : <input readonly="readonly" type="text" name="book_id" value="${dto.book_id}"><br>
         member_id : <input readonly="readonly" name="member_id" value="${dto.member_id}"><br>
         TITLE : <input type="text" name="book_title" value="${dto.book_title}"><br>
         WRITER : <input type="text" name="book_writer" value="${dto.book_writer}"><br>
         COST : <input type="text" name="book_cost" value="${dto.book_cost}"><br>
        
	<input type="submit" value="수정">  
	<input type="reset" value="초기화" >
</form>
	
</body>
</html>
<%-- ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>