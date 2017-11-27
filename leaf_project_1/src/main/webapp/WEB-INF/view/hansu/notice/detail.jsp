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
#noticedetailTable {
   width: 800px;
   border-collapse: collapse;
   margin-top: 20px;
   margin-bottom: 20px;
}
#noticedetailTable th{
	border-bottom: 2px solid #cccccc;
	border-top:2px solid #cccccc;
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: #f4f3f1;
}
#table_content{
	padding-top: 15px;
	padding-left: 15px;
	padding-bottom: 30px;
	border-left: 2px solid #cccccc;
	border-right: 2px solid #cccccc;
	border-bottom: 2px solid #cccccc;
}
#title{
	border-left: 2px solid #cccccc;
	text-align: left;
	padding-left: 20px;
}
#write_d{
	text-align: right;
}
#write_d2{
	width: 150px;
	border-right: 2px solid #cccccc;

}
#update_d{
    width: 100px;
    color: #4e4e4e;
    font-weight: bold;
    padding-left: 15px;
    padding-top: 15px;
}
#update_d2{
	text-align: left;
	 padding-top: 15px;
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
font-size: 0.7em; }
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
    
	<table id="noticedetailTable">
		<tr>
			<th colspan="2" id="title">${dto.notice_title}</th>
			<th id="write_d">작성일</th>
			<th id="write_d2">${dto.notice_writedate}</th>
		</tr>
		<tr>
			<td style="height:200px" colspan="4" id="table_content">${fn:replace(dto.notice_content,crlf,'</br>')}</td>
			
		</tr>		

		<c:if test="${dto.notice_modifydate!=null}">
		<tr>
			<td id="update_d">작성수정일</td>
			<td id="update_d2">${dto.notice_modifydate}</td>
		</tr>
		</c:if>
	</table>
	<div id="submit">
			<c:if test="${sessionScope.sessionid eq '관리자'}">
			<input type="button" value="수정하기" onClick="location.href='notice_updateform.do?notice_id=${ dto.notice_id }'" class="btn btn--sm btn--green"> 
				<input type="button" value="삭제하기" onClick="location.href='notice_delete.do?notice_id=${ dto.notice_id }'" class="btn btn--sm btn--green"> 
			</c:if>	
				<input type="button" value="목록보기" onClick="location.href='notice_list.do'" class="btn btn--sm btn--green">
	</div>			
</body>
</html>