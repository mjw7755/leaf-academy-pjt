<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
	#t_notice_div{
		width:600px;
		float:left;
		margin-left: 30px;
	}
	#t_notice_div a{
		text-decoration: none;
		color:#000;
	}
	#t_notice_div hr{
		border: thin solid;
		border-color: #cccccc;
	}

#tnoticedetailTable {
   width: 600px;
   text-align: center;
}
#tnoticedetailTable td {
   padding-top: 10px;
   padding-bottom: 10px;
}
#whqrp {
	width:100px;
	font-weight: bold;
	text-align: left;
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
/*  */
.form-control {
	display: block;
	margin-right: 15px;
	width: 100%;
	/* height: 34px; */
	padding: 6px 0px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	/* margin-left: 15px; */
}
</style>
</head>
<body>
<div id="t_notice_div">
<h1>공지사항 수정</h1>
<hr>
<form action="tnotice_update.do" enctype="multipart/form-data" method="post">
	<table id="tnoticedetailTable">
		<tr>
			
			<td><input readonly="readonly" type="hidden" name="tnotice_id" value="${dto.tnotice_id}" style="width: 100%;"></td>
		</tr>
		<tr>
			<td id="whqrp">member_id : </td>
			<td><input readonly="readonly" name="member_id" value="${dto.member_id}" style="width: 100%;" class="form-control"></td>
		</tr>
		<tr>
			<td id="whqrp">제목 : </td>
			<td><input type="text" name="tnotice_title" value="${dto.tnotice_title}" style="width: 100%;" class="form-control"></td>
		</tr>
		<tr>
			<td id="whqrp">내용 : </td>
			<td><textarea rows="" cols="" name="tnotice_content" style="width: 100%; height:300px" class="form-control">${dto.tnotice_content}</textarea></td>
		</tr>
	</table>
	<button type="submit" class="btn btn--sm btn--green">수정완료</button>
	<button type="reset" class="btn btn--sm btn--green">초기화</button>
	<a href="tnotice_list.do"><button class="btn btn--sm btn--green">목록으로</button></a>
</form>
</div>
</body>
</html>
