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
		<option value="ja">Jageok</option>
		<option value="note">Note</option>
		<option value="notice" selected="selected">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
	<form action="search_backend_notice.do" method="post">
		<select name="column">
			<option value="notice_id">notice_id</option>
			<option value="member_id">member_id</option>
			<option value="notice_title">notice_title</option>
			<option value="notice_content">notice_content</option>
			<option value="notice_writedate">notice_writedate</option>
			<option value="notice_modifydate">notice_modifydate</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>notice_id</th>
	<th>Member_id</th>
	<th>notice_title</th>
	<th>notice_content</th>
	<th>notice_writedate</th>
	<th>notice_modifydate</th>
	<th>Enabled</th>
	<c:forEach items="${noticelist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.notice_id}</td>
			<td>${list.member_id}</td>
			<td>${list.notice_title}</td>
			<td>${list.notice_content}</td>
			<td>${list.notice_writedate}</td>
			<td>${list.notice_modifydate}</td>
			<td>${list.enabled }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>