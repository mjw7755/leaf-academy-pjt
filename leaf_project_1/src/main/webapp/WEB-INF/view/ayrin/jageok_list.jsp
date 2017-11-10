<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<style type="text/css">
#jageoklistTable {
   width: 800px;
   text-align: center;
}
#jageoklistTable td{
   border: 1px solid;
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
    <a href="jageok_calendar.do"><button id="calendar_btn" >달력으로 보기</button></a>
	<form action="jageok_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="키워드 검색 가능합니다." list="jageoklist"> 
                <input type="submit" value="검색">
    </form>
   
	<datalist  id="jageoklist">
	<c:forEach items="${ list }" var="list">
		<option value="${ list.jageok_title }"> ${ list.jageok_title } | ${ list.jageok_date } | ${ list.jageok_cost }</option>
	</c:forEach>
	</datalist>
	<hr>
   <table id="jageoklistTable">
      <tr>
         <!-- <th>NO.</th>
         <th>작성자</th> -->
         <th>자격증</th>
         <th>시험일</th>
         <th>비용</th>
         <!-- <th>ENABLED</th> -->
         <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
         <th><a href="jageok_writeform.do"><button>추가</button></a></th>
      	 <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
      	 </c:if>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr onclick="test(this)">
            <%-- <td>${list.jageok_id}</td>
            <td>${list.member_id}</td> --%>
            <td>
            	<a href="jageok_detail.do?jageok_id=${ list.jageok_id }">${list.jageok_title }</a>
            </td>
            <td>${list.jageok_date}</td>
            <td>${list.jageok_cost}</td>
            <%-- <td>${list.enabled}</td> --%>
         	<c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
            <td><a href="jageok_updateform.do?jageok_id=${ list.jageok_id }">
            <button id="edit">수 정</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="jageok_id" value="${ list.jageok_id }"></td>
            <td><a href="jageok_delete.do?jageok_id=${ list.jageok_id }"><button id="delete" >삭 제</button> </a></td>
            <td><a href="jageok_deletecancle.do?jageok_id=${ list.jageok_id }"><button id="deletecancle" >삭제취소</button> </a></td>
            </c:if>
         </tr>
      </c:forEach>
   </table>
   
   <div align="center">
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
      <c:if test="${flag == 'list' }">
         <a class="strong" href="jageok_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="jageok_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="jageok_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search' }">
         <a class="strong" href="jageok_search.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
</body>
</html>