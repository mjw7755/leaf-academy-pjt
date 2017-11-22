<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>taja</title>

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
			newDiv.style.width = wordWidth + "px";
			newDiv.style.left = wordRanX + "px";
			newDiv.style.display = "inline";

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
						+ " style='position:absolute;left:30px;top:100px;width:50px;height:22px;"
						+ "background-color:#fff;z-index:1; color:#000;display:none;"
						+ " text-align:center; padding: 3px; border:1px solid #0000ff;"
						+ "font-weight:bold; box-shadow:1px 1px 3px rgba(0,0,0,0.5);'>"
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
						+ " style='position:absolute;left:30px;top:-30px;width:50px;height:22px;"
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
	<div class="container" id="tajaMain">
		<div
			style="position: fixed; width: 610px; height: 10px; background: #000; top: 0px; z-index: 10;"></div>
		<div class="TajaBack" id="tajaBackground"></div>
		<div class="TajaControl">
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<br> <input type=button id="tajaStart" value="시작"> <input
				type=text id="tajaTyping" size="20">
		</div>
	</div>
	점수 :
	<div id="aaa" type="submit">0</div> <!--  -->
	
	남은 목숨 : 
	<div id="life">3</div>

	</div>
</body>
</html>