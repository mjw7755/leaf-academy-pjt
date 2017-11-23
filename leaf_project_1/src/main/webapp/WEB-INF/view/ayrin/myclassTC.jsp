<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/ayrin/needpopup.min.css">
<script src="js/ayrin/needpopup.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myclassTC</title>
<style type="text/css">
#my_class{
	margin-top: 35px;
}
#tnotice {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
/* #chulcheck {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
#grade_check {
	height: 300px;
	width: 100%;
	border: 1px solid;
} */
/* table */
#menu {
   width: 200px;
   margin-left: 25%;
   float: left;
}
#menu tr {
   width: 150px;
}
#menu a {
   text-decoration: none;
   font-size: 13px;
   color: #5e5f5e;
}
/* mypage text */
#my_page_text {
   width: 100%;
   height: 150px;
   background-color: #1b7817;
   color: #fff;
   font-size: 25px;
   font-weight: bold;
   text-align: center;
}
/* 메뉴하위내용 */
#attendance, #grade, #lecture, #t_notice, #student_care {
   text-align: left;
   /* padding: 10px 0px 10px 10px; */
   padding-bottom: 10px;
   padding-left: 10px;
   padding-top: 10px;
   border-bottom: 1px solid;
   font-weight: 700;
   color: #949694;
}
#attendance :hover, #grade :hover, #lecture :hover, #t_notice :hover, #student_care :hover {
   color: #1b7817;
   font-weight: 900;
   height: 38px;
}
#attendance_icon, #grade_icon, #lecture_icon, #t_notice_icon, #student_care_icon {
   color: #1b7817;
   font-weight: bold;
   float: right;
   height: 100%;
}
.needpopup {
  border-radius: 6px;
  box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
}
.needpopup p {
	margin: 0;
}
.needpopup p + p {
	margin-top: 10px;
}
			
</style>

<style type="text/css">
#tnoticelistTable {
   width: 800px;
   text-align: center;
}
#tnoticelistTable td{
   border: 1px solid;
   height: 30px;
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


<script>
$(function() {
	$("#lecture_icon").hide();
	$("#grade_icon").hide();
	$("#attendance_icon").hide();
	$("#t_notice_icon").hide();
	$("#student_care_icon").hide();
	
	$("#lecture").hover(function() {
	   $("#lecture_icon").show()
	}, function() {
	   $("#lecture_icon").hide();
	});
	$("#grade").hover(function() {
	   $("#grade_icon").show()
	}, function() {
	   $("#grade_icon").hide();
	});
	$("#attendance").hover(function() {
	   $("#attendance_icon").show()
	}, function() {
	   $("#attendance_icon").hide();
	});
	$("#t_notice").hover(function() {
	   $("#t_notice_icon").show()
	}, function() {
	   $("#t_notice_icon").hide();
	});
	$("#student_care").hover(function() {
	   $("#student_care_icon").show()
	}, function() {
	   $("#student_care_icon").hide();
	});
	
	/* $("#lecture").click(function() {
		alert("연결해야함");
	});
	$("#grade").click(function() {
		alert("연결해야함");
	});
	$("#attendance").click(function() {
		alert("연결해야함");
	});
	$("#t_notice").click(function() {
		alert("람아~ 꾸며죠~");
		$("#tnoticeList").show();
		$("#tnoticeList").show();		
	});
 	$("#studentcare").click(function() {
		alert("연결해야함");
	}); */
});
</script>
</head>
<body>
 <div id="tnoticeList">
	<select>
		<c:forEach items="${history}" var="history">
		<c:if test="${history.payment_pay_chk eq 1}">
		<c:if test="${sessionScope.sessionid == history.payment_teacher_name}">
			<option value="class1">${history.payment_lect_subject }</option>
		</c:if>
		</c:if>
		</c:forEach>
	</select>
	<button >쪽지</button>
	<button onclick="window.location.href='listening.do'">강의하기</button><br>
	
	<form action="tnotice_search.do" method="post">
         검색어 입력 : <input size="30" type="search"  name="keyvalue" placeholder="키워드 검색 가능합니다." list="tnoticelist"> 
             <button type="submit" class="btn btn--sm btn--green">검색</button>
    </form>
   
	<datalist>
		<c:forEach items="${ list }" var="list">
			<option value="${ list.tnotice_title }"> ${ list.tnotice_title } </option>
		</c:forEach>
	</datalist>
	<br><hr><br>
   <table id="tnoticelistTable">
      <tr>
         <th>글번호</th>
         <th>제목</th>
         <th colspan="2"><a href="tnotice_writeform.do"><button class="btn btn--sm btn--green">추가</button></a></th>
      </tr>
      <c:forEach items="${ list }" var="list" varStatus="status">
         <tr>
            <td>${list.tnotice_id}</td>
            <td>
            	<a href="tnotice_detail.do?tnotice_id=${ list.tnotice_id }">${list.tnotice_title }</a>
            </td>
	            <td><a href="tnotice_updateform.do?tnotice_id=${ list.tnotice_id }">
	            <button id="edit" class="btn btn--sm btn--green">수정</button> </a></td>
	            <td><a href="tnotice_delete.do?tnotice_id=${ list.tnotice_id }"><button id="delete" class="btn btn--sm btn--green">삭제</button> </a></td>
         </tr>
      </c:forEach>
   </table>
   <br><br>
   <div align="center">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list'}">
         <a class="button btn-prev" href="tnotice_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="button btn-prev" href="tnotice_search.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+i}">${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
</div>	
	
<!-- 	<div id="detail"></div>
	
	<div id="write"></div>
	
	<div id="update"></div> -->
	
	
	
<%-- 	<div style="width:1000px; margin:0 auto;">
		<table>
			<tr>
				<td>
					<div id="notice">
						<table>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><a onclick="detail(event)" data-needpopup-show="#noticeDetail" name="content_${list.notice_id}">${list.notice_title}</a></td>
								<td><input id="content_${list.notice_id}" type="hidden" value="${list.notice_content}"/></td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</td>
				<td>
					<div id="chulcheck">평균, 우수학생 1~3랭킹</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="student_list">학생List 및 체크박스 쪽지보내기</div>
				</td>
			</tr>		
		</table>
	</div> --%>
	<!-- <div id="noticeDetail" class="needpopup"></div> -->
</body>
</html>