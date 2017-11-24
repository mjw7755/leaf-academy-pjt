<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<head>
<title>답변 달기</title>
<style type="text/css">
#replyform{
   width:800px;
}

#replyform hr{
	border: thin solid;
	border-color: #cccccc;
}
/*  */
#qnareplyTable {
   width: 800px;
   text-align: center;
}
#qnareplyTable td {
   padding-top: 10px;
   padding-bottom: 10px;
}
#whqrp {
	width: 180px;
	font-weight: bold;
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
<div id="replyform">
    <h1>Q&A 답글</h1>
<hr>
</div>
	<form action="replyok.do" >
	<table id="qnareplyTable">
		<tr>
			<td id="whqrp">제목 : </td><!-- qna_title -->
			<td><input type="text" name="qna_title" value="re: ${dto.qna_title }" style="width: 100%;" class="form-control"></td>
		</tr>		
		<tr>
			<td>내용 : </td><!-- qna_content -->
			<td><textarea style="width: 100%; height:300px" name="qna_content" class="form-control"></textarea></td>
		</tr>
  		<tr>
	        <td colspan="2">
		    <c:if test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
		    <input type="submit" value="답변" class="btn btn--sm btn--green"> | 
		        <input type="reset" value="취소" class="btn btn--sm btn--green">
		    </c:if>    
		        <input type="button" onClick="location.href='qna_list.do'" value="목록" class="btn btn--sm btn--green">
     		</td>
 		 </tr>
	</table>
<input type="hidden" name="qna_id" value="${dto.qna_id}">
<input type="hidden" name="qna_ref" value="${dto.qna_ref}">
<input type="hidden" name="qna_step" value="${dto.qna_step}">
<input type="hidden" name="qna_level" value="${dto.qna_level}">
</form>
<br><br><br><br><br>
</body>
</html>
