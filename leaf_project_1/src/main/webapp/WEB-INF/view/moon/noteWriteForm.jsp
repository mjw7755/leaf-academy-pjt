<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>선생님께 쪽지보내기</title>
</head>
<body>
	<table>
		<tr>
			<td>(보낼사람 ID) : <input type="text" name="n_send_id" id="n_send_id" value="${sessionScope.sessionid}"></td><td><a href="noteList.do">쪽지함으로</a></td>
		</tr>
		
		<tr>
			<td>(받는사람 ID) : <input type="text" name="n_recv_id" id="n_recv_id" value="<c:forEach items="${chkValues }" var="value" varStatus="status"><c:if test="${status.index < fn:length(chkValues)-1}">${value },</c:if><c:if test="${status.index == fn:length(chkValues)-1 }">${value }</c:if></c:forEach>"></td>
		</tr>
		
		<tr>
			<td>제목 : <input type="text" name="n_title" id="n_title" style="width:500px;"></td>
		</tr>
		
		<tr>
			<td>내용 : </td>
		</tr>
		
		<tr>
			<td><input type="text" name="n_content" id="n_content" style="width:500px; height:200px"></td>
		</tr>
		
		<tr>
			<td><!-- <input type="submit" value="보내기"> --><button id="mgmtNoteSend">보내기</button></td>
		</tr>
	</table>
	
</body>
</html>