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
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna" selected="selected">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
	<form action="search_backend_qna.do" method="post">
		<select name="column">
			<option value="qna_id">qna_id</option>
			<option value="member_id">Member-id</option>
			<option value="qna_title">qna_title</option>
			<option value="qna_content">qna_content</option>
			<option value="qna_writedate">qna_writedate</option>
			<option value="qna_modifydate">qna_modifydate</option>
			<option value="qna_ref">qna_ref</option>
			<option value="qna_step">qna_step</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>qna_id</th>
	<th>Member_id</th>
	<th>qna_title</th>
	<th>qna_content</th>
	<th>qna_writedate</th>
	<th>qna_modifydate</th>
	<th>qna_ref</th>
	<th>qna_step</th>
	<th>Enabled</th>
	<c:forEach items="${qlist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.qna_id}</td>
			<td>${list.member_id}</td>
			<td>${list.qna_title}</td>
			<td>${list.qna_content}</td>
			<td>${list.qna_writedate}</td>
			<td>${list.qna_modifydate}</td>
			<td>${list.qna_ref}</td>
			<td>${list.qna_step }</td>
			<td>${list.enabled }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>