<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
   <title>mypage</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script >
   $(function () {
      // Hide all elements which id starts with text.
      $("#attendance_icon").hide(); 
      $("#grade_icon").hide();
      $("#lecture_icon").hide();
      $("#notice_icon").hide();
      $("#student_care_icon").hide();
      
      $("#attendance").hover(function () {
        $("#attendance_icon").show()  
         /* $("[id^=hover_icon]").show(); */
      }, function(){
           $("#attendance_icon").hide(); 
      /*     $("[id^=hover_icon]").hide(); */ 
      });
   
   $("#grade").hover(function () {
        $("#grade_icon").show()  
         /* $("[id^=hover_icon]").show(); */
      }, function(){
           $("#grade_icon").hide(); 
          /* $("[id^=hover_icon]").hide(); */ 
      });
   $("#lecture").hover(function () {
        $("#lecture_icon").show()  
         /* $("[id^=hover_icon]").show(); */
      }, function(){
           $("#lecture_icon").hide(); 
          /* $("[id^=hover_icon]").hide(); */ 
      });
   $("#notice").hover(function () {
        $("#notice_icon").show()  
         /* $("[id^=hover_icon]").show(); */
      }, function(){
           $("#notice_icon").hide(); 
          /* $("[id^=hover_icon]").hide(); */ 
      });
   $("#student_care").hover(function () {
        $("#student_care_icon").show()  
         /* $("[id^=hover_icon]").show(); */
      }, function(){
           $("#student_care_icon").hide(); 
          /* $("[id^=hover_icon]").hide(); */ 
      });
      });
</script>
<style type="text/css">
.my_page {
   width: 100%;
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

/* 출결내용 div */
#attendance_position {
   border: 1px solid;
   width: 600px;
   height: 500px;
   margin-left: 30px;
   float: left;
}

/* myclass text */
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
#attendance,#grade,#lecture,#notice,#student_care {
   text-align: left;
   /* padding: 10px 0px 10px 10px; */
   padding-bottom:10px;
   padding-left:10px;
   padding-top:10px;
   border-bottom: 1px solid;
   font-weight: 700;
   color: #949694;
}

#attendance :hover, #grade :hover, #lecture :hover, #notice :hover, #student_care :hover  {
   color: #1b7817;
   font-weight: 900;
   height: 38px;
}

#attendance_icon,#grade_icon,#lecture_icon,#notice_icon,#student_care_icon {
   color: #1b7817;
   font-weight: bold;
   float:right; 
   height: 100%;
}
</style>   
</head>
<body>

<div class="my_page">
	<table id="menu">
	   <tr id="my_page_text"><td colspan="2">MY PAGE</td></tr>
	   <tr><td id="attendance"><a href="#">개인정보</a><div id="attendance_icon">></div></td></tr>
	   <tr><td id="grade"><a href="#">내역조회</a><div id="grade_icon">></div></td></tr>
	   <!-- <tr><td id="lecture"><a href="#">강의듣기</a><div id="lecture_icon">></div></td></tr>
	   <tr><td id="notice"><a href="#">공지사항</a><div id="notice_icon">></div></td></tr>
	   <tr><td id="student_care"><a href="#">학생관리</a><div id="student_care_icon">></div></td></tr> -->
	</table>
	
	<div id="attendance_position">
		<table>
			<tr>
				<td>ID : </td>
				<td><input readonly="readonly" type="text" name="member_id" value="${dto.member_id}"></td>
			</tr>
			<tr>
				<td>NAME : </td>
				<td><input readonly="readonly" name="member_name" value="${dto.member_name}"></td>
			</tr>
			<tr>
				<td>PWD : </td>
				<td><input type="text" name="member_pwd" value="${dto.member_pwd}"></td>
			</tr>
			<tr>
				<td>TEL : </td>
				<td><input type="text" name="member_tel" value="${dto.member_tel}"></td>
			</tr>
			<tr>
				<td>EMAIL : </td>
				<td><input type="text" name="member_email" value="${dto.member_email}"></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>