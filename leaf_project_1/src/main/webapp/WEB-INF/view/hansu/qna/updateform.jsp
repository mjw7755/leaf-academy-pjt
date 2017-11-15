<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#qnaupdateTable {
   width: 800px;
   text-align: center;
}
#qnaupdateTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<br><br><br><br><br>
<form action="qna_update.do">
	<table id="qnaupdateTable">
		<tr>
			<td id="whqrp">글번호 : </td><!-- qna_id -->
			<td><input readonly="readonly" type="text" name="qna_id" value="${dto.qna_id}" style="width:100%;"></td>
		</tr>
		<tr>
			<td>작성자 : </td><!-- member_id -->
			<td><input readonly="readonly" type="text" name="member_id" value="${dto.member_id}" style="width:100%;"></td>
		</tr>
		<tr>
			<td>제목 : </td><!-- qna_title -->
			<td><input type="text" name="qna_title" value="${dto.qna_title}" style="width:100%;"></td>
		</tr>
		<tr>
			<td>내용 : </td><!-- qna_content -->
			<td><textarea style="width:100%; height:300px" name="qna_content">${dto.qna_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="취소" onclick="window.location.href='qna_list.do' ">
				<input type="submit" value="수정하기">
			</td>
		</tr>
	</table>
</form>
<br><br><br><br><br>
</body>
</html>
			<%-- <input type="hidden" name="member_id" value="${sessionScope.sessionid }"> --%>