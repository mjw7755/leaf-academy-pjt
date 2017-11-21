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
.form-group {
	margin-bottom: 15px;
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


</head>
<body>
<div id="top_banner">
	<div id="banner">
	<img src="resources/top_banner3.png">
	</div>
</div>

	<article class="container">
        <div class="loginform">
			<h1>로그인</h1>
			<hr>
			<table>
			 <form role="form" action="login.do" method="post">
				<tr>
					<td>
						<div class="form-group">
							<label id="username">아이디</label>
					</td>
					<td><input type="text" class="form-control" name="member_id"
						placeholder="ID를 입력해 주세요">
						</div></td>
					
            </tr>

				<tr>
					<td>
						<div class="form-group">
							<label id="userpassword">비밀번호</label>
					</td>
					<td><input type="password" class="form-control"
						name="member_pwd" placeholder="비밀번호">
						</div></td>
						
				
				</tr>
			</table>

		<table>
				<!-- <form role="form" action="signupForm.do" method="post"> -->
				<tr>

						<td rowspan="2">
         
                   <div class="form-group text-center">
             <button type="submit" class="btn btn-info" id="login">로그인</button>

            </div>

		</form>				
            </td>
					<td colspan="3">
						<div class="form-group text-center">
							<a href="signupForm.do">
								<button class="btn btn-info" id="signup">회원가입</button>
							</a>
						</div>
					</td>
					
					
				</tr>
				<!-- </form> -->
		</table>		
		</div>
	</article>
<article class="container">
	<div class="loginform">
	<h1>로그인</h1>
	<hr>
	<form role="form" action="login.do" method="post">
	<table>
		<tr>
			<td>
				<div class="form-group"></div>
				<label id="username">아이디</label>
			</td>
			<td>
				<input type="text" class="form-control" name="member_id" placeholder="ID를 입력해 주세요">			
			</td>					
        </tr>
		<tr>
			<td>
				<div class="form-group"></div>
				<label id="userpassword">비밀번호</label>
			</td>
			<td>
				<input type="password" class="form-control" name="member_pwd" placeholder="비밀번호">
			</td>			
		</tr>
		<tr>
			<td rowspan="2">
     			<div class="form-group text-center">
        			<button type="submit" class="btn btn-info" id="login">로그인</button>
				</div>
        	</td>
			<td colspan="3">
				<div class="form-group text-center">
				<a href="signupForm.do">
					<button type="button" class="btn btn-info" id="signup">회원가입</button>
				</a>
				</div>
			</td>	
		</tr>
	</table>
	</form>
	</div>
</article>
</body>
</html>