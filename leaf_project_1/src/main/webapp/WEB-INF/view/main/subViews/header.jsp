<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
.menubar{
border:none;
border:0px;
margin:0px;
padding:0px;
font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
font-size:14px;
font-weight:bold;
}

.menubar ul{
background: rgb(109,109,109);
height:50px;
list-style:none;
margin:0;
padding:0;
}

.menubar li{
float:left;
padding:0px;
}

.menubar li a{
background: rgb(109,109,109);
color:#cccccc;
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
.login{
	float: right;
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
		<div class="login">
		<c:if test="${sessionScope.sessionid == null}">
		<button onclick="javascript:window.location.href='loginForm.do'">로그인</button>
		<button onclick="javascript:window.location.href='signinForm.do'">회원가입</button>
		</c:if>
		<c:if test="${sessionScope.sessionid != null}">
		<button onclick="javascript:window.location.href='logout.do'">로그아웃</button>
		</c:if>
		<span></span>
		</div>
		<div class="menubar">
			<ul>
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

</body>
</html>