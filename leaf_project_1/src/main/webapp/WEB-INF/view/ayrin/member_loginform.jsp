<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#banner{
	width:800px;
}
#banner img{
	/* float: right; */
}
a#signup {
    text-decoration: none;
}
label {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 5px;
	font-weight: 700;
	float:left;
}
.form-control {
	display: block;
	margin-right: 15px;
	/* width: 100%; */
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}
.btn-info {
	color: #fff;
	background-color: #5bc0de;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #31b0d5;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #31b0d5;
	border-color: #269abc;
}
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	margin-top:12px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;	
}
/* bootstrap end */
.container {
	padding-right: 15px;
	padding-left: 15px;
	padding-top: 50px;
	width: 500px;
	height:300px;
}
.container hr{
	border: thin solid;
}
.form-group {
	margin-bottom: 15px;
	margin-left:40px;
}
#username,#userpassword{
	width: 100px;
	text-align: left;
	line-height: 35px;
}
#login{
	margin-right: 20px;
	margin-left: 65px;
}
h1{
	margin-bottom: 10px;
}
</style>
<script>
function check() {
  var id = document.getElementById("member_id");
  var pwd = document.getElementById("member_pwd");
  
  if(id.value == "") {
	  alert("아이디를 입력해주세요");
	  return false;
  }else if(pwd.value == ""){
	  alert("비밀번호를 입력해주세요");
	  return false;
  }else {
	  $.ajax({
			url:"login.do",
			data:{
				"idvalue" : id.value,
				"pwdvalue" : pwd.value
				},
			success:function(data){
				if(data == 1){
					alert("로그인에 성공하였습니다.");
					location.href="main.do";
				}else{
					alert("아이디나 비밀번호가 틀렸습니다.");
					location.href="loginForm.do";					
				}
			}
		});
	  }
}

function runScript(e) {
    if(e.keyCode == 13) { // enter는 13이다!
    	check();
    } else {
        return true;
    }
}
</script>

</head>
<body>
<div id="top_banner">
	<div id="banner">
	<img src="resources/ram/top_banner3.png">
	</div>
</div>

<article class="container">
	<div class="loginform">
	<h1>로그인</h1>
	<hr>
	<table>
		<tr>
			<td>
				<div class="form-group"></div>
				<label id="username">아이디</label>
			</td>
			<td>
				<input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID를 입력해 주세요">			
			</td>					
        </tr>
		<tr>
			<td>
				<div class="form-group"></div>
				<label id="userpassword">비밀번호</label>
			</td>
			<td>
				<input type="password" class="form-control" id="member_pwd" name="member_pwd" placeholder="비밀번호" onkeypress="return runScript(event)">
			</td>			
		</tr>
		<tr>
			<td colspan="2">
     			<div class="form-group text-center">
     			<a class="btn btn-info" id="login" onclick="check()">로그인</a>
				<a class="btn btn-info" id="signup" href="signupForm.do">회원가입</a>
				</div>
			</td>	
		</tr>
	</table>
	</div>
</article>
</body>
</html>