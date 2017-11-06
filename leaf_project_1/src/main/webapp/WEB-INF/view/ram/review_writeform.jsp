<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<form action="review_write.co">
<input type="hidden" name="teacher_id" value="${param.teacher_id}">
<table>

			<tr>
				<td>member_id</td>
				<td>:</td>
				<td><input type="text" name="member_id" required="required"
					value="${member_id}"></td>
			</tr>

			<tr>
				<td>제목</td>
				<td>:</td>
				<td><input type="text" name="r_headline"
					required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>:</td>
				<td><input type="text" name="r_content"
					required="required"></td>
			</tr>
			<tr>
				<td colspan="3"><hr></td>
			</tr>

			<tr>
				<td><input type="button" value="취소" style="width: 100%;"
					onclick="window.location.href='review_list.co' "></td>
				<td><input type="reset" value="초기화" style="width: 100%"></td>
				<td><input type="submit" value="추가" style="width: 100%"></td>
			</tr>
		</table>

</form>
</body>
</html>