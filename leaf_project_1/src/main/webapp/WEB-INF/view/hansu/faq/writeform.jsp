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
	<form action="faq_write.do" >
	<table>
		<th><b> 자주 묻는 질문 </b></th>
		<tr>
			<td>faq_title</td>
			<td>:</td>
			<td><input type="text" name="faq_title" size="50"></td>
		</tr>
		
		<tr>
			<td>faq_content</td>
			<td>:</td>
			<!-- <td><input type="text" name="faq_content"></td> -->
			<td><textarea rows="10" cols="50" name="faq_content" ></textarea></td>
		</tr>
		
		<tr><td colspan="3"><hr> </td> </tr>
		
				<tr>
					<td>
						<input type="button" value="취소" style="width: 100%;" 
													 onclick="window.location.href='faq_list.do' ">
					</td>
					<td>	<input type="reset" value="초기화" style="width: 100%"></td>
					<td>	<input type="submit" value="추가" ></td>
				</tr>
	</table>
	</form>
</body>
</html>