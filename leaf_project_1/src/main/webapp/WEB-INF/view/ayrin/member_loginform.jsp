<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap -->
    <link href="css/ayrin/bootstrap.min.css" rel="stylesheet">
	<!-- font awesome -->
    <link rel="stylesheet" href="css/ayrin/font-awesome.min.css" media="screen" title="no title">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/ayrin/style.css" media="screen" title="no title">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
<br><br><br><br><br><br>
	<article class="container">
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="login.do" method="post">
            <div class="form-group">
              <label for="username">ID</label>
              <input type="text" class="form-control" name="member_id" placeholder="ID를 입력해 주세요">
            </div>
            <div class="form-group">
              <label for="InputPassword1">비밀번호</label>
              <input type="password" class="form-control" name="member_pwd" placeholder="비밀번호">
            </div>            
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">로그인</button>
            </div>
          </form>
        </div>
	</article>
<br><br><br><br><br><br>

<!-- <form action="login.do" method="post">
   <table>
      <tr>
         <td>ID 입력 : </td><td><input type="text" name="member_id"></td>
      </tr>
      <tr>
         <td>비밀번호 : </td><td><input type="password" name="member_pwd"></td>
      </tr>
      <tr>
         <td colspan="2"><input type="submit" value="로그인"></td>
      </tr>
   </table>
</form> -->
</body>
</html>