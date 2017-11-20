<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
<style type="text/css">
#jageokdetailTable {
   width: 800px;
}
#jageokdetailTable td{
   border: 1px solid;
}
</style>
</head>
<body>
<br><br><br><br>
<table id="jageokdetailTable">
	<tr> <td>자격증 : </td> <td>${dto.jageok_title}</td> </tr>
	<tr> <td>시험일 : </td> <td>${dto.jageok_date}</td> </tr>
	<tr> <td>비용 : </td> <td>${dto.jageok_cost}</td> </tr>
</table>    
	<br><br>   
	<c:if test="${sessionScope.sessionid=='관리자' or sessionScope.sessionid=='강사1'}"> 
	<a href="jageok_updateform.do?jageok_id=${ dto.jageok_id }"><button>수정하기</button></a>
	<a href="jageok_list.do"><button>목록</button></a>
	</c:if>
</body>
</html>

