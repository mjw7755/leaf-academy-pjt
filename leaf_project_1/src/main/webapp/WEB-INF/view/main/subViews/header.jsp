<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
/* .header{
	height: 
} */
.login{
	height: 40px;
	width: 100%;
	margin:0px;
	padding:0px;
	background-color: #2b2b2b;
}
.login ul{
	margin:0px 0px 0px 300px;
	padding:0px;
}
.login li{
	list-style:none;
	float:left;
	line-height:40px;
	color : #999999;
}
.login li a{
color : #999999;
display:block;
font-weight:normal;
/* margin:0px; */
padding:0px 10px;
text-align:center;
text-decoration:none;
font-size: 10px;
font-weight:bold;
}

.menubar{
margin:0px;
padding:0px;
font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
font-size:14px;
font-weight:bold;
}
.menubar ul{
height:60px;
list-style:none;
margin:0px 0px 0px 305px;
padding:0;
}
.menubar li{
float:left;
padding:0px;
}
.menubar li a{
color:#000;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}
.menubar li a:hover, .menubar ul li:hover a{
background: rgb(71,71,71);
color:#FFFFFF;
text-decoration:none;
}
.menubar li ul{
background: rgb(109,109,109);
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
/*top:1em;
/*left:0;*/
}
.menubar li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}
.menubar li li {
background: rgb(109,109,109);
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}
.menubar li:hover li a{
background:none;
}
.menubar li ul a{
display:block;
height:50px;
font-size:12px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}
.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color:#ffffff;
text-decoration:none;
}
.menubar p{
clear:left;
}
</style>

</head>
<body>
<!-- 		<tr>
			<td>소개</td>
			<td>강의</td>
			<td>자료실</td>
			<td>놀이</td>
			<td>고객센터</td>
		</tr> -->
	<div class="header">
		<div class="login">
			<c:if test="${sessionScope.sessionid == null}">
				<ul>
					<li><a href="loginForm.do">로그인</a></li>
					<li>|</li>
					<li><a href="signupForm.do">회원가입</a></li>
					<!-- <button onclick="javascript:window.location.href='loginForm.do'">로그인</button>
					 	<button onclick="javascript:window.location.href='signinForm.do'">회원가입</button> -->
				</ul>
			</c:if>
			<c:if test="${sessionScope.sessionid != null}">
				<button onclick="javascript:window.location.href='logout.do'">로그아웃</button>
			</c:if>
			<span></span>
		</div>

		<div class="menubar">
			<ul>
				<li><img src="resources/logo.png"></li>
				<li><a href="t_intro_list.do">소개</a></li>
				<li><a href="list_lect.do">교육과정</a>
				<ul>
						<li><a href="list_curri.do">커리큘럼</a></li>
						<li><a href="list_lect.do">교육과정</a></li>
				</ul>
				</li>
				<li><a href="book_list.do">자료실</a>
				<ul>
						<li><a href="book_list.do">도서</a></li>
						<li><a href="jageok_list.do">자격증</a></li>
				</ul>
				</li>
				
				<li><a href="#">놀이</a></li>
				<li><a href="notice_list.do">고객센터</a>
					<ul>
						<li><a href="notice_list.do">공지사항</a></li>
						<li><a href="faq_list.do">FAQ</a></li>
						<li><a href="qna_list.do">QNA</a></li>
						<li><a href="#">쪽지</a></li>				
					</ul>	
				</li>	
			</ul>
		</div>
	</div>
</body>
</html>