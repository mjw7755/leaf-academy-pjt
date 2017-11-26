<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#my_class{
	margin-top: 35px;
}
/* #tnoticeDIV {
	height: 320px;
	width: 550px;
	border: 1px solid;
	float:left;
} */
/* table */
#menu {
   width: 200px;
   margin-top:85px;
   margin-left: 15%;
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
/* �޴��������� */
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
<script type="text/javascript">
/* $(function() {
	$("#t_notice").click(function(){
	alert("asd;lkg");
	
	});
}); */
</script>
</head>
<body>
<c:if test="${myclass == 1 }">
	   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
	<div id="my_class_student">
		<table id="menu">
			
			<tr id="my_page_text">
				<td colspan="2">MY CLASS</td>
			</tr>
			<tr>
				<td id="t_notice"><a href="tnotice_list.do">�������</a>
				<div id="t_notice_icon">></div></td>
			</tr>
			<tr>
				<td id="lecture"><a href="listen.do">���ǵ��</a>
				<div id="lecture_icon">></div></td>
			</tr>
			<tr>
				<td id="grade"><a href="#">������ȸ</a>
				<div id="grade_icon">></div></td>
			</tr>
			<tr>
				<td id="attendance"><a href="getChkAttend.do">�����Ȳ</a>
				<div id="attendance_icon">></div></td>
			</tr>

		</table>
		</div>
</c:if>
		
<c:if test="${myclass >= 2 }">
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
		<div id="my_class_teacher">
			<table id="menu">
				<tr id="my_page_text">
					<td colspan="2">MY CLASS</td>
				</tr>
				<tr>
					<td id="t_notice"><a href="tnotice_list.do">�������</a>
					<div id="t_notice_icon">></div></td>
				</tr>
				<tr>
					<td id="lecture"><a href="listen.do">�����ϱ�</a>
					<div id="lecture_icon">></div></td>
				</tr>
				<tr>
					<td id="grade"><a href="#">������ȸ</a>
					<div id="grade_icon">></div></td>
				</tr>
				<tr>
					<td id=student_care><a href="stuMgmtForm.do">�л�����</a>
					<div id="student_care_icon">></div></td>
				</tr>
				<tr>
					<td id="attendance"><a href="list_lect.do">���°���</a>
					<div id="attendance_icon">></div></td>
				</tr>
			</table>
		</div>
</c:if>

<c:if test="${mypage == 'OK1' }">
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
	<div id="my_page">
		 <table id="menu">
	      <tr id="my_page_text"><td colspan="2">MY PAGE</td></tr>
	      <tr><td id="attendance"><a href="#">�������� ����</a><div id="attendance_icon">></div></td></tr>
		  <tr><td id="lecture"><a href="#">�������� ��ȸ</a><div id="lecture_icon">></div></td></tr>
		  <tr><td id="grade"><a href="#">ȸ��Ż��</a><div id="grade_icon">></div></td></tr>
	   </table>
   </div>
</c:if>

<c:if test="${mypage == 'OK2' }">
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
	<div id="my_page">
		 <table id="menu">
	      <tr id="my_page_text"><td colspan="2">MY PAGE</td></tr>
	      <tr><td id="attendance"><a href="#">�������� ����</a><div id="attendance_icon">></div></td></tr>
		  <tr><td id="grade"><a href="#">ȸ��Ż��</a><div id="grade_icon">></div></td></tr>
	   </table>
   </div>
</c:if>
</body>
</html>