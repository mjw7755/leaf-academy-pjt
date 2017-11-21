<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
#memberlistTable {
   width: 80%;
   text-align: center;
   border: 1px solid;
}
#memberlistTable th{
   border: 1px solid;
}
#memberlistTable td{
   border: 1px solid;
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
font-size: 0.5em; }
</style>
<script type="text/javascript">
function hide(){
   alert("해당내용이 삭제됩니다");
}
function multiDelete(){
	var t= document.getElementsByName("member_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="member_multidelete.do?member_id="+sum;
}

function multiUp(){
	var t= document.getElementsByName("member_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="member_multiup.do?member_id="+sum;
}
function multiLevelUp(){
	var t= document.getElementsByName("member_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="member_multilevelup.do?member_id="+sum;
}
function multiLevelDown(){
	var t= document.getElementsByName("member_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="member_multileveldown.do?member_id="+sum;
}
</script>
</head>
<body>
<br><br><br><br><br><br>
	<form action="search_member.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" 
                placeholder="키워드 검색 가능합니다." list="memlist"> 
                <input type="submit" value="검색" class="btn btn--sm btn--green">
    </form>
	<datalist id="memlist">
	<c:forEach items="${ list }" var="list">
		<option value="${ list.member_id }"> ${ list.member_id } | ${ list.member_name } | ${ list.member_level }</option>
	</c:forEach>
	</datalist>
	<hr>
   <table id="memberlistTable">
      <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>PWD</th>
         <th>TEL</th>
         <th>EMAIL</th>
         <th>LEVEL</th>
         <th>ENABLED</th>
         <th colspan="2"><a href="member_writeform.do"><button class="btn btn--sm btn--green">추가</button></a></th>
         <th colspan="1"><a href="#"><button id="multi" onclick="multiLevelUp()" class="btn btn--sm btn--green">레벨업</button></a>&nbsp;<a href="#"><button id="multi" onclick="multiLevelDown()" class="btn btn--sm btn--green">레벨다운</button></a></th>
         <th colspan="1"><a href="#"><button id="multi" onclick="multiUp()" class="btn btn--sm btn--green">다중권한</button></a>&nbsp;<a href="#"><button id="multi" onclick="multiDelete()" class="btn btn--sm btn--green">다중삭제</button></a></th>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr onclick="test(this)">
            <td>${list.member_id}</td>
            <td>${list.member_name}</td>
            <td>${list.member_pwd}</td>
            <td>${list.member_tel}</td>
            <td>${list.member_email}</td>
            <td>${list.member_level}</td>
            <td>${list.enabled}</td>
            <td><a href="member_updateform.do?member_id=${ list.member_id }">
            <button id="edit" class="btn btn--sm btn--green">수정</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="member_id" value="${ list.member_id }"></td>
            <td>
            <a href="member_levelup.do?member_id=${ list.member_id }"><button id="up" class="btn btn--sm btn--green">랩업</button></a>
            <a href="member_leveldown.do?member_id=${ list.member_id }"><button id="delete" class="btn btn--sm btn--green">랩다운</button> </a></td> 
            <td>
            <a href="member_up.do?member_id=${ list.member_id }"><button id="up" class="btn btn--sm btn--green">권한</button></a>
            <a href="member_delete.do?member_id=${ list.member_id }"><button id="delete" class="btn btn--sm btn--green">삭제</button> </a></td>   
         </tr>
      </c:forEach>
   </table>
   
   <div align="center">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="member_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="search_member.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="member_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="search_member.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="member_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="search_member.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
<br><br><br><br><br><br>
   
</body>
</html>