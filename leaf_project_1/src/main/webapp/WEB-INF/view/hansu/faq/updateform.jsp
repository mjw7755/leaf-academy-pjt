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
<form action="faq_update.do">
			<table>
			<tr>
				<td>faq_id : </td>
				<td>
				<input readonly="readonly" type="text" name="faq_id" value="${dto.faq_id}">
				</td>
			</tr>
			<tr>
				<td>faq_title : </td>
				<td>
				<input type="text" name="faq_title" value="${dto.faq_title}">
				</td>
			</tr>
			<tr>
				<td>faq_content : </td>
				<td>
				<%-- <input type="text" name="faq_content" value="${dto.faq_content}"> --%>
				<textarea rows="10" cols="50" name="faq_content" >${dto.faq_content}</textarea>
				</td>
			</tr>
			<tr>
				<td>
				<input type="button" value="취소"  
													 onclick="window.location.href='faq_list.do' ">
				</td>
				<td>
				<input type="submit" value="수정하기">
				</td>
			</tr>
				
			</table>
			
</form>
</body>
</html>