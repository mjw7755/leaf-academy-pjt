<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bookdetailTable {
   width: 800px;
}
#bookdetailTable td{
   border: 1px solid;
}

.btn {
display: inline-block;
border: none;
border-radius: .3em;
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
color: #fff;
cursor: pointer;
font-family: 'Raleway', sans-serif;
font-weight: 300;
line-height: 1.5;
letter-spacing: 1px;
padding: .5em 1.5em .75em;
position: relative;
text-decoration: none;
text-shadow: 0 1px 1px rgba(255, 255, 255, 0.25);
vertical-align: middle;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none; 
}
.btn:active {
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
margin-top: .25em;
padding-bottom: .5em; }
.btn:active, .btn:focus {
outline: none; }
.btn--green {
background-color: #1abc9c; }
.btn--green {
font-size: 1em; }
.btn--sm {
font-size: 0.75em; }

</style>
</head>
<body>
<table id="bookdetailTable">
	<tr> <td>제목 :</td> <td>${dto.book_title}</td> </tr>
    <tr> <td>이미지 :</td> <td><img src="resources/${dto.book_image}" style="width: 120px; height: 140px"></td> </tr>
	<tr> <td>저자 :</td> <td>${dto.book_writer}</td> </tr>
	<tr> <td>가격 :</td> <td>${dto.book_cost}</td> </tr>
	<tr> <td style="height:300px;">소개 :</td> <td style="height:300px; width:700px">${dto.book_contents}</td></tr>
</table>
	<a href="book_list.do"><button class="btn btn--sm btn--green">목록으로</button></a>
    <br><br>
    <c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}">
	<a href="book_updateform.do?book_id=${ dto.book_id }"><button>수정하기</button></a>
	<a href="book_list.do"><button>목록</button></a>
	</c:if>
</body>
</html>

