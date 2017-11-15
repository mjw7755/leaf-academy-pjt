<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#faqupdateTable {
   width: 800px;
   text-align: center;
}
#faqupdateTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<br><br><br><br>
<form action="faq_update.do">
	<table id="faqupdateTable">
		<tr>
			<td id="whqrp">글번호 : </td><!-- faq_id -->
			<td>
				<input readonly="readonly" type="text" name="faq_id" value="${dto.faq_id}" style="width: 100%">
			</td>
		</tr>
		<tr>
			<td>제목 : </td><!-- faq_title -->
			<td>
				<input type="text" name="faq_title" value="${dto.faq_title}" style="width: 100%;">
			</td>
		</tr>
		<tr>
			<td>내용 : </td><!-- faq_content -->
			<td>
				<textarea name="faq_content" style="width: 100%; height:300px">${dto.faq_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="취소" onclick="window.location.href='faq_list.do' ">
				<input type="submit" value="수정하기">
			</td>
		</tr>		
	</table>			
</form>
<br><br><br><br>
</body>
</html>