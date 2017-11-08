<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signin.do" method="post">
	<table>
		<tr>
			<td>아이디 : </td><td><input type="text" name="member_id"></td><td><input type="button" value="중복확인"></td>
		</tr>
		
		<tr>
			<td>비밀번호 : </td><td><input type="text" name="member_pwd"></td>
		</tr>
			
		<tr>
			<td>비밀번호 확인 : </td><td><input type="text" name="member_pwd_confirm"></td>
		</tr>
		
		<tr>
			<td>이름 : </td><td><input type="text" name="member_name"></td>
		</tr>
		
		<tr>
			<td>전화번호(휴대폰) : </td><td><input type="text" name="member_tel"></td>
		</tr>
		
		<tr>
			<td>이메일 : </td><td><input type="text" name="member_email"></td><td><input type="button" value="이메일 인증 받기"></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="회원가입"></td><td><input type="button" value="취소"></td>
		</tr>
	</table>
</form>
</body>
</html>