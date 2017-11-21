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
		<option value="book">Book</option>
		<option value="faq">Faq</option>
		<option value="ja">Jageok</option>
		<option value="note">Note</option>
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
	<form action="search_backend_curri.do" method="post">
		<select name="column">
			<option value="curri_id">Curri-id</option>
			<option value="member_id">Member-id</option>
			<option value="curri_subject">Curri-subject</option>
			<option value="curri_level">Curri-level</option>
			<option value="curri_content">Curri-content</option>
			<option value="curri_write_time">Curri-write_time</option>
			<option value="curri_modify_time">Curri-modify_time</option>
			<option value="curri_accept">Curri-accept</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>Curri_id</th>
	<th>Member_id</th>
	<th>Subject</th>
	<th>Level</th>
	<th>Content</th>
	<th>Write_time</th>
	<th>Modify_time</th>
	<th>Accept</th>
	<th>Enabled</th>
	<c:forEach items="${clist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.curri_id}</td>
			<td>${list.member_id}</td>
			<td>${list.curri_subject}</td>
			<td>${list.curri_level}</td>
			<td>${list.curri_content}</td>
			<td>${list.curri_write_time}</td>
			<td>${list.curri_modify_time}</td>
			<td>${list.curri_accept }</td>
			<td>${list.enabled }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>