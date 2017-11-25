<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LectureList Page</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#lecture_open{
	width:800px;
}
#lecture_open a{
	text-decoration: none;
	color:#000;
}
#lecture_open hr{
	border: thin solid;
	border-color: #cccccc;
}
#lecture_table th{
	border-bottom: 1px solid #cccccc;
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: #f4f3f1;
}
#lecture_table td{
	border-bottom: 1px solid #cccccc;
    height: 50px;
    font-size: 13px;
    font-weight: bold;
}
#lecture_table{
	border-collapse: collapse;
	margin-top: 50px;
	width: 800px;
}
/*  */
.btn-info {
	color: #fff;
	background-color: #f16022;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #b64413;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #b64413;
	border-color: #973911;
}
.btn2 {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;	
}
/*  */
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
   /*  text-shadow: 0 1px 1px #c4c4c4; */
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
font-size: 0.6em; }
/*  */
#page {
	margin-top: 10px;
}
#page a{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #13b69d;
    margin-right: 5px;
}
/*  */
#search{
	text-align: right;
	margin-bottom: 30px;
	margin-top: 30px;
}
#search form{
	font-size: 13px;
}

#search form input{
	font-size: 13px;
}
#search form select{
	height: 22px;
}
#search_icon{
	vertical-align: middle;
}

</style>
</head>
<script type="text/javascript">
	function listChange(params) {
		var url = "list_" + params.value + ".do";
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
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_curri.png">
   		</div>
   	</div>
    <!-- top banner end -->
<div id="lecture_open">

 <input type="hidden" name="lect_id" value="${dto.lect_id }">

	<datalist id="lectlist">
		<c:forEach items="${ list }" var="item">
			<option value=" ${ item.lect_id }">$ ${ item.lect_name } |
				${ item.lect_person_num }</option>
		</c:forEach>
	</datalist>
	<div>
		<a href="list_lect.do"><h1>개설강좌</h1></a>
		<hr>
		<div id="search">
		<form action="search_lect.do" method="post">
		<select name="column">
			<option value="lect_name">클래스명</option>
			<option value="lect_start_day">시작일</option>
			<option value="lect_person_num">수강인원</option>
		</select> <input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> 
			<input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
		</form>
		</div>
			<a href="writeform_lect.do"><button class="btn btn--sm btn--green">추가하기</button></a>&nbsp;&nbsp;&nbsp;
				<a href="delete_lect.do" id="multi" onclick="multiDelete"><button class="btn btn--sm btn--green">다중삭제</button></a>

		<table cellpadding="5" style="text-align: center;" id="lecture_table">
			<tr>
				<th>날짜</th>
				<th>강좌명</th>
				<th>클래스명</th>
				<th>수강인원</th>
				<th>강사명</th>
				<th>레벨</th>
				<th>수강료</th>
				<th>수강시간</th>
				<c:if test="${ sessionScope.sessionid == '해피도연' ||'관리자1' }">
					<th>삭제여부</th>
					<th>수정여부</th>
				</c:if>
			</tr>
			<c:forEach items="${list }" var="list" varStatus="status">
				<tr onclick="test(this)">
					<td>${list.lect_start_day}~ ${list.lect_end_day }</td>
					<td>${list.curri_subject}</td>
					<td>${list.lect_name}</td>
					<td>${list.lect_person_num}</td>
					<td>${list.member_id }</td>
					<td>${list.curri_level }</td>
					<td>${list.lect_charge }</td>
					<td>${list.lect_start_time} <br>~${list.lect_end_time }</td>
					<c:if test="${ sessionScope.sessionid == '해피도연' ||'관리자1' }">
						<td><a href="delete_lect.do?lect_id=${list.lect_id}">
								<button id="delete" class="btn2 btn-info">삭제</button>	</a>
						</td>
						<td><a href="updateForm_lect.do?lect_id=${list.lect_id}">
								<button id="update" class="btn2 btn-info">수정</button>	</a>
						</td>
						<td id="multi">
							<input type="checkbox" style="width: 30px;" name="lect_id" value="${list.lect_id}">
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>

		<div id="page">
			<c:if test="${param.page>5}">
				<c:if test="${flag == 'list'}">
					<a class="button btn-prev" href="list_lect.do?page=${startPage-1}">이전</a>
				</c:if>
				<c:if test="${flag == 'search'}">
					<a class="button btn-prev" href="search_lect.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
				</c:if>
			</c:if>
			<c:forEach var="i" begin="0" end="4" varStatus="status">
				<c:if test="${countPage>=startPage+i}">
					<c:if test="${flag == 'list'}">
						<a class="strong" href="list_lect.do?page=${startPage+i}">${startPage+i}</a>
					</c:if>
					<c:if test="${flag == 'search'}">
						<a class="strong" href="search_lect.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${countPage>=startPage+5}">
				<c:if test="${flag == 'list'}">
					<a class="strong" href="list_lect.do?page=${startPage+5}">다음</a>
				</c:if>
				<c:if test="${flag == 'search'}">
					<a class="strong" href="search_lect.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a>
				</c:if>
			</c:if>
		</div>

	</div>
	
</div>
</body>
</html>