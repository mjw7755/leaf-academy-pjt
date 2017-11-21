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
		<option value="note" selected="selected">Note</option>
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
	<form action="search_backend_note.do" method="post">
		<select name="column">
			<option value="n_id">n-id</option>
			<option value="n_content">n_content</option>
			<option value="n_title">n_title</option>
			<option value="n_send_id">n_title</option>
			<option value="n_recv_id">n_recv_id</option>
			<option value="n_send_del_yn">n_send_del_yn</option>
			<option value="n_recv_del_yn">n_recv_del_yn</option>
			<option value="n_open_date">n_open_date</option>
			<option value="n_write_date">n_write_date</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>n_id</th>
	<th>n_content</th>
	<th>n_title</th>
	<th>n_send_id</th>
	<th>n_recv_id</th>
	<th>n_send_del_yn</th>
	<th>n_recv_del_yn</th>
	<th>n_open_date</th>
	<th>n_write_date</th>
	<c:forEach items="${nlist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.n_id}</td>
			<td>${list.n_content}</td>
			<td>${list.n_title}</td>
			<td>${list.n_send_id}</td>
			<td>${list.n_recv_id}</td>
			<td>${list.n_send_del_yn}</td>
			<td>${list.n_recv_del_yn}</td>
			<td>${list.n_open_date }</td>
			<td>${list.n_write_date }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>