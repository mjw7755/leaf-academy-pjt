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
<form action="jageok_update.lcs">
         NO. : <input readonly="readonly" type="text" name="jageok_id" value="${dto.jageok_id}"><br>
         member_id : <input type="readonly" name="member_id" value="${dto.member_id}"><br>
         TITLE : <input type="text" name="jageok_title" value="${dto.jageok_title}"><br>
         DATE : <input type="text" name="jageok_date" value="${dto.jageok_date}"><br>
         COST : <input type="text" name="jageok_cost" value="${dto.jageok_cost}"><br>
        
	<input type="submit" value="수정">  
	<input type="reset" value="초기화" >
</form>
	
</body>
</html>
<%-- ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>