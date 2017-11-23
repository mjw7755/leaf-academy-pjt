<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update_lect.do" >
		<table style="text-align: center;">
				<input type="hidden" name="lect_id" value="${dto.lect_id}">
				<tr>
					<td>강좌명</td>
					<td>:</td>
					<td><input type="text" name="lect_name" required="required"
						value ="${dto.lect_name}">
					</td>
				</tr>

				<tr>
					<td>강좌 시작일</td>
					<td>:</td>
					<td><input type="date" name="lect_start_day" value ="${dto.lect_start_day}"> 
					</td>
				</tr>

				<tr>
					<td>강좌 종료일</td>
					<td>:</td>
					<td><input type="date" name="lect_end_day" value ="${dto.lect_end_day}"> 
					</td>
				</tr>
				
				<tr>
					<td>강좌 시작시간</td>
					<td>:</td>
					<td> <input type="time" name="lect_start_time" value ="${dto.lect_start_time}"> 
					</td>
				</tr>

				<tr>
					<td>강좌 종료시간</td>
					<td>:</td>
					<td><input type="time" name="lect_end_time" value ="${dto.lect_end_time}"> 
					</td>
				</tr>
				
				<tr>
					<td>수강인원</td>
					<td>:</td>
					<td><input type="text" name="lect_person_num" required="required"
						value="${dto.lect_person_num }"></td>
				</tr>
				
				 <tr>
					<td>수강료</td>
					<td>:</td>
					<td><input type="text" name="lect_charge" required="required"
						value="${dto.lect_charge }"></td>
				</tr> 
				

				<tr>
					<td colspan="3"><hr></td>
					
				</tr>
				<tr>
					<td><input type="button" value="취소"  onclick="window.location.href='list_lect.do' "></td>
					<td><input type ="submit" value ="수정하기"></td>
				</tr>

				
			</table>

			
	</form>
</body>
</html>