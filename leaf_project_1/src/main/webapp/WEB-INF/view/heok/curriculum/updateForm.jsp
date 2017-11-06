<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update_curri.do">
		<table style="text-align: center;">
			<input type="hidden" name="curri_id" value="${dto.curri_id }">
			<tr>
				<td>강좌명</td>
				<td>:</td>
				<td><input type="text" name="curri_subject" required="required"
					value="${dto.curri_subject}"></td>
			</tr>

			<tr>
				<td>강좌레벨</td>
				<td>:</td>
				<td><select name="curri_level" value="${curri_level }">
						<option value="레벨" selected="selected"> ${dto.curri_level }</option>
						<option value="초급"> 초급 </option>
						<option value="중급"> 중급 </option>
						<option value="고급"> 고급 </option>
				</select></td>
			</tr>

			<tr>
				<td>강좌내용</td>
				<td>:</td>
				<td><input type="textarea" name="curri_content" required="required"
					value="${dto.curri_content}"></td>
			</tr>

			<tr>
				<td><input type="button" value="취소"
					onclick="window.location.href='curri_list.do' "></td>
				<td><input type="submit" value="수정하기"></td>
			</tr>


		</table>


	</form>
</body>
</html>