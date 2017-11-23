<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>오목게임</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
 <Style>
/*    A:Link{ Color: #000000; Text-decoration: underline}
   A:Visited{ Color: #000000; Text-decoration: underline}
   A:Hover{ Color: #000000; Text-decoration: none}
 td, body {font-family: verdana, arial, helvetica; font-size:11px;}   */
 #five{
   width:800px;
}
#five a{
   text-decoration: none;
   color: #000;
}
#five hr{
	border: thin solid;
	border-color: #cccccc;
}
#game_explain{
    width: 350px;
    height: 300px;
    /* float: left; */
    border: 2px solid #1f8727;
    border-radius: 4px;
    /* margin-left: 30px; */
    /* margin-right: 25px; */
    margin-top: 50px;
    margin-bottom: 20px;
}
#game_explain hr{
	border: thin solid;
	border-color: #cccccc;
}
#game_explain div{
	font-size: 14px;
	font-weight: bold;
	color:#16688e;
}
/*  */
.btn {
    display: inline-block;
    border: none;
    border-radius: .3em;
    -webkit-box-shadow: inset 0 0 0 1px #0b6d1e, inset 0 -0.25em 0 #1eb13b, 0 0.25em 0.25em #307e3d;
    /* box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05); */
    color: #fff;
    cursor: pointer;
    font-family: 'Raleway', sans-serif;
    font-weight: bold;
    line-height: 1.5;
    letter-spacing: 1px;
    padding: .5em 1.5em .75em;
    position: relative;
    text-decoration: none;
    /* text-shadow: 0 1px 1px #c4c4c4; */
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    /* margin-left: 10px; */
}
.btn:active {
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
margin-top: .25em;
padding-bottom: .5em; }
.btn:active, .btn:focus {
outline: none; }
.btn--green {
    background-color: #28b71c;}
.btn--green {
font-size: 1em; }
.btn--sm {
    font-size: 0.7em;
    width: 120px; }
/*  */
 </Style>

</head>
<body>
<center>

<div id="five"><a href="fir_index.do"><h1>오목 게임</h1></a><hr></div>
 
 <div id="game_explain">
<h3>게임 안내</h3>
<div>오목게임입니다. 머리를 쓰며 게임을 하기 때문에 
 게임의 기본 법칙을 이해하고, 사고에 도움이 됩니다.</div>
<hr>
<h3>게임방법</h3>
<div>1. 시작버튼을 누릅니다.<br>
2. 오목돌을 5개가 연결되게 만듭니다.<br>
3. 검은돌(사용자)가 5개가 연결되면 이기고, 흰돌(컴퓨터)가 5개가 연결되면 지게됩니다.<br>
※ New Game을 누르면 새 게임이 셋팅 됩니다.<br>
 (사이즈는 10X10부터 20X20까지 있습니다.)
</div>
</div>
 
 
 
 <form>
 <input type=button class="btn btn--sm btn--green" value="Start Game" 
 onClick='window.open("xo.do","game","width=610,height=280,menubar=0,scrollbars=0,resizable=0,left=460,top=250")'><!-- A��A?A��A��A?A��A��A|A��A��A?A��A��A��A��A��A?A�� A��A?A?A��A?A��A��A��A�A��A?A��A��A��A? A��A��A?A��A|A�� A��A?A?A��A��A?A��A?A��A��A?A��A��A��A�� A��A?A��A��A��A��A��A��A�A��A��A? A��A��A?A��A��A��A��A��A�� A��A?A�� -->
 </form>

</body>
</html>

