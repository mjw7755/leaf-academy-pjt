<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#notecontent_form{
	width: 800px;
}
#notecontent_form hr{
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
#whqrp {
	width: 180px;
	font-weight: bold;
	text-align: left;
	/* border-bottom: 2px solid #cccccc; */
}
/*  */
/* #content{
	border: 2px solid
} */
#content_table{
	text-align: center;
}
#content_table td{
	padding-bottom: 10px;
}
/*  */
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
   		<div id="notecontent_form">
    		<h1>쪽지 읽기</h1>
		<hr>
		</div>
<table id="content_table">
<form action="answerForm.do">
	<input type="hidden" name="n_send_id" value="${dto.n_send_id }">
	<tr>
			<td colspan="2">	<div id="send">
		<a href="noteList.do">쪽지함으로</a>
		</div></td>
	<tr>
		<td id="whqrp">보낸사람 </td>
		<td class="form-control">${dto.n_send_id }</td>
	</tr>
	
	<tr>
		<td id="whqrp">제목</td>
		 <td class="form-control">${dto.n_title }</td>
	</tr>
	
	<tr>
		<td id="whqrp">내용</td>
		<td class="form-control">${dto.n_content }</td>
	</tr>	
	<tr>
		<td colspan="2"><input type="submit" value="답장하기" class="btn2 btn-info"></td>
	</tr>
</form>
</table>
</body>
</html>