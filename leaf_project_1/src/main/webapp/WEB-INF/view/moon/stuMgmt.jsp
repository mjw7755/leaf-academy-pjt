<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div class="student_list" style="overflow-y:auto; width:500px; height:500px">

	<h1>학생 관리</h1>
	<hr>
	<table>
		<thead>
			<th>학생이름</th>
			<th>아이디</th>
			<th colspan="5">출결</th>
			<th>학생선택</th>
		</thead>
		<tbody>
		<form action="noteSendForm.do">
			<c:forEach items="${list }" var="list">
				<tr>
					<td>${list.member_name } 학생</td>
					<td>${list.member_id }</td>
					<td><a href="stuMgmtExcel.do?student_id=${list.member_id }&chk_str=출석">출석</a></td>
					<td><a href="stuMgmtExcel.do?student_id=${list.member_id }&chk_str=지각">지각</a></td>
					<td><a href="stuMgmtExcel.do?student_id=${list.member_id }&chk_str=결석">결석</a></td>
					<td><a href="stuMgmtExcel.do?student_id=${list.member_id }&chk_str=조퇴">조퇴</a></td>
					<td align="center"><input type="checkbox" name="studentChk" id="studentChk" value="${list.member_id }"></td>
				</tr>
			</c:forEach>		
			<tr>	
				<td><input type="submit" value="쪽지 보내기"></td>			
			</tr>
		</form>
		</tbody>
	</table>
	
</div>
</body>
</html>