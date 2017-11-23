<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#my_class{
	margin-top: 35px;
}
#tnoticeDIV {
	height: 320px;
	width: 550px;
	border: 1px solid;
	float:left;
}
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
</head>
<body>
<c:if test="${myclass == 1 }">
	<div id="my_class_student">
		<table id="menu">
			<tr id="my_page_text">
				<td colspan="2">MY CLASS</td>
			</tr>
			<tr>
				<td id="lecture"><a href="#">강의듣기</a>
				<div id="lecture_icon">></div></td>
			</tr>
			<tr>
				<td id="grade"><a href="#">성적조회</a>
				<div id="grade_icon">></div></td>
			</tr>
			<tr>
				<td id="attendance"><a href="getChkAttend.do">출결현황</a>
				<div id="attendance_icon">></div></td>
			</tr>
			<tr>
				<td id="t_notice"><a href="tnotice_list.do">강사공지</a>
				<div id="t_notice_icon">></div></td>
			</tr>
		</table>
		</div>
</c:if>
		
<c:if test="${myclass >= 2 }">
		<div id="my_class_teacher">
			<table id="menu">
				<tr id="my_page_text">
					<td colspan="2">MY CLASS</td>
				</tr>
				<tr>
					<td id="lecture"><a href="#">강의하기</a>
					<div id="lecture_icon">></div></td>
				</tr>
				<tr>
					<td id="grade"><a href="#">성적조회</a>
					<div id="grade_icon">></div></td>
				</tr>
				<tr>
					<td id="attendance"><a href="getChkAttend.do">출결현황</a>
					<div id="attendance_icon">></div></td>
				</tr>
				<tr>
					<td id="t_notice"><a href="tnotice_list.do">강사공지</a>
					<div id="t_notice_icon">></div></td>
				</tr>
				<tr>
					<td id="student_care"><a href="#">학생조회</a>
					<div id="student_care_icon">></div></td>
				</tr>
			</table>
		</div>
</c:if>

<c:if test="${mypage == 'OK' }">
	<div id="my_page">
		 <table id="menu">
	      <tr id="my_page_text"><td colspan="2">MY PAGE</td></tr>
	      <tr><td id="attendance"><a href="#">개인정보</a><div id="attendance_icon">></div></td></tr>
		  <tr><td id="lecture"><a href="#">내역조회</a><div id="lecture_icon">></div></td></tr>
		  <tr><td id="grade"><a href="#">탈퇴</a><div id="grade_icon">></div></td></tr>
		  <c:if test="${sessionScope.sessionid=='관리자'}">
	      <tr><td id="student_care"><a href="member_list.do" >회원관리</a><div id="student_care_icon">></div></td></tr>
	      </c:if>
	   </table>
   </div>
</c:if>
</body>
</html>