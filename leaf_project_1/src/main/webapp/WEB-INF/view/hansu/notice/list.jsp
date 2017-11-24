<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#notice_page{
	width: 800px;
}
#notice_head{
   width:800px;
}
#notice_head a{
   text-decoration: none;
   color: #000;
}
#notice_head hr{
	border: thin solid;
	border-color: #cccccc;
}
/*  */
#search{
	text-align: right;
	margin-bottom: 30px;
}
#search form{
	font-size: 13px;
    margin-top: 20px;
    margin-bottom: 20px;
}

#search form input{
	font-size: 13px;
	vertical-align: top;
}
#search form select{
	height: 21.2px;
}
#search_icon{
	vertical-align: middle;
}
</style>
<title></title>
<script type="text/javascript">
   function hide(){
      alert("해당내용이 삭제됩니다");
   }
   
   function multiDelete(){
	   var t= document.getElementsByName("notice_id");
	   var sum = new Array();
	   var j=0;
	   for (var i =0 ; i<t.length; i++){
	      if(t[i].checked){
	         sum[j] = t[i].value;
	         j=j+1;
	      }
	   }
	   window.location.href="notice_multidelete.do?notice_id="+sum;
	}
</script>
<style type="text/css">
#noticelistTable {
   width: 800px;
   text-align: center;
   	border-collapse: collapse;
	margin-top: 50px;
}
#noticelistTable td{
	height: 50px;
	border-bottom: 1px solid #cccccc;
}
#noticelistTable th{
	border-bottom: 1px solid #cccccc;
	background-color: #f4f3f1;
	height: 50px;
}
#text_left{
	text-align: left;
	padding-left: 25px;
}
#text_left a{
	text-decoration: none;
	color:#21307a;
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
    padding: .5em 1.5em .5em;
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
	padding: 1px 12px;
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
#page {
	margin-top: 10px;
}
#page a{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #13b69d;
    margin-right: 5px;
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
    <div id="notice_head">
    <a href="notice_list.do"><h1>공지사항</h1></a>
    <hr>
    </div>

<div id="notice_page">
	<div id="search">
	<form action="notice_search.do" method="post">
		<select name="column">
			<option value="notice_id">글번호</option>
			<option value="member_id">작성자</option>
			<option value="notice_title">제목</option>
		</select> <input type="text" name="keyvalue"> 
				<input type="image" src="resources/ram/search.png" id="search_icon">
	</form>
	</div>

	<table id="noticelistTable">
      <tr>
         <th>글번호</th><!-- notice_id -->
         <th>작성자</th><!-- member_id -->
         <th>제목</th><!-- notice_title -->
  		 <th>작성일</th><!-- notice_writedate -->
  		 <c:if test="${sessionScope.sessionid == '관리자'}">
  		 <th><a href="notice_writeform.do"><button class="btn2 btn-info">추가</button></a></th>
  		 </c:if>
 		 <c:if test="${sessionScope.sessionid == '관리자'}">
 		 <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()" class="btn2 btn-info">다중삭제</button></a></th>     
      	</c:if>
      </tr>
      <c:forEach items="${ list }" var="list">
         <tr>
            <td>${list.notice_id}</td>
            <td>${list.member_id}</td>
            <td id="text_left"><a href="notice_detail.do?notice_id=${ list.notice_id }" style="text-decoration: none;">${list.notice_title}</a></td>
            <c:if test="${list.notice_modifydate == null}">
            <td>${list.notice_writedate}</td>
            </c:if>
            <c:if test="${list.notice_modifydate != null}">
            <td>${list.notice_modifydate}</td>
            </c:if> 
            <c:if test="${sessionScope.sessionid == '관리자'}">
            <td><a href="notice_updateform.do?notice_id=${ list.notice_id }"><button id="edit" class="btn btn--sm btn--green">수정</button> </a></td>
            <td><a href="notice_delete.do?notice_id=${ list.notice_id }"><button id="delete" class="btn btn--sm btn--green">삭제</button></a></td>
            
             <td id="multi"><input type="checkbox" style="width: 30px;" name="notice_id" value="${ list.notice_id }"></td>
        	 </c:if>
         </tr>
      </c:forEach>

   </table>
         <div id="page">
    <c:if test="${param.page>5}">
      	<c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="notice_list.do?page=${startPage-1}">이전</a>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="notice_search.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
         </c:if>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="notice_list.do?page=${startPage+i}">${startPage+i}</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
          <a class="strong" href="notice_search.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a></li>
         </c:if>
        
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
       	 <c:if test="${flag == 'list' }">
         <a class="strong" href="notice_list.do?page=${startPage+5}">다음</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="strong" href="notice_search.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a></li>
         </c:if>
         
      </c:if>
   </div>
</div>
</body>
</html>