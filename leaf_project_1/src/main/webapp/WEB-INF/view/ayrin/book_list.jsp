<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
#booklistTable {
   width: 800px;
   text-align: center;
}
#booklistTable th{
   width: 50px;
}
#book{
	border-bottom: 1px solid;
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
	<form action="book_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="제목, 저자 검색 가능합니다." list="booklist"> 
             <input type="submit" value="검색">
    </form>
    <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
    <a href="book_writeform.do"><button>추가</button></a>
    <button id="multi" onclick="multiDelete()">다중삭제</button>
	<datalist  id="booklist">
	<c:forEach items="${ list }" var="list">
		<option value="${ list.book_title }"> ${ list.book_title } | ${ list.book_writer } | ${ list.book_cost }</option>
	</c:forEach>
	</datalist>
	</c:if>
	<hr>
   <table id="booklistTable">
      <c:forEach items="${ list }" var="list" varStatus="status">
            <c:if test="${sessionScope.sessionid!='관리자' and sessionScope.sessionid!='강사1'}">
         <tr>
            <td rowspan="4" id="book"><a href="book_detail.do?book_id=${ list.book_id }">
            <img src="resources/${list.book_image}" style="width: 120px; height: 140px"></a></td>
         </tr>
          <tr>
            <td>
            	<a href="book_detail.do?book_id=${ list.book_id }">${list.book_title }</a>
            </td>
          </tr>
          <tr>
            <td>${list.book_writer}</td>
          </tr>
          <tr>
            <td id="book">${list.book_cost}</td>
          </tr>
          </c:if>
      </c:forEach>   
   </table>
   
   <table id="booklistTable">
      <c:forEach items="${ list }" var="list" varStatus="status">
      <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
         <tr>
         	<td  rowspan="4"><input id="multi" type="checkbox" style="width: 30px;" name="book_id" value="${ list.book_id }"></td>
         </tr>
         <tr>
            <td rowspan="4" id="book"><img src="resources/${list.book_image}" style="width: 120px; height: 140px"></td>
         </tr>
          <tr>
            <td>
            	<a href="book_detail.do?book_id=${ list.book_id }">${list.book_title }</a>
            </td>
          </tr>
          <tr>
            <td>${list.book_writer}</td>
          </tr>
          <tr>
            <td>${list.book_cost}</td>
          </tr>
            <%-- <td>${list.enabled}</td> --%>
       	  <tr>
          	<td><a href="book_updateform.do?book_id=${ list.book_id }"><button id="edit">수 정</button></a></td>
          	<td><a href="book_delete.do?book_id=${ list.book_id }"><button id="delete" >삭 제</button></a></td>
          	<td><a href="book_deletecancle.do?book_id=${ list.book_id }"><button id="deletecancle" >삭제취소</button></a></td>
          </tr>
          </c:if>
      </c:forEach>
   </table>
   
   <div align="center">
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
   
</body>
</html>