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
}
#noticelistTable td{
   	border: 1px solid;
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
<br><br><br><br><br>
   <table id="noticelistTable">
      <tr>
         <th>글번호</th><!-- notice_id -->
         <th>작성자</th><!-- member_id -->
         <th>제목</th><!-- notice_title -->
  		 <th>작성일</th><!-- notice_writedate -->
  		 <c:if test="${sessionScope.sessionid == '관리자'}">
  		 <th><a href="notice_writeform.do"><button class="btn btn--sm btn--green">추가</button></a></th>
  		 </c:if>
 		 <c:if test="${sessionScope.sessionid == '관리자'}">
 		 <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()" class="btn btn--sm btn--green">다중삭제</button></a></th>     
      	</c:if>
      </tr>
      <c:forEach items="${ list }" var="list">
         <tr>
            <td>${list.notice_id}</td>
            <td>${list.member_id}</td>
            <td><a href="notice_detail.do?notice_id=${ list.notice_id }" style="text-decoration: none;">${list.notice_title}</a></td>
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
         <div>
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
      	<form action="notice_search.do" method="post">
		<select name="column">
			<option value="notice_id">아이디</option>
			<option value="member_id">작성자</option>
			<option value="notice_title">제목</option>
		</select>
		<input type="text" name="keyvalue">
		<input type="submit" value="검색" class="btn btn--sm btn--green">
	</form>
<br><br><br><br><br>
</body>
</html>