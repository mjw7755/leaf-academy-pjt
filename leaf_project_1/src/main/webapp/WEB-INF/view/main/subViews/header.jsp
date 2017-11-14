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
#img{
   padding-right: 10px;
	margin:0px;
}
/* #img a{
	
} */
.login_bar{
   width: 100%;
   background-color: #fff;
}
.login{
   height: 40px;
   width: 800px;
   margin-left: 25%;
}
.login ul{
   margin:0px;
   padding:0px;
}
.login li{
   list-style:none;
   float:left;
   line-height:40px;
   color:#1b7817;
}
.login li a{
color:#1b7817;
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
width: 100%;
} 
.menu{
margin-left:25%;
padding:0px;
font-size:14px;
font-weight:bold;
}
.menu ul{
height:60px;
list-style:none;
margin:0px;
padding:0;
}
.menu li{
float:left;
padding:0px;
}
.menu li a{
color:#000;
display:block;
font-weight:bold;
line-height:50px;
margin:0px;
/* padding:0px 25px; */
text-align:center;
text-decoration:none;
width:130px;
}
.menu li a:hover {
/* background: rgb(71,71,71); */
color:#1b7817;
text-decoration:none;
font-weight:bold;
}
/* .menu ul li:hover a{
color:#fff;
} */
.menu li ul{
/* background: rgb(109,109,109); */
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
/* width:200px; */
z-index:200;
/*top:1em;
/*left:0;*/
}
.menu li:hover ul{
display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}
.menu li li {
background: #629261;
display:block;
float:none;
margin:0px;
padding:0px;
width:130px;
border-bottom: 1px solid;
border-bottom-color: #3b7f30;
border-top:1px solid;
border-top-color: #51b34d;
}
.menu li:hover li a{
background:none;
}
.menu li ul li a{
color:#fff;
}
.menu li ul a{
display:block;
height:50px;
font-size:12px;
font-style:normal;
margin:0px;
text-align:center;
}
.menu li ul a:hover, .menu li ul li:hover a{
background: #1b7817;
border:0px;
color:#ffffff;
text-decoration:none;
}
.menu p{
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
		<div class="login_bar">
		<div class="login" >
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
				<ul>
					<li><a href="mypage.do">마이페이지</a></li>
					<li>|</li>
					<li><a href="myclass.do">내 강의실</a></li>
					<li>|</li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</c:if>
		</div>
		</div>
		
		<div class="menubar">
			<div class="menu"> 
			<ul>
				<li id="img"><a href="main.do"><img src="resources/logo.png"></a></li>
				<li id="a_tag"><a href="t_intro_list.do">소개</a></li>
				<li id="a_tag"><a href="list_lect.do">교육과정</a>
				<ul>
						<li><a href="list_curri.do">커리큘럼</a></li>
						<li><a href="list_lect.do">교육과정</a></li>
				</ul>
				</li>
				<li id="a_tag"><a href="book_list.do">자료실</a>
				<ul>
						<li><a href="book_list.do">도서</a></li>
						<li><a href="jageok_list.do">자격증</a></li>
				</ul>
				</li>
				
				<li id="a_tag"><a href="#">놀이</a></li>
				<li id="a_tag"><a href="notice_list.do">고객센터</a>
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
	</div>
</body>
</html>