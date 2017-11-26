<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>curriculumList Page</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
	#curri{
		width:800px;
	}
	#curri a{
		text-decoration: none;
		color:#000;
	}
	#curri hr{
		border: thin solid;
		border-color: #cccccc;
	}

	/* button */
.btn-info {
	color: #fff;
	background-color: #f16022;
	border-color: #f16022;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #b64413;
	border-color: #f16022;
}
.btn-info:hover {
	color: #fff;
	background-color: #b64413;
	border-color: #f16022;
}
.btn2 {
	display: inline-block;
    padding: 20px 25px;
    margin-bottom: 12px;
    margin-top: 12px;
    margin-left: 5px;
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
    /* border-radius: 4px; */
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
/*  */
#monthBtn{
	width: 700px;
    margin-bottom: 20px;
}
.content {
	width: 700px;
}
.content span{
	width: 100%;
    text-align: left;
    float: left;
    margin-left: 10px;
    margin-bottom: 20px;
    font-size: 15px;
    font-weight: bold;
    
}
.bar{
	width:30px;
	height: 2px;
	background-color: #000;
	margin-bottom: 20px;
	margin-left: 10px;
    text-align: left;
    float: left;
}
#content_table thead tr th, #search_table thead tr th{
    width: 100px;
    /* border-top: 1px solid; */
    border-bottom: 1px solid #cccccc;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #f4f3f1;
}
#content_table tbody td, #search_table tbody td{
	border-bottom: 1px solid #cccccc;
	height: 50px;
	width: 50px;
}
#content_table{
	margin-bottom: 20px;
	border-collapse: collapse;
	width:700px;
}
#search_table{
	margin-bottom: 20px;
	border-collapse: collapse;
	width:800px;
}
#search_table th{
	width:100px;
	border-top:1px solid;
	border-bottom: 1px solid;
	border-color:#dddede;
	padding-top: 15px;
	padding-bottom: 15px;
	background-color: #9fd2b9;
}
#search_table a, #content_table a{
	text-decoration: none;
	color:#21307a;
	font-weight: bold;
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
#searchdiv{
	margin-top: 15px;
}
</style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function text(e) {
		alert(e.target.id);
	}
	function listChange(params) {
		var url = "list_" + params.value + ".do";
		window.location.href = url;
	}
		
	$(function() {
		$(".content").hide();
		var flag = [ false, false, false, false, false, false, false, false,
				false, false, false, false ];

		$(".btn2").click(
				function() {
					var monthvalue = this.id;
					var yearvalue = this.name;
					
					flag[monthvalue - 1] = !flag[monthvalue - 1];
					if (flag[monthvalue - 1]) {

						$.ajax({
							url : "monthlist_curri.do",
							data : {
								"monthvalue" : monthvalue,
								"yearvalue" : yearvalue
							},
							type : "post",

							success : function(data) {
								var res = eval("(" + data + ")");
								var resData = res.result;
								for (var i = 0; i < resData.length; i++) {
									$("#ajaxDataBody" + monthvalue).append(
											"<tr id=\"tr"+monthvalue+"\"><td >"
													+ resData[i][1].value
													+ "</a></td><td>"+"<a href ='detail_curri.do?curri_id="+resData[i][0].value+"''>"
													+ resData[i][2].value
													+ "</a></td><td>"
													+ resData[i][3].value
													+ "</td><td>"
													+ resData[i][4].value
													+ "</td><td>"
													+ resData[i][5].value
													+ "</td><td>"
													+ resData[i][6].value
													+ "</td></tr>");
								}
								$("#content" + monthvalue).show();
							},
							error : function(data) {
								
							}
						});
					} else {
						$("#content" + monthvalue).hide();
						$("#tr"+monthvalue).remove();
					}
				});
	});
</script>
<body>
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_curri.png">
   		</div>
   	</div>
    <!-- top banner end -->
    <div id="curri">
    <a href="list_curri.do"><h1>월별 강의 커리큘럼 안내</h1></a>
	<hr>
    </div>
<div id="monthBtn">	
	<input type="button" id="01" name="2017" class="btn2 btn-info"
		value="2017.01" />
	<input type="button" id="02" name="2017" class="btn2 btn-info"
		value="2017.02" />
	<input type="button" id="03" name="2017" class="btn2 btn-info"
		value="2017.03" />
	<input type="button" id="04" name="2017" class="btn2 btn-info"
		value="2017.04" />
	<input type="button" id="05" name="2017" class="btn2 btn-info"
		value="2017.05" />
	<input type="button" id="06" name="2017" class="btn2 btn-info"
		value="2017.06" />
	<input type="button" id="07" name="2017" class="btn2 btn-info"
		value="2017.07" />
	<input type="button" id="08" name="2017" class="btn2 btn-info"
		value="2017.08" />
	<input type="button" id="09" name="2017" class="btn2 btn-info"
		value="2017.09" />
	<input type="button" id="10" name="2017" class="btn2 btn-info"
		value="2017.10" />
	<input type="button" id="11" name="2017" class="btn2 btn-info"
		value="2017.11" />
	<input type="button" id="12" name="2017" class="btn2 btn-info"
		value="2017.12" />		
	</div>

	<div id="content01" class="content">
		<div class="bar"></div>
		<span>2017년 1월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody01">
				</tbody>
			</table>
	</div>

	<div id="content02" class="content">
	<div class="bar"></div>
		<span>2017년 2월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody02">
				</tbody>
			</table>
	</div>
	
	<div id="content03" class="content">
	<div class="bar"></div>
		<span>2017년 3월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody03">
				</tbody>
			</table>
	</div>

	<div id="content04" class="content">
	<div class="bar"></div>
		<span>2017년 4월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody04">
				</tbody>
			</table>
	</div>

	<div id="content05" class="content">
	<div class="bar"></div>
		<span>2017년 5월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody05">
				</tbody>
			</table>
	</div>

	<div id="content06" class="content">
	<div class="bar"></div>
		<span>2017년 6월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody06">
				</tbody>
			</table>
	</div>
	
	<div id="content07" class="content">
	<div class="bar"></div>
		<span>2017년 7월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody07">
				</tbody>
			</table>
	</div>

	<div id="content08" class="content">
	<div class="bar"></div>
		<span>2017년 8월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody08">
				</tbody>
			</table>
	</div>

	<div id="content09" class="content">
	<div class="bar"></div>
		<span>2017년 9월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody09">
				</tbody>
			</table>
	</div>

	<div id="content10" class="content">
	<div class="bar"></div>
		<span >2017년 10월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody10">
				</tbody>
			</table>
	</div>

	<div id="content11" class="content">
	<div class="bar"></div>
		<span >2017년 11월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody11">
				</tbody>
			</table>
	</div>

	<div id="content12" class="content">
	<div class="bar"></div>
		<span>2017년 12월</span>
			<table style="text-align: center;" id="content_table">
				<thead>
					<th>개강일</th>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th>클래스명</th>
					<th>수강인원</th>
				</thead>
				<tbody id="ajaxDataBody12">
				</tbody>
			</table>
	</div>
	
</div>	

	<c:if test="${memberLevel==2}">
	<a href="writeform_curri.do" method="post"><button  class="btn btn--sm btn--green">추가하기</button></a>
</c:if><br>
	<div id="searchdiv" name="searchdiv" class="searchdiv">
	
		<span style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">커리큘럼 검색</span>
			<table cellpadding="5" style="text-align: center;" id="search_table">
			<tr><td colspan="3">
				<div id="search" name="searchdiv1" class="searchdiv1">
					<form action="search_curri.do" method="post">
						<select name="column">
							<option value="curri_subject">강좌명</option>
							<option value="curri_level">강좌레벨</option>
							<option value="member_id">강사명</option>
						</select> <input size="30" type="text" id="keyvalue" name="keyvalue"
							placeholder="키워드 검색 가능합니다."> 
							<input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
					</form>	
				</div>
			</td></tr>
					<th>강좌명</th>
					<th>강사</th>
					<th>강좌레벨</th>
					<th colspan="2"></th>
				<c:forEach items="${list }" var="list" varStatus="status" >
					<tr>
						<td><a href="detail_curri.do?curri_id=${list.curri_id}">${list.curri_subject}</a></td>
						<td>${list.member_id}</td>
						<td>${list.curri_level}</td>
						
						<c:if test="${memberLevel==2 and list.member_id==sessionScope.sessionid}">
							<td><a href="delete_curri.do?curri_id=${list.curri_id}"><button id="delete" class="btn btn--sm btn--green">삭제</button></a></td>
							<td><a href="updateForm_curri.do?curri_id=${list.curri_id}"><button id="update" class="btn btn--sm btn--green">수정</button></a></td>
						</c:if>
					</tr>
				</c:forEach>				
			</table>
				 
		<div id="page">
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
		         <a class="strong" href="list_curri.do?page=${startPage+i}">${startPage+i}</a>
		         </c:if>
		         <c:if test="${flag == 'search' }">
		         <a class="strong" href="search_curri.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a>
		         </c:if>        
		      </c:if>
	   	  </c:forEach>
	      	<c:if test="${countPage>=startPage+5}">
	         <c:if test="${flag == 'list' }">
	         <a class="strong" href="list_curri.do?page=${startPage+5}">다음</a>
	         </c:if>
	         <c:if test="${flag == 'search' }">
	         <a class="strong" href="search_curri.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a>
	         </c:if>         
	        </c:if>
		</div>
	</div>
	<div id="curri">
</body>
</html>