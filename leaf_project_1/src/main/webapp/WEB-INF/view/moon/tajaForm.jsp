<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
    /* height: 300px; */
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
    color: #16688e;
    margin-left: 5px;
    margin-right: 5px;
    margin-bottom: 10px;
}
/*  */
.zt-skill-bar1 {
	color: #fff;
	font-size: 11px;
	line-height: 25px;
	height: 25px;
	width: 250px;
	margin-bottom: 5px;
	background-color: rgba(0, 0, 0, 0.1);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-ms-border-radius: 2px;
	border-radius: 2px;
}

.zt-skill-bar1 * {
	webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.zt-skill-bar1 div {
	background-color: #ffc600;
	position: relative;
	padding-left: 25px;
	width: 0;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-ms- border-radius: 2px;
	border-radius: 2px;
}

.zt-skill-bar1 span {
	display: block;
	position: absolute;
	right: 0;
	top: 0;
	height: 100%;
	padding: 0 5px 0 10px;
	background-color: #1a1a1a;
	-webkit-border-radius: 0 2px 2px 0;
	-moz-border-radius: 0 2px 2px 0;
	-ms-border-radius: 0 2px 2px 0;
	border-radius: 0 2px 2px 0;
}

.zt-skill-bar1 span:before {
	content: "";
	position: absolute;
	width: 6px;
	height: 6px;
	top: 50%;
	left: -3px;
	margin-top: -3px;
	background-color: #1a1a1a;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}

/* --- */
.zt-skill-bar2 {
	color: #fff;
	font-size: 11px;
	line-height: 25px;
	height: 25px;
	width: 250px;
	margin-bottom: 5px;
	background-color: rgba(0, 0, 0, 0.1);
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-ms-border-radius: 2px;
	border-radius: 2px;
}

.zt-skill-bar2 * {
	webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
}

.zt-skill-bar2 div {
	background-color: #ffc600;
	position: relative;
	padding-left: 25px;
	width: 0;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	-ms- border-radius: 2px;
	border-radius: 2px;
}

.zt-skill-bar2 span {
	display: block;
	position: absolute;
	right: 0;
	top: 0;
	height: 100%;
	padding: 0 5px 0 10px;
	background-color: #1a1a1a;
	-webkit-border-radius: 0 2px 2px 0;
	-moz-border-radius: 0 2px 2px 0;
	-ms-border-radius: 0 2px 2px 0;
	border-radius: 0 2px 2px 0;
}

.zt-skill-bar2 span:before {
	content: "";
	position: absolute;
	width: 6px;
	height: 6px;
	top: 50%;
	left: -3px;
	margin-top: -3px;
	background-color: #1a1a1a;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
}


.tajaStartDIV {
	height:350px;
	width:800px;
	/* position:relative; */
	background:url("resources/타자연습 배경화면1.PNG") no-repeat;
	display:none;
	text-align: left;
	padding-left: 10px;
	padding-top: 10px;
	padding-right: 10px;
}
#tajaDIV{
	float:left;
	width: 500px;
	font-weight: bold;
}
.zt-span6{
	width:300px;
	float:left;
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
#inputText0, #inputText1, #inputText2,  #inputText3, #inputText4{
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
	margin-bottom: 5px;
	margin-top: 5px; 
}
/*  */
/* #file{
	width: 800px;
	margin-top: 40px;
} */
/*  */
#taja_table{
	width: 150px;
}
#time{
	float: left;
	padding-right: 5px;
}
#minText{
	float:left;
	padding-right: 5px;
}
</style>


</head>
<body>
<div id="five"><a href="fir_index.do"><h1>타자연습</h1></a><hr></div>

<div id="game_explain">
<h3>게임 안내</h3>
<div>타자연습입니다. 타자속도를 향상시키고, <br>코딩 기본구문을 익힐 수 있습니다.</div>
<hr>
<h3>게임방법</h3>
<div>1. 시작버튼을 누릅니다.<br>
2. 화면에 있는 구문을 따라 입력합니다.<br>
※ 단어가 틀릴 시 빨간색으로 표시됩니다.<br>
</div>
</div>

<button class="btn btn--sm btn--green" onclick="startTaja()">start</button>

<div class="tajaStartDIV">
	<table id="taja_table">
		<tr>
			<td><div id="time">TIME :</div> 
				<div style="display: none;" id="minText">
					<sapn id="min"></sapn>
					<span>분</span>
				</div>
				<div>
					<span id="sec"></span><span>초</span>
				</div>
			</td>
		</tr>
		<tr>
			<div id="tajaDIV"></div>
			<div>
				<div class="zt-span6 last">
					<h3>
						<strong>진행률</strong>
					</h3>
					정확도
					<div class="zt-skill-bar1">
						<div class="data_width1" data-width="" style="">
							.<span class="per1"></span>
						</div>
					</div>
					<br> 현재타수
					<div class="zt-skill-bar2">
						<div class="data_width2" data-width="" style="">
							.<span class="per2"></span>
						</div>
					</div>
				</div>
		</tr>
	</table>
		</div>
<!-- 
	<div id="file">
				<input type="file" id="files" multiple />
	</div> -->


	<script type="text/javascript">
		var token = [ 'public void static main(String args[])',
				'implements WebSocketHandler', 'int i = 0; result i;',
				'sysout.out.println();', 'document.getElementById' ];
		var countS = 0;
		var countR = 0;
		var tokenLength = 0;
		var startTime;
		var endTime;
		var keyDownCount = 0;
		var timeCount = 0;
		var minCount = 0;
		var minText = document.getElementById("minText");
		var startInterval = setInterval(timer, 1000);

		function list(page) {
			location.href = "list.do?curPage=" + page
		}

		function startTaja() {
			printTime();
			$(".tajaStartDIV").show();
			$(".btn").hide();
			var tajaDIV = document.getElementById("tajaDIV");
			var str = '';
			var input = '';
			var plusLength = 0;

			for (var i = 0; i < token.length; i++) {

				for (var j = 0; j < token[i].length; j++) {
					if (0 < i) {
						str += '<span id="text' + (j + plusLength) + '">'
								+ token[i].charAt(j) + '</span>';
					} else {
						str += '<span id="text'+j+'">' + token[i].charAt(j)
								+ '</span>';
					}
				}
				plusLength = token[i].length + plusLength;
				if (i == token.length - 1) {
					str += '<br><input type="text" id="inputText' + i
							+ '" name="inputText' + i
							+ '" onkeyup="keyPress(this)" class="' + i
							+ '" onkeypress="onKeyDown(null,inputText' + i
							+ ')" style="width:400px"><br>';
				} else {
					str += '<br><input type="text" id="inputText' + i
							+ '" name="inputText' + i
							+ '" onkeyup="keyPress(this)" class="' + i
							+ '" onkeypress="onKeyDown(inputText' + (i + 1)
							+ ',inputText' + i + ')" style="width:400px"><br>';
				}
				tajaDIV.innerHTML = str;
			}

			$("#inputText0").focus();
		}

		function keyPress(e) {
			var maxNum = e.className;
			/* alert(e.value.length-1); */
			keyDownCount++;
			var plusLength = 0;
			if (keyDownCount == 1) {
				startTime = new Date();
			}
			//정확도
			/* for(var j=0;j<token[maxNum].length;j++){
			   	if(token[maxNum].charAt(j) == document.getElementById("inputText"+maxNum).value.charAt(j)){
					countR++;
				}
			}
			
			tokenLength += token[maxNum].length;
			result = (countR/tokenLength)*100; */

			//타자속도
			var curSec = $("#sec").text();
			var curMin = $("#min").text();

			if (curSec == "") {
				curSec = 0;
			}

			if (curMin == "") {
				curMin = 0;
			}

			if (token[maxNum].charAt(e.value.length - 1) == e.value
					.charAt(e.value.length - 1)) {
				countS++;
				if (event.keyCode == 8) {
					countS--;
				}
			}

			var typingSpeed;
			typingSpeed = countS / ((curMin * 60) + (curSec) * 60);
			console.log(typingSpeed);
			typingSpeed = Math.floor(typingSpeed);

			function dinamic_animated_contents() {

				$(".zt-skill-bar2 > div ").each(function(i) {

					$(this).css({
						'width' : typingSpeed / 10 + '%'
					});
					$(".per2").text(typingSpeed + '타');

				});
			}

			if (jQuery().appear) {
				$('.zt-skill-bar').appear().on('appear', function() {
					dinamic_animated_contents();
				});
			} else {
				dinamic_animated_contents();
			}

			for (var i = 0; i < token.length; i++) {

				for (var j = 0; j < token[i].length; j++) {
					if (document.getElementById("inputText" + i).value
							.charAt(j) != token[i].charAt(j)
							&& document.getElementById("inputText" + i).value
									.charAt(j) != '') {
						document.getElementById("text" + (j + plusLength)).style.color = "red";
						continue;
					} else {
						document.getElementById("text" + (j + plusLength)).style.color = "black";
					}
				}
				plusLength = token[i].length + plusLength;
			}

			for (var i = 0; i < token.length; i++) {
				if (document.getElementById("inputText" + i).value.length > token[i].length) {
					if (maxNum == token.length - 1
							&& document.getElementById("inputText" + maxNum).value.length > token[maxNum].length) {
						alert("타자게임이 종료되었습니다");
						document.getElementById("inputText" + maxNum).readOnly = true;
						countS = 0;
						countR = 0;
						tokenLength = 0;
						timeCount = 0;
						minCount = 0;
						clearInterval(startInterval);
						return;
					} else {
						document.getElementById("inputText" + i).readOnly = true;
						document.getElementById("inputText" + (i + 1)).focus();

						/* $(this).css({'width' : result + '%'});
						$(".per1").text(result.toFixed(2)+'%'); */

					}
				}
			}
			/* var inputText = document.getElementById("inputText"); 
			var tajaDIV = document.getElementById("tajaDIV");
			var innerText = document.createElement('p');
			innerText.text = "안녕하세요";
			innerText.id = "innertext";
			
			tajaDIV.appendChild(innerText);
			 */

		}

		function onKeyDown(next, thisobj) {
			var num = thisobj.className;

			if (event.keyCode == 13) {
				endTime = new Date();
				keyDownCount = 0;
				var resultTime = (endTime - startTime) / 1000;
				var typingSpeed;
				typingSpeed = (document.getElementById("inputText" + num).value.length * 60)
						/ resultTime;
				typingSpeed = Math.floor(typingSpeed);
				var plusLength = 0;

				function animated_contents() {
					var result = 0;
					var voidText = token[num].length - thisobj.value.length;
					/* 그래프 */
					for (var i = 0; i < voidText; i++) {
						thisobj.value += ' ';
					}

					$(".zt-skill-bar1 > div ")
							.each(
									function(i) {
										/* var $this  = $(this),
										    skills = $this.data('width'); */

										for (var j = 0; j < token[num].length; j++) {
											if (token[num].charAt(j) == document
													.getElementById("inputText"
															+ num).value
													.charAt(j)) {
												countR++;
											}
										}

										tokenLength += token[num].length;
										result = (countR / tokenLength) * 100;

										$(this).css({
											'width' : result + '%'
										});
										$(".per1")
												.text(result.toFixed(2) + '%');

									});

				}

				if (jQuery().appear) {
					$('.zt-skill-bar').appear().on('appear', function() {
						animated_contents();
					});
				} else {
					animated_contents();
				}

				/*  */

				if (num == token.length - 1) {
					alert("타자게임이 종료되었습니다");
					document.getElementById("inputText" + num).readOnly = true;
					countS = 0;
					countR = 0;
					tokenLength = 0;
					timeCount = 0;
					minCount = 0;
					clearInterval(startInterval);
				} else {
					next.focus();
				}

				thisobj.readOnly = true;

				/* if(thisobj.className-1 == token.length)  */

				if (thisobj.readOnly == true) {
					for (var j = 0; j < token[num].length; j++) {
						if (token[num][j] != thisobj.value.substr(j, 1)) {
							document.getElementById("text" + (j + (5 * num))).style.color = "red";
						} else {
							document.getElementById("text" + (j + (5 * num))).style.color = "black";
						}
						plusLength = token[i].length + plusLength;
					}

				}
			}

		}

		function printTime() {
			var clock = document.getElementById("clock");
			var now = new Date();
			startInterval;
		}
		
		function timer() {
			timeCount++;
			var sec = document.getElementById("sec");
			var min = document.getElementById("min");

			sec.innerHTML = timeCount;
			if (timeCount == 59) {
				minText.style.display = "block";
				minCount++;
				min.innerHTML = minCount;
				timeCount = 0;
			}
		}

		/* -------------------타자게임 관련 소스 종료----------- */

		/* 파일 업로드 소스 */

		function handleFileSelect(evt) {
			var files = evt.target.files;

			for (var i = 0, f; f = files[i]; i++) {

				var reader = new FileReader();

				reader.onload = (function(theFile) {
					return function(e) {

					}
				})
			}
		}
	</script>
</body>
</html>