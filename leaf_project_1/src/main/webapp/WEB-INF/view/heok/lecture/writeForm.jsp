<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
​ 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this is writeform</title>
</head>
<body>
	<fieldset>
		<legend>
			<h3>강좌추가 입니다.</h3>
		</legend>
		<form action="write_lect.do" method="post">
			<table style="text-align: center;">
				<tr>
					<td>강좌명</td>
					<td></td>
					<td>
					
					<select name="curri_id">
						<c:forEach items="${ list }" var="item">	
							<option value="${item.curri_id}" >${item.curri_subject} </option>
						</c:forEach>
					</select>
							
						</td>
				</tr> 

				<tr>
					<td>클래스명</td>
					<td></td>
					<td>
					<input type="text"
						name="lect_name" required="required"
						value="${lect_name }">
					</td>
				</tr>

				<tr>
					<td>강좌 시작일</td>
					<td></td>
					<td>
						<input type="date" name="lect_start_day" value="${lect_start_day}"> 
					</td>
				</tr>

				<tr>
					<td>강좌 종료일</td>
					<td></td>
					<td><input type="date" name="lect_end_day" value="${lect_end_day}"> 
					</td>
				</tr>
				
				<tr>
					<td>강좌 시작 시간</td>
					<td></td>
					<td><input type="time" name="lect_start_time" value="${lect_start_time}" > 
					</td>
				</tr>

				<tr>
					<td>강좌 종료 시간</td>
					<td></td>
					<td><input type="time" name="lect_end_time" value="${lect_end_time}"> 
					</td>
				</tr>
				
				
				<tr>
					<td>수강인원</td>
					<td></td>
					<td><input type="text" name="lect_person_num" required="required"
						value="${lect_person_num }"></td>
				</tr>
				<tr>
					<td>수강료</td>
					<td></td>
					<td><input type="text" name="lect_charge" required="required"
						value="${lect_charge}">
					</tr>			

				<tr>
					<td colspan="3"><hr></td>
				</tr>

				<tr>
					<td><input type="button" value="취소" style="width: 100%;"
						onclick="window.location.href='list_lect.do' "></td>
					<td><input type="submit" value="추가" style="width: 100%"></td>
				</tr>
			</table>
		</form>

	</fieldset>
</body>
</html>