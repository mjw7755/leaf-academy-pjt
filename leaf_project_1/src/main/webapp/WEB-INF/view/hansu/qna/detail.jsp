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
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}

#qnadetailTable {
   width: 800px;
   border-collapse: collapse;
   margin-top: 20px;
   margin-bottom: 20px;
}
#qnadetailTable th{
	border-bottom: 2px solid #cccccc;
	border-top:2px solid #cccccc;
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: #f4f3f1;
}
#qnadetailTable td{
	padding-left: 15px;
	border-left: 2px solid #cccccc;
	border-right: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
}
#title{
	border-left: 2px solid #cccccc;
	text-align: left;
	padding-left: 20px;
}
#writer{
	text-align: right;
	width: 100px;
}
#writer2{
	border-right: 2px solid #cccccc;
	width: 100px;
}
#write_d,#update_d{
	height: 50px;
}
/*  */
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
font-size: 0.7em; }
/*  */
#submit{
	width: 100%;
}
</style>
</head>
<body>
 	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_notice.png">
   		</div>
   	</div>
    <!-- top banner end -->
    
	<table id="qnadetailTable">
		<tr>
			<th id="title">${dto.qna_title}</th>
			<th id="writer">작성자</th>
			<th id="writer2">${dto.member_id}</th>
		</tr>
		<tr>
			<td colspan="3" style="height:200px" id="content">${fn:replace(dto.qna_content,crlf,'</br>')}</td>
		</tr>		
		<tr>
			<td id="write_d" colspan="3">작성일 | ${dto.qna_writedate}</td>
		</tr>
		<c:if test="${dto.qna_modifydate!=null}">
		<tr>
			<td id="update_d" colspan="3">수정일 | ${dto.qna_modifydate}</td>
		</tr>
		</c:if>
	</table>
	<div id="submit">
			<c:if test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
				<input type="button" value="수정하기" onClick="location.href='qna_updateform.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green"> 
				<input type="button" value="삭제하기" onClick="location.href='qna_delete.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green"> 
			</c:if>	
				<input type="button" value="목록보기" onClick="location.href='qna_list.do'" class="btn btn--sm btn--green">
				<c:if test="${sessionScope.sessionid != null}">
				<input type="button" value="답글" onClick="location.href='reply.do?qna_id=${ dto.qna_id }'" class="btn btn--sm btn--green">
				</c:if>
	</div>			
</body>
</html>