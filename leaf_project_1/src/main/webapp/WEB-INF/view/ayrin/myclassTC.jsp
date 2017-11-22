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
<script>
$(function() {
	$("#lecture_icon").hide();
	$("#grade_icon").hide();
	$("#attendance_icon").hide();
	$("#t_notice_icon").hide();
	$("#student_care_icon").hide();
	
	$("#tnoticeList").hide();
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
	
	$("#lecture").click(function() {
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
	});
	$("#studentcare").click(function() {
/* 		$("#student_list").hide();
		$("#member_history").hide(); */
		$("#student_list").show();
	});
});
</script>
</head>
<body>
<div id="my_class">
<table id="menu">
      <tr id="my_page_text"><td colspan="2">MY CLASS</td></tr>
      <tr><td id="lecture"><a href="#">강의하기</a><div id="lecture_icon">></div></td></tr>
	  <tr><td id="grade"><a href="#">성적조회</a><div id="grade_icon">></div></td></tr>
	  <tr><td id="attendance"><a href="getChkAttend.do">출결현황</a><div id="attendance_icon">></div></td></tr>
	  <tr><td id="t_notice"><a href="tnotice_list.do">강사공지</a><div id="t_notice_icon">></div></td></tr>
      <tr><td id="student_care"><a href="#" >학생조회</a><div id="student_care_icon">></div></td></tr>
</table>
</div>   
	<!-- <select>
		<option value="class1" selected="selected">JAVA 기초 (상)</option>
		<option value="class2">JAVA 기초 (중)</option>
		<option value="class3">JAVA 기초 (하)</option>
	</select>
	<button >쪽지</button>
	<button onclick="window.location.href='listening.do'">강의하기</button><br> -->
	
	<div id="tnoticeList">asdf</div>

	
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