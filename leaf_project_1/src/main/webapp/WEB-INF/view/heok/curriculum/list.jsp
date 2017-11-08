<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>curriculumList Page</title>
</head>

<style type="text/css">
table {
	width: 100%;
	text-align: center;
	font-size: 20px;
}

table th {
	background-color: black;
	color: white;
}

table tr:nth-child(even) {
	background-color: white;
}
/* 
table tr:HOVER {
	color: white;
	background-color: black;
}

table tr:ACTIVE {
	color: black;
	font-weight: bold;
	background-color: lightyellow;
}
 */
#delete {
	background-color: white;
	color: black;
}

#edit {
	background-color: #87cefa;
	color: blue;
}

button {
	font-size: 20px;
	font-weight: bold;
	width: 100px;
	height: 90%;
}

#multi {
	/* visibility: hidden; */
	display: none;
}
</style>

<script type="text/javascript">

	function listChange(params) {
		var url = "list_"+params.value+".do";
		window.location.href = url;
	}
</script>
<body>
	<hr>
	<div>
		<fieldset>
			<legend>
				<select style="width :350px; height:50px; font-size:30px; font-weight:bold;"
				 onchange="listChange(this);">
					<option value="curriculum" selected="selected"> Curriculum </option>
					<option value="lect" >Lecture </option>
				</select>
				<a href="writeform_curri.do" method="post"><button>추가하기</button></a>&nbsp;&nbsp;&nbsp;
			</legend>
			
			<table cellpadding="5" style="text-align: center;">
				<th><b>강좌명</b></th>
				<th><b>강좌레벨</b></th>
				<th><b>강사</b></th>
				<th><b>허용여부</b></th>
				<th><b>삭제여부</b></th>
				
				<th id = "multi"><b></b></th>
				
				<c:forEach items="${list }" var="list" varStatus="status" >
					<tr onclick="test(this)">
						<td><a href="detail_curri.do?curri_id=${list.curri_id}">${list.curri_subject}</a></td>
						<td>${list.curri_level}</td>
						<td>${list.member_id}</td>
						<td>${list.curri_accept}</td>
						<td>${list.enabled}</td>
						
						<td><a href="delete_curri.do?curri_id=${list.curri_id}"><button id="delete">삭제</button></a></td>
						<td><a href="updateForm_curri.do?curri_id=${list.curri_id}"><button id="update">수정</button></a></td>
					</tr>
				</c:forEach>
				
			</table>
			
		</fieldset>
	</div>
	
	<div>
      <c:if test="${param.page>5}">
         <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="list_curri.do?page=${startPage-1}">이전</a>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="search_curri.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
         </c:if>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="list_curri.do?page=${startPage+i}">${startPage+i}</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
          <a class="strong" href="search_curri.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a></li>
         </c:if>
        
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
           <c:if test="${flag == 'list' }">
         <a class="strong" href="list_curri.do?page=${startPage+5}">다음</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="strong" href="search_curri.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a></li>
         </c:if>
         
      </c:if>
   </div>
	
		<form action="search_curri.do" method="post">
			<select name="column">	
				<option value="curri_subject">강좌명</option>
      		    <option value="curri_level">강좌레벨</option>
			</select>		
				<input size="30" type="text" id="keyvalue" name="keyvalue"
					placeholder="키워드 검색 가능합니다." > 
				<input type="submit" id="searchbtn" value="검색">&nbsp;
				
		</form>
</body>
</html>





