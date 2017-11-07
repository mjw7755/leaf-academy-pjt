<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
table {
   width: 100%;
   text-align: center;
   font-size: 20px;
}
table th{
   background-color: black;
   color: white;
}
table tr:nth-child(even) {
   background-color: lightgray;
}
table tr:HOVER {
   color: white;
   background-color: black;
}
table tr:ACTIVE{
   color: black;
   font-weight:bold;
   background-color: lightyellow;
}
ul {
    list-style:none;
    margin:0;
    padding:0;
}
li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
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
	window.location.href="member_multidelete.lcs?member_id="+sum;
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
	window.location.href="member_multiup.lcs?member_id="+sum;
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
	window.location.href="member_multilevelup.lcs?member_id="+sum;
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
	window.location.href="member_multileveldown.lcs?member_id="+sum;
}
</script>
</head>
<body>
	<form action="search_member.lcs" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" 
                placeholder="키워드 검색 가능합니다." list="memlist"> 
                <input type="submit" value="검색">
    </form>
    </h3>
	<datalist  id="memlist">
	<c:forEach items="${ list }" var="list">
		<option value="${ list.member_id }"> ${ list.member_id } | ${ list.member_name } | ${ list.member_level }</option>
	</c:forEach>
	</datalist>
	<hr>
	<fieldset>
   <table>
      <tr>
         <th>ID</th>
         <th>NAME</th>
         <th>PWD</th>
         <th>TEL</th>
         <th>EMAIL</th>
         <th>LEVEL</th>
         <th>ENABLED</th>
         <th colspan="2"><a href="member_writeform.lcs"><button>추가</button></a></th>
         <th colspan="1"><a href="#"><button id="multi" onclick="multiLevelUp()">레벨업</button></a>&nbsp;<a href="#"><button id="multi" onclick="multiLevelDown()">레벨다운</button></a></th>
         <th colspan="1"><a href="#"><button id="multi" onclick="multiUp()">다중권한</button></a>&nbsp;<a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
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
            <td><a href="member_updateform.lcs?member_id=${ list.member_id }">
            <button id="edit">수 정</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="member_id" value="${ list.member_id }"></td>
            <td>
            <a href="member_levelup.lcs?member_id=${ list.member_id }"><button id="up" >랩업</button></a>
            <a href="member_leveldown.lcs?member_id=${ list.member_id }"><button id="delete" >랩다운</button> </a></td> 
            <td>
            <a href="member_up.lcs?member_id=${ list.member_id }"><button id="up" >권 한</button></a>
            <a href="member_delete.lcs?member_id=${ list.member_id }"><button id="delete" >삭 제</button> </a></td>   
         </tr>
      </c:forEach>
   </table>
   
   <div align="center">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="member_list.lcs?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="search_member.lcs?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="member_list.lcs?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="search_member.lcs?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="member_list.lcs?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="search_member.lcs?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
   
</body>
</html>