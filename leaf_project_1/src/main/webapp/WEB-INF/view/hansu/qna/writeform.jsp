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
	<form action="qna_write.do" >
	<table>
		
		<tr>
			<td>member_id</td>
			<td>:</td>
			<td><input type="text" name="member_id" required="required" ></td>
		</tr>
		
		<tr>
			<td>qna_title</td>
			<td>:</td>
			<td><input type="text" name="qna_title" ></td>
		</tr>
		
		<tr>
			<td>qna_content</td>
			<td>:</td>
			<td><input type="text" name="qna_content"></td>
		</tr>
		
		<tr><td colspan="3"><hr> </td> </tr>
		
				<tr>
					<td>
						<input type="button" value="취소" style="width: 100%;" 
													 onclick="window.location.href='qna_list.do' ">
					</td>
					<td>	<input type="reset" value="초기화" style="width: 100%"></td>
					<td>	<input type="submit" value="추가" style="width: 100%"></td>
				</tr>
	</table>
	</form>
</body>
</html>