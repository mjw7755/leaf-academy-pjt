<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<style type="text/css">
#noticedetailTable {
   width: 800px;
}
#noticedetailTable td {
   border: 1px solid;
}
#whqrp {
	width: 180px;
}
</style>
</head>
<body>
<br><br><br><br><br>
	<table id="noticedetailTable">
		<tr>
			<td id="whqrp">글번호</td>
			<td>${dto.notice_id}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${dto.member_id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.notice_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td style="height:200px">${fn:replace(dto.notice_content,crlf,'</br>')}</td>
			
		</tr>		
		<tr>
			<td>작성일</td>
			<td>${dto.notice_writedate}</td>
		</tr>
		<c:if test="${dto.notice_modifydate!=null}">
		<tr>
			<td>작성수정날</td>
			<td>${dto.notice_modifydate}</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2" align="center">
			<c:if test="${sessionScope.sessionid eq '관리자'}">
			<input type="button" value="수정하기" onClick="location.href='notice_updateform.do?notice_id=${ dto.notice_id }'"> 
				<input type="button" value="삭제하기" onClick="location.href='notice_delete.do?notice_id=${ dto.notice_id }'"> 
			</c:if>	
				<input type="button" value="목록보기" onClick="location.href='notice_list.do'">
			</td>
		</tr>
	</table>
</body>
</html>