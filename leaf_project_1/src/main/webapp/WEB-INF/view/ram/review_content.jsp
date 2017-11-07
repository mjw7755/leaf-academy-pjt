<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript">
   function hide(){
      alert("해당내용이 삭제됩니다");
   }
</script>
</head>
<body>
	teacher_id : ${dto2.teacher_id }
	review_id : ${dto.review_id} <br> 
	회원아이디 : ${dto.member_id} <br> 
	제목 : ${dto.r_headline} <br>
	내용 : ${dto.r_content }
	<input type="button" value="목록보기" onclick="window.location.href='review_list.do?teacher_id=${dto.teacher_id}' ">
	<a href="review_updateform.do?review_id=${dto.review_id }">
	<button	id="edit">수 정</button> </a>
	
	<a href="review_delete.do?review_id=${dto.review_id}&teacher_id=${ dto2.teacher_id }">
	<button id="delete" onclick="hide()">삭 제</button> </a>
	<br>
</body>
</html>