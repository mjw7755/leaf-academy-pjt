<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bookdetailTable {
   width: 800px;
   text-align: center;
}
#bookdetailTable td{
   border: 1px solid;
}
</style>
</head>
<body>
<table id="bookdetailTable">
	<tr> <td>제목 :</td> <td>${dto.book_title}</td> </tr>
    <tr> <td>이미지 :</td> <td><img src="resources/${dto.book_image}" style="width: 120px; height: 140px"></td> </tr>
	<tr> <td>저자 :</td> <td>${dto.book_writer}</td> </tr>
	<tr> <td>가격 :</td> <td>${dto.book_cost}</td> </tr>
	<tr> <td style="height:300px;">목차 :</td> <td style="height:300px;">요안에다가 목차 칼럼 넣어야함</td></tr>
</table>
    <br><br>
    <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
	<a href="book_updateform.do?book_id=${ dto.book_id }"><button>수정하기</button></a>
	<a href="book_list.do"><button>목록</button></a>
	</c:if>
</body>
</html>

