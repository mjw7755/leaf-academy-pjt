<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	   var t= document.getElementsByName("review_id");
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
	   window.location.href="review_multidelete.co?review_id="+sum+"&teacher_id=${param.teacher_id}";
	}

</script>
</head>
<body>
수강후기
	<h3>
		<form action="review_search.co" method="post">
			검색어 입력 : <input size="30" type="search"  name="keyvalue" 
					 placeholder="키워드 검색 가능합니다." list="review_list"> 
					 <input type="submit" value="검색">&nbsp;
					 <a href="review_list.co"><button id="delete">초기화</button></a>
		</form>
	</h3>
	<%-- 
	<datalist  id="review_list">
	<c:forEach items="${ list }" var="item">
		<option value="${ item.member_id }"> ${ item.r_headline }</option>
	</c:forEach>
	</datalist> --%>
		<select style="width: 350px; height: 30px; font-size: 15px; font-weight: bold; " onchange="listChange(this);">
			<option value="member_id" selected="selected"> 아이디 </option>
			<option value="r_headline" > 제목 </option>
				</select>
<table>
	<tr>
		<th>제목</th>
		<th>등록자</th>
		<th><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
	</tr>
	<c:forEach items="${ list }" var="list">
	<tr>
		<td><a href="review_content.co?review_id=${ list.review_id }&teacher_id=${list.teacher_id}">${list.r_headline}</a></td>
		<td>${list.member_id }</td>
		<td><a href="review_updateform.co?review_id=${ list.review_id }"">수정</a></td>
		<td><a href="review_delete.co?review_id=${ list.review_id }&teacher_id=${param.teacher_id}">
            <button id="delete" onclick="hide()">삭 제</button> </a></td>
        <td id="multi"><input type="checkbox" style="width: 30px;" name="review_id" value="${ list.review_id }"></td>
	</tr>
	</c:forEach>
</table>
	<a href="review_writeform.co?teacher_id=${ dto.teacher_id }"">글쓰기</a>
 <div>
      <c:if test="${param.page>5}">
         <a class="button btn-prev" href="review_list.co?page=${startPage-1}">이전</a>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
         <a class="strong" href="review_list.co?page=${startPage+i}">${startPage+i}</a></li>
      </c:if>   
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
         <a class="strong" href="review_list.co?page=${startPage+5}">다음</a></li>
      </c:if>
   </div>
</body>
</html>