<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript">
   function hide(){
      alert("해당내용이 삭제됩니다");
   }
   
   function multiDelete(){
	   var t= document.getElementsByName("qna_id");
	   var sum = new Array();
	   var j=0;
	   for (var i =0 ; i<t.length; i++){
	      if(t[i].checked){
	         sum[j] = t[i].value;
	         j=j+1;
	         /* alert(t[i].value); */
	      }
	   }
	   /* alert("test.do?gno="+sum); */
	   window.location.href="qna_multidelete.do?qna_id="+sum;
	}

	<!--
	function hide(){
	   var el = document.querySelectorAll('#multi');
	   for (var i =0 ; i<el.length; i++){
	      if(el[i].style.display !='table-cell' )
	         el[i].style.display = 'table-cell';
	      else 
	         el[i].style.display = 'none';
	   }
	}

	function test(params){
	   var dname = params.innerHTML.split('<td>')[2].split('</td>')[0];
	   document.getElementsByName('keyvalue')[0].value=dname;
	}
	//-->
</script>
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
</style>
<!-- <script type="text/javascript">

function hide(){
   alert("해당 내용이 삭제됩니다.");
}


</script> -->
</head>
<body>
   <table>
      <tr>
         <th>qna_id</th>
         <th>member_id</th>
         <th>qna_title</th>
  		 <th>qna_date</th>
  		 <th><a href="qna_writeform.do"><button>추가</button></a></th>
 		 <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>     
      </tr>
      <c:forEach items="${ list }" var="list">
         <tr>
            <td>${list.qna_id}</td>
            <td>${list.member_id}</td>
            <td><a href="qna_detail.do?qna_id=${ list.qna_id }" style="text-decoration: none;">${list.qna_title}</a></td>
            <c:if test="${list.qna_modifydate == null}">
            <td>${list.qna_writedate}</td>
            </c:if>
            <c:if test="${list.qna_modifydate != null}">
            <td>${list.qna_modifydate}</td>
            </c:if> 
            <td><a href="qna_updateform.do?qna_id=${ list.qna_id }"><button id="edit">수 정</button> </a></td>
            <td><a href="qna_delete.do?qna_id=${ list.qna_id }"><button id="delete">삭제</button></a></td>
             <td id="multi"><input type="checkbox" style="width: 30px;" name="qna_id" value="${ list.qna_id }"></td>
         </tr>
      </c:forEach>

   </table>
         <div>
      <c:if test="${param.page>5}">
      	<c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="qna_list.do?page=${startPage-1}">이전</a>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="qna_search.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
         </c:if>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="qna_list.do?page=${startPage+i}">${startPage+i}</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
          <a class="strong" href="qna_search.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a></li>
         </c:if>
        
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
       	 <c:if test="${flag == 'list' }">
         <a class="strong" href="qna_list.do?page=${startPage+5}">다음</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="strong" href="qna_search.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a></li>
         </c:if>
         
      </c:if>
   </div>
      	<form action="qna_search.do" method="post">
		<select name="column">
			<option value="qna_id">아이디</option>
			<option value="member_id">작성자</option>
			<option value="qna_title">제목</option>
		</select>
		<input type="text" name="keyvalue">
		<input type="submit" value="검색">
	</form>
</body>
</html>