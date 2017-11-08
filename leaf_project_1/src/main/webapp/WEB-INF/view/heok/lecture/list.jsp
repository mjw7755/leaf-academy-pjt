<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LectureList Page</title>
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

/* table tr:HOVER {
	color: white;
	background-color: black;
}

table tr:ACTIVE {
	color: black;
	font-weight: bold;
	background-color: lightyellow;
} */

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
	var message = '${message}';
	if (message)
		alert(message);

	function listChange(params) {
		var url = "list_"+params.value+".do";
		window.location.href = url;
	}

	function multiDelete() {
		var t = document.getElementsByName("lect_id");
		var sum = new Array();
		var j = 0;
		for (var i = 0; i < t.length; i++) {
			if (t[i].checked) {
				sum[j] = t[i].value;
				j = j + 1;
				alert(t[i].value);
			}
		}
		alert("test.do?lect_id=" + sum);
		window.location.href = "multiDelete_lect.do?lect_id=" + sum;
	}
	
	function hide() {
		alert("해당내용 삭제됨")
	}
	function multiDelete() {

		var t = document.getElementsBtName("lect_id");
		var sum = new Array();
		var j = 0;
		for (var i = 0; i < t.length; i++) {
			if (t[i].checked) {
				sum[j] = t[i].value;
				j = j + 1;
			}
		}
		window.location.href = "multidelete_lect.do?lect_id=" + sum;
	}

	function test(params) {
		var dname = params.innerHTML.split('<td>')[2].split('</td>')[0];
		document.getElementsByName('keyvalue')[0].value = dname;
	}
</script>

<body>
	
	<!-- <table>
		<tr>
			<td><input type="button" value="1월"></td><td><input type="button" value="2월"></td><td><input type="button" value="3월"></td>
			<td><input type="button" value="4월"></td><td><input type="button" value="5월"></td><td><input type="button" value="6월"></td>
		</tr>
		<tr>
			<td><input type="button" value="7월"></td><td><input type="button" value="8월"></td><td><input type="button" value="9월"></td>
			<td><input type="button" value="10월"></td><td><input type="button" value="11월"></td><td><input type="button" value="12월"></td>
		</tr>
	</table> -->
	
	<h3>
	

	
	<datalist id="lectlist">
		<c:forEach items="${ list }" var="item">
			<option value=" ${ item.lect_id }"> $ ${ item.lect_name } | ${ item.lect_person_num }</option>
		</c:forEach>

	</datalist>
	<hr>
	<div>
		<fieldset>
			<legend>
				<select	style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;"
					onchange="listChange(this);">
					<option value="lectutre" selected="selected"> Lecture </option>
					<option value="curri" >Curriculum </option>

				</select> <a href="writeform_lect.do"><button>추가하기</button></a>&nbsp;&nbsp;&nbsp;
				<a href="delete_lect.do" id="multi" onclick="multiDelete"><button>다중삭제</button></a>
			</legend>

			<table cellpadding="5" style="text-align: center;">
				<tr>
					<th colspan="2"><b>날짜</b></th>
					<!-- <th><b>강좌명</b></th> -->
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>
					<th colspan="2"><b>수강시간</b></th>
				<!-- 	<th colspan ="2"><a href="#"><button id = "multi" onclick="multiDelete()">다중삭제</button></a></th> -->
					<th><b>허용여부</b></th>
					<th><b>삭제여부</b></th>
				</tr>
				<c:forEach items="${list }" var="list" varStatus="status">
					<tr onclick="test(this)">
						<td colspan="2">${list.lect_start_day} ~ ${list.lect_end_day }</td>

						<%-- <td>${list.lect_id}</td> --%>
						<td>${list.lect_name}</td>
						
						<td>${list.lect_person_num}</td>
						<td colspan="2">${list.lect_start_time}~ ${list.lect_end_time }</td>
						<td>${list.lect_accept}</td>
						<td>${list.enabled}</td>
						<td><a href="delete_lect.do?lect_id=${list.lect_id}">
							<button	id="delete">삭제</button></a>
						</td>
						<td><a href="updateForm_lect.do?lect_id=${list.lect_id}">
							<button	id="update">수정</button></a>
						</td>
						<td id="multi">
							<input type="checkbox" style="width: 30px;"
							name="lect_id" value="${list.lect_id}">
						</td>
					</tr>
				</c:forEach>

			</table>

     <div>
      <c:if test="${param.page>5}">
         <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="list_lect.do?page=${startPage-1}">이전</a>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="search_lect.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
         </c:if>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="list_lect.do?page=${startPage+i}">${startPage+i}</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
          <a class="strong" href="search_lect.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a></li>
         </c:if>
        
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
           <c:if test="${flag == 'list' }">
         <a class="strong" href="list_lect.do?page=${startPage+5}">다음</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="strong" href="search_lect.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a></li>
         </c:if>
         
      </c:if>
   </div>



		</fieldset>
	</div>
	
		<form action="search_lect.do" method="post">
			<select name="column">	
				<option value="lect_name">클래스명</option>
      		    <option value="lect_start_day">시작일</option>
         		<option value="lect_person_num">수강생수</option>
			</select>		
				<input size="30" type="text" id="keyvalue" name="keyvalue"
					placeholder="키워드 검색 가능합니다." > 
				<input type="submit" id="searchbtn" value="검색">&nbsp;
				
		</form>
	
	
	

</body>
</html>





