<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	$("#note_btn").click(function(){
		var sessionid = "${sessionScope.sessionid}";
		
		if(sessionid == ""){
			alert("로그인이 필요한 서비스입니다.");
			location.href="loginForm.do";
		}else if(sessionid != "") {
			location.href="noteList.do"
		}
	});
	
});
</script>

<style type="text/css">
.footer{
   width: 100%;
   margin-top: 50px;
}
#foot{
   width:800px;
   margin-left: 25%;
   font-size: 9px;
   font-weight: bold;
   color: #ababab;
   float: left;
}
.alert_div{
	position: fixed;
    top: 75%;
    right: 2%;
    font-size: 13px;
	display: none; 
}

/*  */

/* *, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
} */
/* body {
  background: #333;
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
} */
.buttons {
  margin-top: 100px;
  text-align: center;
}
.blob-btn {
  z-index: 1;
  position: relative;
  padding: 20px 46px;
  margin-bottom: 30px;
  text-align: center;
  text-transform: uppercase;
  color: #1b7817;/* 쪽지도착 글씨색 */
  font-size: 16px;
  font-weight: bold;
  background-color: transparent;
  outline: none;
  border: none;
  transition: color 0.5s;
  cursor: pointer;
}
.blob-btn:before {
  content: "";
  z-index: 1;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 6px solid #1b7817;
}
.blob-btn:after {
  content: "";
  z-index: -2;
  position: absolute;
  left: 6px;
  top: 6px;
  width: 100%;
  height: 100%;
  border: 6px solid #629261;
  transition: all 0.3s 0.2s;
}
.blob-btn:hover {
  color: #fff;
}
.blob-btn:hover:after {
  transition: all 0.3s;
  left: 0;
  top: 0;
}
.blob-btn__inner {
  z-index: -1;
  overflow: hidden;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
}
.blob-btn__blobs {
  position: relative;
  display: block;
  height: 100%;
  filter: url('#goo');
}
.blob-btn__blob {
  position: absolute;
  top: 6px;
  width: 25%;
  height: 100%;
  background: #1b7817;
  border-radius: 100%;
  transform: translate3d(0, 150%, 0) scale(1.7);
  transition: transform 0.45s;
}
@supports (filter: url('#goo')) {
  transform: translate3d(0, 150%, 0) scale(1.4);
}
.blob-btn__blob:nth-child(1) {
  left: 0%;
  transition-delay: 0s;
}
.blob-btn__blob:nth-child(2) {
  left: 30%;
  transition-delay: 0.08s;
}
.blob-btn__blob:nth-child(3) {
  left: 60%;
  transition-delay: 0.16s;
}
.blob-btn__blob:nth-child(4) {
  left: 90%;
  transition-delay: 0.24s;
}
.blob-btn:hover .blob-btn__blob {
  transform: translateZ(0) scale(1.7);
}
@supports (filter: url('#goo')) {
  transform: translateZ(0) scale(1.4);
}
/*  */

   #quick_banner{
      position: fixed;
      top:20%;
      right: 2%;
      width:75px;
      z-index: 2;
   }
   #quick_banner a{
      text-decoration: none;
      color: #000;
   }
   #quick{
      background-color: #2b6728;
      color:#fff;
      height: 60px;
      text-align: center;
   }
   #quick p{
      padding-top: 10px;
   }
   #quick_myclass, #quick_mypage, #quick_message, #quick_curri{
      border: 1px solid;
      border-color: #9c9e9c;
      height: 60px;
      text-align: center;
      font-size: 12px;
      font-weight: bold;
      background-color: #fff;
   }
   #quick_myclass p, #quick_mypage p, #quick_message p, #quick_curri p{
      margin: auto;
      padding-top: 5px;
      padding-bottom: 5px;
   }
   #quick_myclass img, #quick_mypage img, #quick_message img, #quick_curri img{
      width:30px;
      height: 30px;
   }
   #quick_top{
      background-color: #2b6728;
      color:#fff;
      height: 45px;
      text-align: center;
   }
   #quick_top p{
      margin: auto;
   }
   #quick_top img{
      width:20px;
      height: 13px;
   }
</style>
<body>
   <div class="footer">
      <table id="foot">
         <tr>
         <td rowspan="5"><img src="resources/ram/logo.png"></td>
         </tr>
         <tr>
            <td>경기 성남시 분당구 대왕판교로 660  리프교육빌딩 (주)리프코딩아카데미</td>
         </tr>
         <tr>
            <td>대표이사 : 박영태 개인정보보호책임자 : 문재웅 사업자등록번호 : 111-23-24321 통신판매업신고번호 : 제9394-성남분당-3426호</td>         
         </tr>
         <tr>
            <td>E. parkyoung@daum.net    T. 02-7375-1436    F. 02-7253-1436
         </tr>
         <tr>
            <td>ⓒ 2017 LeafCA Co.,Ltd All Rights Reserved.</td>
         </tr>
      </table>
   

   <div class="alert_div">
   <div class="buttons">
  <button class="blob-btn">
    쪽지가 도착했습니다
    <span class="blob-btn__inner">
      <span class="blob-btn__blobs">
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
        <span class="blob-btn__blob"></span>
      </span>
    </span>
  </button>
  <br/>
</div>

<!-- <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <defs>
    <filter id="goo">
      <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10"></feGaussianBlur>
      <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 21 -7" result="goo"></feColorMatrix>
      <feBlend in2="goo" in="SourceGraphic" result="mix"></feBlend>
    </filter>
  </defs>
</svg> -->
   </div>
   
   </div>
   
    <!-- quick menu -->
    <div id="quick_banner">
   <div id="quick">
      <p>QUICK MENU</p>
   </div>
   
   <a href="myclass.do">
   <div id="quick_myclass">
      <p>내 강의실</p>
      <img src="resources/ram/lecture2.png">
   </div>
   </a>
   
   <a href="mypage.do">
   <div id="quick_mypage">
      <p>마이페이지</p>
      <img src="resources/ram/mypage.png">
   </div>
   </a>
   
   <a href="#" id="note_btn">
   <div id="quick_message">
      <p>쪽지함</p>
      <img src="resources/ram/message.png">
   </div>
   </a>
   
   <a href="list_curri.do">
   <div id="quick_curri">
      <p>커리큘럼</p>
      <img src="resources/ram/curriculum3.png">
   </div>
   </a>
   
   <a href="#">
   <div id="quick_top">
      <img src="resources/ram/scroll.png">
      <p>TOP</p>
   </div>
   </a>
   
</div>
<!-- <script src="http://code.jquery.com/jquery-1.8.1.min.js"></script> -->
<script src="resources/scroll.js"></script>
<script>
   $(function() {
      $("#quick_top").click(function() {
         $('html,body').animate({
            scrollTop : 0
         }, 400);
         return false;
      });
   });
</script>
    <!-- quick menu end -->   
</body>
</html>