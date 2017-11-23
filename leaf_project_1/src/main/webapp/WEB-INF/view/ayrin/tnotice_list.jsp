<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
#tnoticelistTable {
   width: 800px;
   text-align: center;
}
#tnoticelistTable td{
   border: 1px solid;
   height: 30px;
   border-radius: 4px;
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
</head>
<body>
<c:if test="${session.ssessionlevel != 1 }">	
	<form action="tnotice_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="키워드 검색 가능합니다." list="tnoticelist"> 
             <button type="submit" class="btn btn--sm btn--green">검색</button>
    </form>
   
	<datalist>
		<c:forEach items="${ list }" var="list">
			<option value="${ list.tnotice_title }"> ${ list.tnotice_title } </option>
		</c:forEach>
	</datalist>
	<br><hr><br>
   <table id="tnoticelistTable">
      <tr>
         <th>글번호</th>
         <th>제목</th>
         <th colspan="2"><a href="tnotice_writeform.do"><button class="btn btn--sm btn--green">추가</button></a></th>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr>
            <td>${list.tnotice_id}</td>
            <td>
            	<a href="tnotice_detail.do?tnotice_id=${ list.tnotice_id }">${list.tnotice_title }</a>
            </td>
	            <td><a href="tnotice_updateform.do?tnotice_id=${ list.tnotice_id }">
	            <button id="edit" class="btn btn--sm btn--green">수정</button> </a></td>
	            <td><a href="tnotice_delete.do?tnotice_id=${ list.tnotice_id }"><button id="delete" class="btn btn--sm btn--green">삭제</button> </a></td>
         </tr>
      </c:forEach>
   </table>
   <br><br>
   <div align="center">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list'}">
         <a class="button btn-prev" href="tnotice_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="button btn-prev" href="tnotice_search.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
</c:if>



</body>
</html>