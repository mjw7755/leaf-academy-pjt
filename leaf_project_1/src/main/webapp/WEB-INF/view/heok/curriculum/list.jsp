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
	background-color: lightgray;
}

table tr:HOVER {
	color: white;
	background-color: black;
}

table tr:ACTIVE {
	color: black;
	font-weight: bold;
	background-color: lightyellow;
}

#delete {
	background-color: pink;
	color: red;
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
		var url = params.value + "_list.do";
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
				
				<th id = "multi"><b></b></th>
				
				<c:forEach items="${list }" var="list" varStatus="status" >
					<tr onclick="test(this)">
						<td><a href="detail_curri.do?curri_id=${list.curri_id}">${list.curri_subject}</a></td>
						<td>${list.curri_level}</td>
						
						<td><a href="delete_curri.do?curri_id=${list.curri_id}"><button id="delete">삭제</button></a></td>
						<td><a href="updateForm_curri.do?curri_id=${list.curri_id}"><button id="update">수정</button></a></td>
					</tr>
				</c:forEach>
				
			</table>
			
		</fieldset>
	</div>
	<div>
      <c:if test="${param.page>5}">
         <a class="button btn-prev" href="curri_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
         <a class="strong" href="curri_list.do?page=${startPage+i}">${startPage+i}</a></li>
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
         <a class="strong" href="curri_list.do?page=${startPage+5}">다음</a></li>
      </c:if>
   </div>
	
</body>
</html>





