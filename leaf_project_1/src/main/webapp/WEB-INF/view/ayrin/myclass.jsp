<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myclass</title>
<style type="text/css">
#notice {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
#chulcheck {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
#grade {
	height: 300px;
	width: 100%;
	border: 1px solid;
}
</style>
</head>
<body>
<!-- member_level 학생일때 -->
<c:if test="${sessionScope.sessionid!='관리자' and sessionScope.sessionid!='강사1'}">
	<select>
		<option value="class1" selected="selected">JAVA 기초 (상)</option>
		<option value="class2">JAVA 기초 (중)</option>
		<option value="class3">JAVA 기초 (하)</option>
	</select>
	<button onclick="#">쪽지</button>
	<button onclick="listening.do">강의 듣기</button><br>
	
	<div style="width:1000px; margin:0 auto;">
		<table>
			<tr>
				<td>
					<div id="notice">공지사항 게시판</div>
				</td>
				<td>
					<div id="chulcheck">출결 현황 (달력으로?)</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="grade">성적 현황</div>
				</td>
			</tr>		
		</table>
	</div>
</c:if>	

<!-- member_level 강사일때 -->
<c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
	<select>
		<option value="class1" selected="selected">JAVA 기초 (상)</option>
		<option value="class2">JAVA 기초 (중)</option>
		<option value="class3">JAVA 기초 (하)</option>
	</select>
	<button onclick="#">쪽지</button>
	<button onclick="#">강의 듣기</button><br>
	
	<div style="width:1000px; margin:0 auto;">
		<table>
			<tr>
				<td>
					<div id="notice">공지사항 게시판</div>
				</td>
				<td>
					<div id="chulcheck">평균, 우수학생 1~3랭킹</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="grade">학생List 및 체크박스 쪽지보내기</div>
				</td>
			</tr>		
		</table>
	</div>
</c:if>	
</body>
</html>