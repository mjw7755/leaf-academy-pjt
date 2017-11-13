<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">
#aa {
	width: 100px;
	border: 1px solid;
}
#bb {
	height: 700px;
	width: 600px;
	border: 1px solid;
}
</style>

</head>
<body>

<!-- member_level 학생일때 -->
		<table style="border: 1px solid; margin:0 auto;">
			<tr>
				<td id="aa" style="border: 1px solid">
					<button onclick="member_updateform.do">개인정보</button><br>
					<button onclick="#">내역조회</button>
				</td>
				<td id="bb" style="border: 1px solid">
					<div>
						ID : <input readonly="readonly" type="text" name="member_id" value="${dto.member_id}"><br>
						NAME : <input readonly="readonly" name="member_name" value="${dto.member_name}"><br>
						PWD : <input type="text" name="member_pwd" value="${dto.member_pwd}"><br>
						TEL : <input type="text" name="member_tel" value="${dto.member_tel}"><br>
						EMAIL : <input type="text" name="member_email" value="${dto.member_email}"><br>
						<a href="member_update.do"> <button id="edit">수 정</button> </a>
					</div>
					
					<div>
					강의, 결제 내역 
					</div>
				</td>
			</tr>
		</table>

</body>
</html>