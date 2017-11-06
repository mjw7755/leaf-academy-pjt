<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

</head>
<body>
	<form action="write.co">
		<%-- 	<form action="${path}/upload/uploadForm" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="업로드">    
    </form> --%>
		<table>
	<%-- 		<tr>
				<td>teacher_id</td>
				<td>:</td>
				<td><input type="text" name="teacher_id" required="required"
					value="${teacher_id}"></td>
			</tr> --%>

			<tr>
				<td>member_id</td>
				<td>:</td>
				<td><input type="text" name="member_id" required="required"
					value="${member_id}"></td>
			</tr>

			<tr>
				<td>강사 연혁</td>
				<td>:</td>
				<td><input type="text" name="teacher_introduce"
					required="required"></td>
			</tr>


			<tr>
				<td colspan="3"><hr></td>
			</tr>

			<tr>
				<td><input type="button" value="취소" style="width: 100%;"
					onclick="window.location.href='list.co' "></td>
				<td><input type="reset" value="초기화" style="width: 100%"></td>
				<td><input type="submit" value="추가" style="width: 100%"></td>
			</tr>
		</table>
	</form>
</body>
</html>