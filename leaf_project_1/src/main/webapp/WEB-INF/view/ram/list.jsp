<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	   var t= document.getElementsByName("teacher_id");
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
	   window.location.href="multidelete.co?teacher_id="+sum;
	}

</script>

</head>
<body>
		<form action="search.co" method="post">
			검색어 입력 : <input size="30" type="search"  name="keyvalue" 
					 placeholder="강사이름명 검색" list="list"> 
					 <input type="submit" value="검색">&nbsp;
					 <a href="list.co"><button id="delete">초기화</button></a>
		</form>
		
	<datalist  id="list">
	<c:forEach items="${ list }" var="item">
		<option value="${ item.member_id }"> </option>
	</c:forEach>
	</datalist>
   <table>
      <tr>
         <th>teacher_id</th>
         <th>강사 이름</th>
         <th>강사 연혁</th>
         <th><a href="writeform.co"><button>추가</button></a></th>
         <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
      </tr>
      <c:forEach items="${ list }" var="list">
         <tr>
            <td>${list.teacher_id}</td>
            <td><a href="content.co?teacher_id=${ list.teacher_id }">${list.member_id}</a></td>
            <td>${list.teacher_introduce}</td>
            <td><a href="updateform.co?teacher_id=${ list.teacher_id }">
            <button id="edit">수 정</button> </a></td>
            <td><a href="delete.co?teacher_id=${ list.teacher_id }">
            <button id="delete" onclick="hide()">삭 제</button> </a></td>
            <td id="multi"><input type="checkbox" style="width: 30px;" name="teacher_id" value="${ list.teacher_id }"></td>         
         </tr>
      </c:forEach>
   </table>
   
   <div>
      <c:if test="${param.page>5}">
         <a class="button btn-prev" href="list.co?page=${startPage-1}">이전</a>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
         <a class="strong" href="list.co?page=${startPage+i}">${startPage+i}</a></li>
      </c:if>   
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
         <a class="strong" href="list.co?page=${startPage+5}">다음</a></li>
      </c:if>
   </div>
</body>
</html>