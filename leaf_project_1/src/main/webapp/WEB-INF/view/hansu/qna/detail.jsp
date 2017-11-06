<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
</head>
<body>
	<table width="70%" border="1" cellpadding="0" cellspacing="0"
		align="center">
		<tr>
			<td colspan="2" align="center"><h1>상세보기</h1>
		</tr>
		<tr>
			<td>글번호</td>
			<td>${dto.qna_id}</td>
		</tr>

		<tr>
			<td>작성자</td>
			<td>${dto.member_id}</td>
		</tr>

		<tr>
			<td>제목</td>
			<td>${dto.qna_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${dto.qna_content}</td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td>${dto.qna_writedate}</td>
		</tr>
		<tr>
			<td>작성수정날</td>
			<td>${dto.qna_modifydate}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="수정하기" onClick="location.href='qna_updateform.do?qna_id=${ dto.qna_id }'"> 
				<input type="button" value="삭제하기" onClick="location.href='qna_delete.do?qna_id=${ dto.qna_id }'"> 
				<input type="button" value="목록보기" onClick="location.href='qna_list.do'">
				<input type="button" value="답글" onClick="location.href='reply.do?qna_id=${ dto.qna_id }'">
			</td>
		</tr>
	</table>
</body>
</html>