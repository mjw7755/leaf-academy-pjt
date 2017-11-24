<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지보내기</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#notewrite_form{
	width: 800px;
}
#notewrite_form hr{
	border: thin solid;
	border-color: #cccccc;
}
#send{
	margin-top: 20px;
	text-align: left;
	margin-bottom: 20px;
}

#send a{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #21307a;
    margin-right: 5px;
    /* margin-top: 15px; */
    padding: 5px;
    border: 2px solid;
    border-radius: 4px;
}
#notewrite_table{
	text-align: center;
}
#notewrite_table td{
	padding-bottom: 10px;
}
#whqrp {
	width: 180px;
	font-weight: bold;
	text-align: left;
}
/*  */
.form-control {
	display: block;
	margin-right: 15px;
	width: 300px;
	/* height: 34px; */
	padding: 6px 0px;
	padding-left:10px;
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
/* button */
.btn-info {
	color: #fff;
	background-color: #f16022;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #b64413;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #b64413;
	border-color: #973911;
}
.btn2 {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
	font-size: 14px;
	font-weight: 400;
	/* line-height: 1.42857143; */
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;	
}
</style>
</head>
<body>
 	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
   		<div id="notewrite_form">
    		<h1>쪽지 보내기</h1>
		<hr>
		</div>
		
	
	<table id="notewrite_table" >
		<tr>
			<td colspan="2">	<div id="send">
		<a href="noteList.do">쪽지함으로</a>
		</div></td>
		</tr>
		<tr>
			<td id="whqrp">보내는 사람 : </td>
			<td><input type="text" name="n_send_id" id="n_send_id" value="${sessionScope.sessionid}" class="form-control"></td>
		</tr>
		
		<tr>
			<td id="whqrp">받는 사람 : </td>
			<td> <input type="text" placeholder="ID입력" class="form-control" name="n_recv_id" id="n_recv_id" list="recvid" value="<c:forEach items="${chkValues }" var="value" varStatus="status" ><c:if test="${status.index < fn:length(chkValues)-1}">${value },</c:if><c:if test="${status.index == fn:length(chkValues)-1 }">${value }</c:if></c:forEach>"></td>
			<datalist  id="recvid">
				<c:forEach items="${ list }" var="list">
					<option value="${ list.member_id }"> ${ list.member_id } | ${ list.member_name }</option>
				</c:forEach>
			</datalist>
		</tr>
		
		<tr>
			<td id="whqrp">제목 : </td>
			<td> <input type="text" name="n_title" id="n_title" class="form-control"></td>
		</tr>
		
		<tr>
			<td id="whqrp">내용 : </td>
			<td><textarea  name="n_content" id="n_content" class="form-control" style="height: 200px"></textarea></td>
		</tr>
				
		<tr>
			<td colspan="2"><!-- <input type="submit" value="보내기"> --><button id="mgmtNoteSend" class="btn2 btn-info" onclick="javascript:history.go(-1)">보내기</button>
			<button onclick="javascript:history.go(-1)" class="btn2 btn-info">취소</button></td>
		</tr>
	</table>
</body>
</html>