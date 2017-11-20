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
#qnadetailTable {
   width: 800px;
}
#qnadetailTable td {
   border: 1px solid;
   border-radius: 4px;
}
#whqrp {
	width: 180px;
}
.btn {
       display: inline-block;
    border: none;
    border-radius: .3em;
    -webkit-box-shadow: inset 0 0 0 1px #323232, inset 0 -0.25em 0 #9f9e9e, 0 0.25em 0.25em #666666;
    /* box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05); */
    color: #000;
    cursor: pointer;
    font-family: 'Raleway', sans-serif;
    font-weight: bold;
    line-height: 1.5;
    letter-spacing: 1px;
    padding: .5em 1.5em .75em;
    position: relative;
    text-decoration: none;
    text-shadow: 0 1px 1px #c4c4c4;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    /* margin-left: 10px; */
}
.btn:active {
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
margin-top: .25em;
padding-bottom: .5em; }
.btn:active, .btn:focus {
outline: none; }
.btn--green {
    background-color: #fff; }
.btn--green {
font-size: 1em; }
.btn--sm {
font-size: 0.5em; }
</style>
</head>
<body>
<br><br><br><br>
	<table id="qnadetailTable">
		<tr>
			<td id="whqrp">글번호</td>
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
			<td style="height:200px">${fn:replace(dto.qna_content,crlf,'</br>')}</td>
		</tr>		
		<tr>
			<td>작성일</td>
			<td>${dto.qna_writedate}</td>
		</tr>
		<c:if test="${dto.qna_modifydate!=null}">
		<tr>
			<td>작성수정날</td>
			<td>${dto.qna_modifydate}</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2" align="center">
			<c:if test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
				<input type="button" value="수정하기" onClick="location.href='qna_updateform.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green"> 
				<input type="button" value="삭제하기" onClick="location.href='qna_delete.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green"> 
			</c:if>	
				<input type="button" value="목록보기" onClick="location.href='qna_list.do'" class="btn btn--sm btn--green">
				<c:if test="${sessionScope.sessionid != null}">
				<input type="button" value="답글" onClick="location.href='reply.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green">
				</c:if>
			</td>
		</tr>
	</table>
<br><br><br><br>
</body>
</html>