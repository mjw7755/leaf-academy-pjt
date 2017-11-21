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
		<option value="lect" selected="selected"> Lecture </option>
		<option value="member">Member</option>
	</select>
	<form action="search_backend_lect.do" method="post">
		<select name="column">
			<option value="lect_name">Lect-name</option>
			<option value="lect_person_num">Person-num</option>
			<option value="lect_start_day">Start-day</option>
			<option value="lect_end_day">End-day</option>
			<option value="lect_start_time">Start-time</option>
			<option value="lect_end_time">End-time</option>
			<option value="lect_charge">Charge</option>
			<option value="lect_accept">Accept</option>
			<option value="enabled">Enabled</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	<table>
		<th>Lect-name</th>
		<th>Person-num</th>
		<th>Start-day</th>
		<th>End-day</th>
		<th>Start-time</th>
		<th>End-time</th>
		<th>Charge</th>
		<th>Accept</th>
		<th>Enabled</th>
		<c:forEach items="${list }" var="list" varStatus="status">
			<tr onclick="test(this)">
				<td>${list.lect_name}</td>
				<td>${list.lect_person_num}</td>
				<td>${list.lect_start_day}</td>
				<td>${list.lect_end_day}</td>
				<td>${list.lect_start_time}</td>
				<td>${list.lect_end_time}</td>
				<td>${list.lect_charge}</td>
				<td>${list.lect_accept}</td>
				<td>${list.enabled }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>