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
#book_list{
   width:800px;
}
#book_list a{
   text-decoration: none;
   color: #000;
}
#book_list hr{
	border: thin solid;
	border-color: #cccccc;
}
#booklistTable {
   width: 700px;
   text-align: center;
}

.bookline {
	border-bottom: 1px solid;
} 
#booktd {
   width: 300px;
   height: 50px;
   text-align: left;
}
#booktd a{
	text-decoration: none;
	font-weight: bold;
	color:#000;
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
    font-size: 0.7em;
    width: 100px; }

#search{
	width: 800px;
	text-align: right;
	margin-top:20px;
	margin-bottom: 20px;
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
#booklistTable{
	border-collapse: collapse;
	border-spacing: 0px;
}
</style>
<script type="text/javascript">
function multiDelete(){
	var t= document.getElementsByName("book_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="book_multidelete.do?book_id="+sum;
}
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="http://www.blueb.co.kr/data/201010/IJ12882511794405/jquery.tablesorter.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	$("#booklistTable").tablesorter(); 
}); 
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
    <div id="book_list">
    <a href="book_list.do"><h1>도서</h1></a>
<hr>
<div id="search">
	<form action="book_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="제목, 저자 검색 가능합니다." list="booklist"> 
             <!-- <button type="submit" class="btn btn--sm btn--green">검색</button> -->
             <input type="image" src="resources/ram/search.png" id="search_icon">
    </form>
    </div>
    <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
	    <div id="dnawlrdu">
		    <a href="book_writeform.do"><button class="btn btn--sm btn--green">추가</button></a>
		    <button id="multi" onclick="multiDelete()" class="btn btn--sm btn--green">다중삭제</button>
	    </div>
	<datalist  id="booklist">
		<c:forEach items="${ list }" var="list">
			<option value="${ list.book_title }"> ${ list.book_title } | ${ list.book_writer } | ${ list.book_cost }</option>
		</c:forEach>
	</datalist>
	</c:if>
   <table id="booklistTable">
      <c:forEach items="${ list }" var="list" varStatus="status">
			<c:if test="${sessionScope.sessionid!='관리자'}">
			<tr>
				<td rowspan="4" class="bookline" style="width:100px"><a href="book_detail.do?book_id=${ list.book_id }">
				<img src="resources/${list.book_image}" style="width: 100px; height: 120px"></a></td>
			</tr>
			<tr>
				<td id="booktd">
					<a href="book_detail.do?book_id=${ list.book_id }">${list.book_title }</a>
				</td>
				<td rowspan="4" style="width:80px"><input type="button" value="구매하기" class="btn btn--sm btn--green"></td>
			</tr>
			<tr>
				<td id="booktd">저자(출판사) : ${list.book_writer}</td>
			</tr>
			<tr>
				<td id="booktd" class="bookline">가격 : ${list.book_cost}</td>
			</tr>
			</c:if>
      </c:forEach>   
   </table>
   
   <table id="booklistTable">
      <c:forEach items="${ list }" var="list" varStatus="status">
      <c:if test="${sessionScope.sessionid=='관리자'}">
         <tr>
         	<td rowspan="4"><input id="multi" type="checkbox" style="width: 30px;" name="book_id" value="${ list.book_id }"></td>
            <td rowspan="4" class="bookline"><a href="book_detail.do?book_id=${ list.book_id }">
            <img src="resources/${list.book_image}" style="width: 120px; height: 140px"></a></td>
         </tr>
         <tr>
            <td id="booktd"><a href="book_detail.do?book_id=${ list.book_id }"> ${list.book_title }</a></td>
            <td><a href="book_updateform.do?book_id=${ list.book_id }"><button id="edit" class="btn btn--sm btn--green">수 정</button></a></td>
         </tr>
         <tr>
            <td id="booktd" >저자(출판사) : ${list.book_writer}</td>
            <td><a href="book_delete.do?book_id=${ list.book_id }"><button id="delete" class="btn btn--sm btn--green">삭 제</button></a></td>
         </tr>
         <tr>
            <td id="booktd" class="bookline" >가격 : ${list.book_cost}</td>
            <td><a href="book_deletecancle.do?book_id=${ list.book_id }"><button id="deletecancle" class="btn btn--sm btn--green">삭제취소</button></a></td>
         </tr>
            <%-- <td>${list.enabled}</td> --%>
         </c:if>
      </c:forEach>
   </table>
   
   <div align="center" id="page">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="book_list.do?page=${startPage-1}">이전</a>
      </c:if>
      
      <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="book_search.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="book_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search' }">
      	 <a class="strong" href="book_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>      
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="book_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="book_search.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
   </div>
</body>
</html>