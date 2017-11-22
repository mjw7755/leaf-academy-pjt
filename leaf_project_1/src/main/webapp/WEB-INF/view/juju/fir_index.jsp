<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>오목게임</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
 <Style>
   A:Link{ Color: #000000; Text-decoration: underline}
   A:Visited{ Color: #000000; Text-decoration: underline}
   A:Hover{ Color: #000000; Text-decoration: none}
 td, body {font-family: verdana, arial, helvetica; font-size:11px;}  
 </Style>

</head>
<body bgcolor="#EDEDED" text="#000000" link="#000000" topmargin="0" leftmargin="0">
<center>

<!-- BODY START HERE -->

 
 <h3><font face="sans-serif" color="#FF0000">
 오목이당
 </font></h3>
 <font face="sans-serif" color="#000099">
 <hr size=2 color="#808000">
 </font>
 <table border="1" width="61%" height="121">
   <tr>
     <td width="100%" height="115">
 
오목게임입니다. 컴퓨터와 진행하며 컴퓨터는 O
 사용자는 X입니다. 머리를 쓰며 게임을 하기 때문에 
 게임의 기본 법칙을 이해하고, 사고에 도움이 될 것입니다.
 New Game을 누르면 새 게임이 셋팅 됩니다.
 (사이즈는 10X10부터 20X20까지 있습니다.)
 </td>
   </tr>
 </table>
 <p>&nbsp;</p>
 
 <form>
 <input type=button value="Start Game" 
 onClick='window.open("xo.do","game","width=610,height=350,menubar=0,scrollbars=0,resizable=0")'><!-- A��A?A��A��A?A��A��A|A��A��A?A��A��A��A��A��A?A�� A��A?A?A��A?A��A��A��A�A��A?A��A��A��A? A��A��A?A��A|A�� A��A?A?A��A��A?A��A?A��A��A?A��A��A��A�� A��A?A��A��A��A��A��A��A�A��A��A? A��A��A?A��A��A��A��A��A�� A��A?A�� -->
 </form>

</body>
</html>

