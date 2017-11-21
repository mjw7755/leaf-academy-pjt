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
		<option value="curri">Curriculum </option>
		<option value="lect"> Lecture </option>
		<option value="member">Member</option>
		<option value="book">Book</option>
		<option value="faq">Faq</option>
		<option value="ja" selected="selected">Jageok</option>
		<option value="note">Note</option>
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
	<form action="search_backend_ja.do" method="post">
		<select name="column">
			<option value="jageok_id">Curri-id</option>
			<option value="member_id">Member-id</option>
			<option value="jageok_title">Curri-subject</option>
			<option value="jageok_date">Curri-level</option>
			<option value="jageok_cost">Curri-content</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>jageok_id</th>
	<th>Member_id</th>
	<th>jageok_title</th>
	<th>jageok_date</th>
	<th>jageok_cost</th>
	<th>Enabled</th>
	<c:forEach items="${jalist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.jageok_id}</td>
			<td>${list.member_id}</td>
			<td>${list.jageok_title}</td>
			<td>${list.jageok_date}</td>
			<td>${list.jageok_cost}</td>
			<td>${list.enabled }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>