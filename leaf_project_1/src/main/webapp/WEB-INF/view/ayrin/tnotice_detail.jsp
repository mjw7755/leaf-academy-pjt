<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#tnoticedetailTable {
   width: 800px;
   margin-top: 20px;
}
#tnoticedetailTable hr{
	border: thin solid;
	color: #999;
}
#content{
	padding-left: 15px;
	font-size: 13px;
	color:#565656;
	vertical-align: top;
}
/* #tnoticedetailTable td{
   border: 1px solid;
} */

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
    /* text-shadow: 0 1px 1px #c4c4c4; */
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
font-size: 0.6em; }
#title{
	padding-left: 15px;
	width: 50px;
	font-weight: bold;
}
</style>
</head>
<body>
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_tnotice.png">
   		</div>
   	</div>
    <!-- top banner end -->
<table id="tnoticedetailTable">
	<tr> <td id="title">제목 : </td> <td>${dto.tnotice_title}</td> </tr>
	<tr> <td id="title" colspan="2">내용 : </td></tr>
	<tr> <td colspan="2" id="content">${dto.tnotice_content}</td></tr>
</table>
	<a href="tnotice_list.do"><button class="btn btn--sm btn--green">목록으로</button></a>
    <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
	<a href="tnotice_updateform.do?tnotice_id=${ dto.tnotice_id }"><button class="btn btn--sm btn--green">수정하기</button></a>
	<a href="tnotice_list.do"><button class="btn btn--sm btn--green">목록</button></a>
	</c:if>
</body>
</html>

