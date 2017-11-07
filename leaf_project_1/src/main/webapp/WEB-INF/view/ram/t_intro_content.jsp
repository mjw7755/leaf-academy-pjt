<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
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
	teacher_id : ${dto.teacher_id} <br> 
	강사명 : ${dto.member_id} <br> 
	약력 : ${dto.teacher_introduce} <br>
	<input type="button" value="목록보기" onclick="window.location.href='t_intro_list.do' ">
	<a href="t_intro_updateform.do?teacher_id=${dto.teacher_id }">
	<button	id="edit">수 정</button> </a>
	
	<a href="t_intro_delete.do?teacher_id=${ dto.teacher_id }">
	<button id="delete" onclick="hide()">삭 제</button> </a>
	<br>
	<hr>
	<table>
		강사후기
		<a href="review_list.do?teacher_id=${dto.teacher_id }">더보기+</a>
		<c:forEach items="${list}" var="list">
			<ul>
				<li><a href="review_content.do?review_id=${ list.review_id }&teacher_id=${dto.teacher_id}">${list.r_headline}</a></li>
			</ul>
		</c:forEach>
	</table>
</body>
</html>