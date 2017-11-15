<html>
<head>
<meta http-equiv="Content-Type" content="UTF-8">
<a href="button.do">go</a>
<script language="JavaScript">

newSize=0;
function init() {}
function resetGame() {window.location="xo.html"}

</script>
</head>
<body bgcolor="#FFFFFF">


<form>
<center>

<table cellspacing=0 cellpadding=0><tr>
<td colspan=2>
<p class=bodytext> 오목게임입니다. 컴퓨터와 진행하며 컴퓨터는 O
 사용자는 X입니다. 머리를 쓰며 게임을 하기 때문에 
 게임의 기본 법칙을 이해하고, 사고에 도움이 될 것입니다.
 New Game을 누르면 새 게임이 셋팅 됩니다.
 (사이즈는 10X10부터 20X20까지 있습니다.)</p>
</td>
</tr>
<tr>
<td>
<font size=2 face="Arial,Helvetica,sans-serif">Size:</font>&nbsp;<select onChange="top.boardSize=parseInt(this.options[this.selectedIndex].value);top.init()">
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15 selected>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>
</select>
</td><td>
<font size=2 face="Arial,Helvetica,sans-serif"><input type=button value=" New Game " onClick="setTimeout('top.resetGame()',100)"></font>
</td></tr></table>
</center>
</form>

</body>
</html>