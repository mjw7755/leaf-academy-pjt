<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function listChange(params) {
		var url = "list_backend_" + params.value + ".do";
		window.location.href = url;
	}
</script>
<body>
	<select
		style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;"
		onchange="listChange(this);">
		<option value="curri" selected="selected">Curriculum </option>
		<option value="lect"> Lecture </option>
		<option value="member">Member</option>
	</select>
	
	<table>
	<th>Subject</th>
	<th>Level</th>
	<th>Content</th>
	<th>Accept</th>
	<th>Enabled</th>
	<c:forEach items="${list }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.curri_subject}</td>
			<td>${list.curri_level}</td>
			<td>${list.curri_content}</td>
			<td>${list.curri_accept }</td>
			<td>${list.enabled }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>