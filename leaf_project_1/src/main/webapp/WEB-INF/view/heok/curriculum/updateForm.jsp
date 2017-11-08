<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
   textarea { 
   resize: none; 
   overflow: visible;
   }
   
   table {
	text-align: center;
	font-size: 20px;
    margin-left: auto;
    margin-right: auto;
	}
	legend {
	align-content: center;
	}
</style>

<body>
	<fieldset>
	<legend>
			<h3>강좌수정</h3>
		</legend>
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
				<td><select name="curri_level" value="${dto.curri_level }">
						
							<option value="${dto.curri_level }" > ${dto.curri_level }</option>
						
						<option value="초급"> 초급 </option>
						<option value="중급"> 중급 </option>
						<option value="고급"> 고급 </option>
				</select></td>
			</tr>

			<tr>
				<td>강좌내용</td>
				<td>:</td>
				<td>
				<textarea rows=30 cols=50 id="curri_content" name="curri_content" class="curri_content" required="required"
					value="${dto.curri_content}">${dto.curri_content}
				</textarea>
				</td>
			</tr>

			<tr>
				<td colspan="3">
					<input type="button" value="취소"
						onclick="window.location.href='list_curri.do' ">
					
					<input type="submit" value="수정하기">
				</td>
			</tr>


		</table>


	</form>
	</fieldset>
</body>
</html>