<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#jageokupdateTable {
   width: 800px;
   text-align: center;
}
#jageokupdateTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<form action="jageok_update.do">
	<table id="jageokupdateTable">
		<tr>
			<td id="whqrp">NO. : </td>
			<td><input readonly="readonly" type="text" name="jageok_id" value="${dto.jageok_id}" style="width: 100%;"></td>
		</tr>
		<tr>
			<td>member_id : </td>
			<td><input readonly="readonly" name="member_id" value="${dto.member_id}" style="width: 100%;"></td>
		</tr>
		<tr>
			<td>TITLE : </td>
			<td><input type="text" name="jageok_title" value="${dto.jageok_title}" style="width: 100%;"></td>
		</tr>
		<tr>
			<td>DATE : </td>
			<td><input type="text" name="jageok_date" value="${dto.jageok_date}" style="width: 100%;"></td>
		</tr>
		<tr>
			<td>COST : </td>
			<td><input type="text" name="jageok_cost" value="${dto.jageok_cost}" style="width: 100%;"></td>
		</tr>
	    <tr>
	    	<td colspan="2"> <input type="submit" value="수정완료"> <input type="reset" value="초기화" > </td>
	    </tr>   
	</table>
</form>
	
</body>
</html>
<%-- ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>