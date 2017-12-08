<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#jageok_list{
   width:800px;
}
#jageok_list a{
   text-decoration: none;
   color: #000;
}
#jageok_list hr{
	border: thin solid;
	border-color: #cccccc;
}
#jageoklistTable {
   width: 800px;
   border-collapse: collapse;
}
#jageoklistTable th{
	background-color: #f4f3f1;
	border-bottom: 1px solid;
	border-bottom-color: #cccccc;
	height: 50px;
}
#jageoklistTable tr{
	border-bottom: 1px solid;
	border-bottom-color: #cccccc;
	height: 50px;
}

/* #jageoklistTable td{
   border: 1px solid;
   height: 30px;
   border-radius: 4px;
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
    padding: .5em 1.5em .5em;
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
font-size: 0.5em; }
/*  */
#text{
	 width: 800px;
	 margin-top: 20px;
}
#search{
	text-align: right;
	margin-bottom: 30px;
	
}
#search form{
	font-size: 13px;
}

#search form input{
	font-size: 13px;
}
#search_icon{
	vertical-align: middle;
}
#title{
	padding-left: 7px;
}
#jageok_name a{
	text-decoration: none;
	color:#21307a;
	font-weight: bold;
	padding-left: 30px;
}
#center{
	text-align: center;
}
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
</style>

<script type="text/javascript">
function multiDelete(){
	var t= document.getElementsByName("jageok_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="jageok_multidelete.do?jageok_id="+sum;
}
</script>
</head>
<body>
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_book.png">
   		</div>
   	</div>
    <!-- top banner end -->
    <div id="jageok_list">
      <a href="jageok_list.do"><h1>자격증 시험안내</h1></a>
<hr>
    <div id="text">
	<b>※ 모든 시험 접수일은 1~3개월 전부터 확인 해야합니다 ! ※</b><br><br>
	<div id="search">
	<form action="jageok_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="키워드 검색 가능합니다." list="jageoklist"> 
             <input type="image" src="resources/ram/search.png" id="search_icon">
    </form>
    </div>
   </div>
	<datalist  id="jageoklist">
		<c:forEach items="${ list }" var="list">
			<option value="${ list.jageok_title }"> ${ list.jageok_title } | ${ list.jageok_date } | ${ list.jageok_cost }</option>
		</c:forEach>
	</datalist>
   <table id="jageoklistTable">
      <tr>
         <!-- <th>NO.</th>
         <th>작성자</th> -->
         <th id="title">글번호</th>
         <th id="title">자격증</th>
         <th id="title">시험일</th>
         <th id="title">비용</th>
         <!-- <th>ENABLED</th> -->
         <c:if test="${sessionScope.sessionlevel !=1}">
         <th><a href="jageok_writeform.do"><button class="btn2 btn-info">추가</button></a></th>
      	 <th colspan="3"><a href="#"><button id="multi" onclick="multiDelete()" class="btn2 btn-info">다중삭제</button></a></th>
      	 </c:if>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr onclick="test(this)">
            <%-- <td>${list.jageok_id}</td>
            <td>${list.member_id}</td> --%>
            <td id="center">${list.jageok_id }</td>
            <td id="jageok_name">
            	<a href="jageok_detail.do?jageok_id=${ list.jageok_id }">${list.jageok_title }</a>
            </td>
            <td id="center">${list.jageok_date}</td>
            <td id="center">${list.jageok_cost}</td>
            <%-- <td>${list.enabled}</td> --%>
         	<c:if test="${sessionScope.sessionlevel !=1}">
            <td><a href="jageok_updateform.do?jageok_id=${ list.jageok_id }">
            <button id="edit" class="btn btn--sm btn--green">수정</button> </a></td>
            <td><a href="jageok_delete.do?jageok_id=${ list.jageok_id }"><button id="delete" class="btn btn--sm btn--green">삭 제</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="jageok_id" value="${ list.jageok_id }"></td>
            <td><a href="jageok_deletecancle.do?jageok_id=${ list.jageok_id }"><button id="deletecancle" class="btn btn--sm btn--green">삭제취소</button> </a></td>
            </c:if>
         </tr>
      </c:forEach>
   </table>
   <br><br>
   <div align="center" id="page">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="jageok_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="jageok_search.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="jageok_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="jageok_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="jageok_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="jageok_search.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
</div>
</body>
</html>
