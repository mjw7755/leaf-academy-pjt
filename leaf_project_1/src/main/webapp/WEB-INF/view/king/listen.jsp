<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<label style="float: left;">강의 선택 : </label>
	<c:if test="${sessionScope.sessionlevel==1}">
	<select style="width:200px; float:left;">
		<c:forEach items="${history}" var="history">
		<c:if test="${history.payment_pay_chk eq 1}">
		<c:if test="${sessionScope.sessionid == history.payment_member_id}">
			<option value="class1">${history.payment_lect_subject }</option>
		</c:if>
		</c:if>
		</c:forEach>
	</select>
	</c:if>
	<c:if test="${sessionScope.sessionlevel!=1}">
	<select style="width:200px; float:left;">
		<c:forEach items="${history}" var="history">
		<c:if test="${history.payment_pay_chk eq 1}">
		<c:if test="${sessionScope.sessionid == history.payment_teacher_name}">
			<option value="class1">${history.payment_lect_subject }</option>
		</c:if>
		</c:if>
		</c:forEach>
	</select>
	</c:if>
</body>
</html>