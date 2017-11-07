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
	var t= document.getElementsByName("jageok_id");
	var sum = new Array();
	var j=0;
	for (var i =0 ; i<t.length; i++){
		if(t[i].checked){
			sum[j] = t[i].value;
			j=j+1;
		}
	}
	window.location.href="jageok_multidelete.lcs?jageok_id="+sum;
}
</script>
</head>
<body>
	<form action="jageok_search.lcs" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="키워드 검색 가능합니다." list="jageoklist"> 
                <input type="submit" value="검색">
    </form>
    </h3>
	<datalist  id="jageoklist">
	<c:forEach items="${ list }" var="list">
		<option value="${ list.jageok_title }"> ${ list.jageok_title } | ${ list.jageok_date } | ${ list.jageok_cost }</option>
	</c:forEach>
	</datalist>
	<hr>
	<fieldset>
   <table>
      <tr>
         <th>NO.</th>
         <th>member_id</th>
         <th>TITLE</th>
         <th>DATE</th>
         <th>COST</th>
         <th>ENABLED</th>
         <th colspan="1"><a href="jageok_writeform.lcs"><button>추가</button></a></th>
      	 <th><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr onclick="test(this)">
            <td>${list.jageok_id}</td>
            <td>${list.member_id}</td>
            <td>
            	<a href="jageok_detail.lcs?jageok_id=${ list.jageok_id }">${list.jageok_title }</a>
            </td>
            <td>${list.jageok_date}</td>
            <td>${list.jageok_cost}</td>
            <td>${list.enabled}</td>
            <td><a href="jageok_updateform.lcs?jageok_id=${ list.jageok_id }">
            <button id="edit">수 정</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="jageok_id" value="${ list.jageok_id }"></td>
            <td><a href="jageok_delete.lcs?jageok_id=${ list.jageok_id }"><button id="delete" >삭 제</button> </a></td>
            <td><a href="jageok_deletecancle.lcs?jageok_id=${ list.jageok_id }"><button id="deletecancle" >삭제취소</button> </a></td>
         </tr>
      </c:forEach>
   </table>
   
   <div align="center">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="jageok_list.lcs?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="jageok_search.lcs?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="jageok_list.lcs?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="jageok_search.lcs?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="jageok_list.lcs?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="jageok_search.lcs?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
   
</body>
</html>