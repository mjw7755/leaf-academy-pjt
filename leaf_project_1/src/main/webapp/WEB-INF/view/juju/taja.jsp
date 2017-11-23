<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>taja</title>
<style type="text/css">
.TajaControl{
	width: 800px;
	height: 500px;
	background-image: url("resources/ram/taja_game.png");
	float: left;
}
#tajaMain_div{
   width:800px;
}
#tajaMain_div a{
   text-decoration: none;
   color: #000;
}
#tajaMain_div hr{
	border: thin solid;
	border-color: #cccccc;
}
/* #container{
	width:800px;
} */
#start{
	padding-top: 450px;
}
.btn a{
	text-decoration: none;
	color: #fff;
}
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
.form-control {
	/* display: block; */
	/* margin-right: 15px; */
	/*margin-left: 15px; */
	/* width: 40%;  */
	/* height: 34px; */
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
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.juju2{
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
	font-size: 14px;
	font-weight: bold;
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
	border: 1px solid #1f8727;
	border-radius: 4px;	
	background-color:#57c85f; 
	z-index: 1;
	color: #fff;
	display: none;
	box-shadow:1px 1px 3px rgba(0,0,0,0.5);
	/* padding: 3px; */
	/* border:1px solid #0000ff; */
	/* font-weight: bold; */
}
#score{
	width: 150px;
	height: 200px;
	margin-top:150px;
	margin-left: 30px;
	float: left;
}
#score_table{
	width: 100%;
	border: 2px solid #1f8727;
	border-radius: 4px;	
	/* background-color:#e5d335;  */
	color:#16688e;
	margin-bottom: 10px;
}
#score_table a{
	text-decoration: none;
    color: #d33c7c;
    padding-left: 8px;
}
#score_table td{
	font-size: 20px;
	font-weight: bold;
}
#score_text, #life_text{
	padding-left: 8px;
}
#score_text, #aaa, #life_text, #life{
	padding-bottom: 10px;
    padding-top: 5px;
}
#game_explain{
	width: 300px;
    height: 250px;
    float: left;
    border: 2px solid #1f8727;
    border-radius: 4px;
    margin-left: 30px;
    margin-right: 25px;
    margin-top: 200px;
}
#game_explain hr, #score_table hr{
	border: thin solid;
	border-color: #cccccc;
}
#game_explain div{
	font-size: 14px;
	font-weight: bold;
	color:#16688e;
}
#disp{
    display: none;
    width: 300px;
    height: 200px;
    z-index: 1;
    float: left;
}
/*  */
.btn-info {
	color: #fff;
	background-color: #f16022;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #b64413;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #b64413;
	border-color: #973911;
}
.btn2 {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
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
}
</style>
<input type="hidden" name="member_id" value="${param.member_id}">
</head>
<body>
	<script language="JavaScript">
		var movTime = 900; //Ã«ÂÂ¨Ã¬ÂÂ´ Ã¬ÂÂÃ¬Â§ÂÃ¬ÂÂ
		var makeTime = 1700; //Ã­ÂÂÃ«Â©Â´Ã¬ÂÂ Ã«ÂÂ¨Ã¬ÂÂ´ÃªÂ°Â Ã«Â§ÂÃ«ÂÂ¤Ã¬ÂÂ´Ã¬Â§ÂÃ«ÂÂ Ã¬ÂÂÃªÂ°ÂÃ¬Â°Â¨Ã¬ÂÂ´
		var endCnt = 0;
		var Taja = [ "abstract", "else", "instanceof", "super", "boolean",
				"enum", "int", "switch", "break", "export", "interface",
				"synchronized", "byte", "extends", "let", "this", "case",
				"false", "long", "throw", "catch", "final", "native", "throws",
				"with", "char", "finally", "new", "transient", "static",
				"class", "float", "null", "true", "in", "const", "for",
				"package", "try", "double", "continue", "function", "private",
				"typeof", "while", "debugger", "goto", "protected", "var",
				"short", "default", "if", "public", "void", "import", "delete",
				"implements", "return", "volatile", "do" ];
		var onDiv = []; // Ã­ÂÂÃ¬ÂÂ¬ Ã­ÂÂÃ«Â©Â´Ã¬ÂÂÃ¬ÂÂ Ã¬ÂÂÃ¬Â§ÂÃ¬ÂÂ´Ã«ÂÂ div

		var tempDiv = []; // Ã­ÂÂÃ¬ÂÂ¬ Ã­ÂÂÃ«Â©Â´Ã¬ÂÂÃ¬ÂÂ Ã¬ÂÂÃ¬Â§ÂÃ¬ÂÂ´Ã«ÂÂ div

		var score = 0;

		var life = 3;

		var lifeDiv1 = document.getElementById("bbb");
		var lifeDiv2 = document.getElementById("bbb");
		var lifeDiv3 = document.getElementById("bbb");
		//var lifeDiv = new Array(3);

		function lifeShow(life) {
			if (life == 3) {
				/* lifeDiv1.style.display = "inline";
				lifeDiv2.style.display = "inline";
				lifeDiv3.style.display = "inline";	 */
				document.getElementById("life").innerHTML = 3;
			} else if (life == 2) {
				/* lifeDiv1.style.display = "inline";
				lifeDiv2.style.display = "inline";
				lifeDiv3.style.display = "none"; */
				document.getElementById("life").innerHTML = 2;
			} else if (life == 1) {
				/* lifeDiv1.style.display = "inline";
				lifeDiv2.style.display = "none";
				lifeDiv3.style.display = "none"; */
				document.getElementById("life").innerHTML = 1;
			} else if (life <= 0) {
				/* lifeDiv1.style.display = "none";
				lifeDiv2.style.display = "none";
				lifeDiv3.style.display = "none"; */
				document.getElementById("life").innerHTML = 0;
				alldelete();
			}
		}

		/** TajaÃ«Â°Â°Ã¬ÂÂ´Ã¬ÂÂÃ¬ÂÂ Ã«ÂÂ¨Ã¬ÂÂ´ Ã«Â½ÂÃ¬ÂÂ Ã­ÂÂÃ«Â©Â´Ã¬ÂÂ Ã«Â³Â´Ã¬ÂÂ´ÃªÂ¸Â° **/
		function wordsManufacture() {
			var wordRanId = Math.round(Math.random() * (Taja.length - 1));
			var wordRanX = Math.round(Math.random() * 480) + 480;
			var newDiv = eval("juju" + wordRanId);
			var wordWidth = newDiv.innerHTML.length * 11;
			newDiv.style.top = 250 + "px";
			newDiv.style.width = wordWidth + "px";
			newDiv.style.left = wordRanX + "px";
			newDiv.style.display = "inline";
			
	 		var movDiv = "";
			for (var i = 0; i < Taja.length; i++) {
				movDiv = movDiv
						+ "<DIV id=juju"
						+ i
						+ " class=juju2 style='position:absolute;left:30px;top:250px;width:50px;height:22px;"
						+ "'>"
						+ Taja[i] + "</div>"; // Ã¬ÂÂÃ­ÂÂÃ«ÂÂ Ã¬Â£Â¼Ã¬Â Â Ã¬ÂÂ Ã­ÂÂÃ­ÂÂ Ã«ÂÂ Ã«Â°ÂÃªÂ¾Â¸Ã«ÂÂ Ã«Â¶ÂÃ«Â¶Â
			} 

			//////////////////////////

			var ckIN = false; // Ã¬ÂÂÃ«ÂÂ¤ÃªÂ³Â  ÃªÂ°ÂÃ¬Â Â

			for (i = 0; i < onDiv.length; i++) {
				if (onDiv[i].id == newDiv.id) {
					console.log("ì´ë¯¸ìëê±°ÂÂ~");
					ckIN = true; // Ã¬ÂÂÃªÂµÂ¬Ã«ÂÂ Ã­ÂÂÃ¬ÂÂ 
					break; // Ã¬Â°Â¾Ã¬ÂÂÃ¬ÂÂ¼Ã«ÂÂ Ã«Â£Â¨Ã­ÂÂÃ¬ÂÂ Ã«Â¬Â´Ã¬ÂÂÃ«Â¯Â¸
				}
			}

			if (!ckIN) { //ckInÃ¬ÂÂ´ false Ã¬ÂÂ¼Ã«ÂÂÃ«Â§Â
				console.log("ifë¤ì´ê°ë ê³³");
				onDiv.push(newDiv);
				console.log(score);
			}

			if (endCnt % 2 == 0) {
				tajaStart.style.display = "none";
			} else {
				setTimeout(wordsManufacture, makeTime);
				tajaStart.value = "시작";
				tajaStart.style.display = "none";
			}
		}
		
		function alldelete() {
			tajaMain.style.display = "none";
			disp.style.display="block";
			//lifeshow(life).delete;
			wordsManufacture().stopImmediatePropagation();
			wordsMove().stopImmediatePropagation();
			tajaGoGo().stopImmediatePropagation();
			wordsCheck().stopImmediatePropagation();
			wordsCheck(evt).stopImmediatePropagation();
			taja.Init().stopImmediatePropagation();
		}

		/** Ã«Â½ÂÃ¬ÂÂ Ã«ÂÂ¨Ã¬ÂÂ´ Ã¬ÂÂÃ¬Â§ÂÃ¬ÂÂ´ÃªÂ¸Â° **/
		function wordsMove() {
			lifeShow(life);
			for (var i = 0; i < onDiv.length; i++) {
				if (onDiv[i] == "")
					continue;
				var speed = Math.round(Math.random() * 20) + 1;
				onDiv[i].style.top = (parseInt(onDiv[i].style.top + 1000) + speed)
						+ "px";
				console.log(onDiv[i].style.top);
				if (parseInt(onDiv[i].style.top) > 550) {
					onDiv[i].style.display = "none";
					onDiv[i].style.top = "-10px";
					onDiv[i] = "";
					life--;
					console.log("깍인 라이프       " + life);
					document.getElementById("life").value = life;
				}
				
			}
			if (endCnt % 2 == 0) {
				tajaStart.style.display = "none";
			} else {
				setTimeout(wordsMove, movTime);
				tajaStart.value = "시작";
				tajaStart.style.display = "none";
			}
		}
		/** 2ÃªÂ°Â Ã­ÂÂ¨Ã¬ÂÂ Ã­ÂÂ¸Ã¬Â¶Â **/
		function tajaGoGo() {
			endCnt++;
			tajaTyping.focus();
			wordsManufacture();
			wordsMove();
		}
		/** Ã¬ÂÂÃ­ÂÂ°Ã­ÂÂ¤ Ã¬ÂÂÃ«Â Â¥ Ã«ÂÂÃ¬ÂÂÃ¬ÂÂ Ã«ÂÂ Ã¬Â²ÂÃ«Â¦Â¬**/
		function wordsCheck(evt) {
			var wordAnswer = tajaTyping.value;
			if (evt.keyCode == 13) {
				for (var i = 0; i < onDiv.length; i++) {
					if (onDiv[i] == "")
						continue;
					if (onDiv[i].innerHTML == wordAnswer) {
						onDiv[i].style.display = "none";
						onDiv[i].style.top = "-10px";
						onDiv[i] = "";
						score += 10;
						document.getElementById("aaa").innerHTML = score;
					}
				}
				tajaTyping.value = "";
			}
		}

		function scoreCounter(target_frame, target_number) {
			this.count = 0;
			this.diff = 0;
			this.target_count = parseInt(target_number);
			this.target_frame = document.getElementById(target_frame);
			this.counter();
		};
		scoreCounter.prototype.counter = function() {
			var self = this;
			this.diff = this.target_count - this.count;
		}

		new scoreCounter("aaa", score);

		/**Taja Ã«Â°Â°Ã¬ÂÂ´ Ã«Â§ÂÃ­ÂÂ¼ div Ã­ÂÂÃªÂ·Â¸ Ã«Â§ÂÃ«ÂÂ¤ÃªÂ³Â ,
		Ã¬ÂÂÃ¬ÂÂ Ã­ÂÂ´Ã«Â¦Â­ÃªÂ³Â¼, Ã¬ÂÂÃ­ÂÂ°Ã­ÂÂ¤ Ã¬ÂÂÃ«Â Â¥ Ã¬ÂÂ´Ã«Â²Â¤Ã­ÂÂ¸ Ã­ÂÂ¨Ã¬ÂÂÃ¬ÂÂ Ã¬ÂÂ°ÃªÂ²Â° **/
		function tajaInit() {
			var movDiv = "";
			for (var i = 0; i < Taja.length; i++) {
				movDiv = movDiv
						+ "<DIV id=juju"
						+ i
						+ " class=juju2 style='position:absolute;left:30px;top:250px;width:50px;height:22px;"
						+ "'>"
						+ Taja[i] + "</div>"; // Ã¬ÂÂÃ­ÂÂÃ«ÂÂ Ã¬Â£Â¼Ã¬Â Â Ã¬ÂÂ Ã­ÂÂÃ­ÂÂ Ã«ÂÂ Ã«Â°ÂÃªÂ¾Â¸Ã«ÂÂ Ã«Â¶ÂÃ«Â¶Â
			}
			tajaBackground.innerHTML = movDiv;
			tajaStart.onclick = tajaGoGo;
			tajaTyping.onkeypress = wordsCheck;
		}

		///////////////////////////////////////////////////
		function newDivInit() {
			var _newDiv = "";
			for (var i = 0; i < Taja.length; i++) {
				_newDiv = _newDiv
						+ "<DIV id=temp"
						+ i
						+ " style='position:absolute;left:30px;top:250px;width:50px;height:22px;"
						+ "background-color:#fff;z-index:1; color:#000;display:none;"
						+ " text-align:center; padding: 3px; border:1px solid #0000ff;"
						+ "font-weight:bold; box-shadow:1px 1px 3px rgba(0,0,0,0.5);'>"
						+ Taja[i] + "</div>"; // Ã¬ÂÂÃ­ÂÂÃ«ÂÂ Ã¬Â£Â¼Ã¬Â Â Ã¬ÂÂ Ã­ÂÂÃ­ÂÂ Ã«ÂÂ Ã«Â°ÂÃªÂ¾Â¸Ã«ÂÂ Ã«Â¶ÂÃ«Â¶Â
			}
		}
		/** Ã«Â¡ÂÃ«ÂÂ©Ã«ÂÂÃ«Â©Â´ Ã¬ÂÂÃ«ÂÂÃ¬ÂÂ¼Ã«Â¡Â tajaInit Ã­ÂÂ¨Ã¬ÂÂ Ã­ÂÂ¸Ã¬Â¶Â **/
		window.onload = tajaInit;
	</script>

	</script>
	<div id="game_explain">
<h3>게임 안내</h3>
<div>프로그래밍 단어들을 입력하면서 쉽게 언어를 익힐 수 있는 산성비 게임입니다.</div>
<hr>
<h3>게임방법</h3>
<div>1. 시작버튼을 누릅니다.<br>
2. 단어가 다 떨어지기전에 단어를 입력합니다.<br>
3. 목숨이 0이되면 게임이 종료됩니다.
</div>
</div>
	
		  <div id="tajaMain_div"><a href="taja.do"><h1>산성비 게임</h1></a><hr></div>
	<div class="container" id="tajaMain">
		<!-- <div
			style="position: fixed; width: 610px; height: 10px; background: #000; top: 0px; z-index: 10;"></div> -->
		<div class="TajaBack" id="tajaBackground"></div>

		<div class="TajaControl">
		
			<div id="start"> <input type=button id="tajaStart" value="START" class="btn btn--sm btn--green"> 
			<input type=text id="tajaTyping" size="20" class="form-control">
			</div>	
		</div>
	</div>
	<div id="disp"></div>
	
	<div id="score">
	<table id="score_table">
	<tr id="score_tr">
		<td id="score_text">
			SCORE
		</td>
		<td>
			<div id="aaa" type="submit">0</div>
		</td>	
	</tr>
	<tr>
		<td id="life_text">	
			남은 목숨
		</td>
		<td>
			<div id="life">3</div>
		</td>	
	</tr>

	</table>
	<button class="btn btn--sm btn--green"><a href="">다시 시작하기</a></button>
	</div>
	</div>
</body>
</html>