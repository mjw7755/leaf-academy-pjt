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
		var url = "list_backend_"+params.value+".do";
		window.location.href = url;
	}
	</script>
<body>
				<select	style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;"
					onchange="listChange(this);">
					<option value="curri">Curriculum </option>
					<option value="lect" > Lecture </option>
					<option value="member" selected="selected">Member</option>
				</select>
			<table>
				<th>ID</th>
				<th>Password</th>
				<th>Name</th>
				<th>Tel</th>
				<th>E-Mail</th>
				<th>Level</th>
				<th>Address</th>
				<th>Addnum</th>
				<th>Enabled</th>
				<c:forEach items="${list }" var="list" varStatus="status">
					<tr onclick="test(this)">
						<td>${list.member_id}</td>
						<td>${list.member_pwd}</td> 
						<td>${list.member_name}</td>
						<td>${list.member_tel}</td>
						<td>${list.member_email}</td>
						<td>${list.member_level}</td>
						<td>${list.member_address}</td>
						<td>${list.member_addnum}</td>
						<td>${list.enabled }</td> 
					</tr>
				</c:forEach>
			</table>
</body>
</html>