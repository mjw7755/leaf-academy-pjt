<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>자주 묻는 질문(FAQ)</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}

dl {
	width: 90%;
	height: 90%;
	margin: 50px auto;
}
dt {
	cursor: pointer;
	font-weight: bold;
}
dd {
	display: none;
	margin-top: 15px;
    margin-left: 0px;
    background-color: #f7f7f7;
    color: #898989;
    font-weight: bold;
    padding: 10px;
    font-size: 15px;
    border-top: thin solid #cccccc;
    border-bottom: thin solid #cccccc;
}

/* #scroll{
	margin-left: 50px;
}  */
#faq_head{
   width:800px;
}
#faq_head a{
   text-decoration: none;
   color: #000;
}
#faq_head hr{
	border: thin solid;
	border-color: #cccccc;
}
/*  */
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
/*  */
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
	line-height: 1.42857143;
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
<script>
 $( function () {
    //dt 를 클릭했을 때
	 $('dt').click(function() {
		  if( $('+dd',this).css('display')=='none' ) {  
		   $('dd').slideUp('fast');                       
		   $('+dd',this).slideDown('fast');
		  }else{
			  $('dd').slideUp('fast'); 
		  } 
	});
} );  
</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_notice.png">
   		</div>
   	</div>
    <!-- top banner end -->
	    <div id="faq_head">
    <a href="faq_list.do"><h1>자주 묻는 질문(FAQ)</h1></a>
    <hr>
    </div>
<table style="width: 700px">
		<c:forEach items="${ list }" var="list">
			<tr>
				<td style="height:20px"><input type="hidden" value="번호:${list.faq_id}"></td>
			</tr>
			<tr>
				<td>
					<dt>* ${list.faq_title} <!-- <img src="resources/ram/scroll2.png" id="scroll"> --></dt>
					<dd>${fn:replace(list.faq_content,crlf,'</br>')}</dd>
				</td>
			</tr>	
			<tr>	
			<c:if test="${sessionScope.sessionid == '관리자'}">
				<td><a href="faq_updateform.do?faq_id=${ list.faq_id }" ><button class="btn btn--sm btn--green">수정</button></a>
				<a href="faq_delete.do?faq_id=${ list.faq_id }"><button class="btn btn--sm btn--green">삭제</button></a></td> 
			</c:if>
			</tr>		
		</c:forEach>
</table>
<c:if test="${sessionScope.sessionid == '관리자'}">
<a href="faq_writeform.do"><button class="btn2 btn-info">추가</button></a>
</c:if>
<br><br>
</body>
</html>