<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.do" method="post">
   <table>
      <tr>
         <td>ID 입력 : </td><td><input type="text" name="member_id"></td>
      </tr>
      <tr>
         <td>비밀번호 : </td><td><input type="password" name="member_pwd"></td>
      </tr>
      <tr>
         <td text-align="center" collspan="2"><input type="submit" value="로그인"></td>
      </tr>
   </table>
</form>
</body>
</html>