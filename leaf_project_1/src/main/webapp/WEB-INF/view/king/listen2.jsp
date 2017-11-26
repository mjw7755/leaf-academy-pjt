<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#listen{
		width:700px;
		float:left;
		margin-left: 30px;
	}
	#listen a{
		text-decoration: none;
		color:#000;
	}
	#listen hr{
		border: thin solid;
		border-color: #cccccc;
	}
	label{
		float:left;
		margin-right: 30px;
		margin-left:35px;
		font-weight: bold;
		font-size: 20px;
	}
	select {
    width: 250px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #1b7817;
    border: 2px solid #2b6728;
    border-radius: 3px;
}
/*  */
#txtDiv{
width: 600px; 
height: 350px; 
border:solid;
font-family: monaco; 
background-color:#212121;
padding:10px; 
overflow-x:auto;
overflow-y:auto;
margin-bottom: 20px;
text-align: left;
}
/*  */
#send{
	margin-top: 20px;
	text-align: right;
	margin-bottom: 20px;
}
#send button{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #21307a;
    margin-right: 5px;
    /* margin-top: 15px; */
    padding: 5px;
    border: 2px solid;
    border-radius: 4px;
    background-color: #fff;
}
#teacher_table{
	width: 700px;
}
#teacher_table th{
	background-color: #f4f3f1;
	border-top: 1px solid #cccccc;
	border-bottom: 1px solid;
	border-bottom-color: #cccccc;
	height: 50px;
}
#teacher_table td{
	text-align: center;
}
.txt{
	width: 500px;
}
/*  */
.btn {
        display: inline-block;
    border: none;
    border-radius: .3em;
    -webkit-box-shadow: inset 0 0 0 1px #323232, inset 0 -0.25em 0 #9f9e9e, 0 0.25em 0.25em #666666;
    /* box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05); */
    color: #000;
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
    background-color: #fff; }
.btn--green {
font-size: 1em; }
.btn--sm {
    font-size: 0.7em;
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
	margin-top: 30px;
}
/*  */
#source_code{
	float:left;
}
#help{
	text-align: right;
}
#codeDiv table{
	margin-left: 0px;
}
</style>
</head>
<body>
<%-- ${lect_id }, ${teacherid }, ${targetid } --%>
<div id="listen">
<a href="listen.do"><h1>강의 듣기</h1></a>
<hr>
	<c:if test="${memberLevel==1 or teacherid!=null}">
		<c:if test="${memberLevel==1}">
		<label>강의 선택 : </label>
		<select id="studentSelect" onchange="studentSecletChange()" style="width:200px; float:left;">
			<c:forEach items="${classList}" var="classList">
					<option value="${classList.lect_id}">${classList.lect_name}</option>
			</c:forEach>
		</select>
		</c:if>
		<div id="codeDiv" style="margin:0 auto;">
			<table>
				<tr>
					<td colspan="2">
						<table>
						<tr id="txtTable">
						<td><div id="source_code"><h1>Source Code</h1></div>
						<c:if test="${memberLevel==1}">
						<div id="help"><button onclick="teacherCall()"class="btn2 btn-info">도움요청</button></div>
						</c:if>
							<div id="txtDiv" name="txtDiv" class="txt"></div>
						</td>
						</tr>
						</table>
					</td>
				</tr>		
			</table>
		</div>
		<script>
			function studentSecletChange() {
				var lect_id = $("#studentSelect").val();
				window.location.href='listen.do?lect_id='+lect_id;
			}
		
			function teacherCall() {
				codingSend({
					type : "call",
					teacherid : "${teacherid}"
				});
			}
		
			function openClick() {
				codingSend({
					type : "login",
					lect_id : "${lect_id}",
					teacherid : "${teacherid}",
					targetid : "${targetid}"
				});
			}
			$(function () {
				if(${lect_id==-1}) {
					alert("수강중인 강좌가 없습니다");
					history.back();
				} else if(${teacherid == sessionScope.sessionid}) {
					codingStart();
				}
				$("#codeDiv").hide();
				
				if(${memberLevel==1}) {
					var optionObj = document.getElementById("studentSelect");
					var optionLength = optionObj.options.length;
					for(var i=0; i<optionLength; i++) {
						if (optionObj.options[i].value == "${lect_id}") {
							optionObj.options[i].selected = "selected";
						}
					}
				}
			});
		
			var txtDiv = document.getElementById('txtDiv');
			var codingIndex = 0;
			var codeText = "";
			var codeTextLength = 0;
			var row_length = new Array();
			var row_length_count = 0;
			var row_cursor = 0;
			var col_cursor = 0;
		
			var sessionid = "${sessionScope.sessionid}";
			//웹 소켓 객체를 저장할 변수를 선언
			var codingConn = new WebSocket(
					"ws://192.168.43.23:8080/controller/coding-ws.do");
			
			function codingSend(message) {
				//attach the other peer username to our messages
				message.name = sessionid;
				codingConn.send(JSON.stringify(message));
			}
			codingConn.onmessage = function(msg) {
				var data = JSON.parse(msg.data);
				switch (data.type) {
				case "enter":				
					codingSend({
						type : "login",
						lect_id : "${lect_id}",
						teacherid : "${teacherid}",
						targetid : "${targetid}"
					});
					break;
				case "coding":
					$("#codeDiv").show();
					var tempCodeText = data.codes.substring(1,data.codes.length-1).split(", ");
					codeText = "";
					codeTextLength = tempCodeText.length;
					var tempTags = "";
					col_cursor = 0;
					row_cursor = -1;
					var temp_length = 0;
					row_length_count = 0;
					
					for(var i=0; i<codeTextLength; i++) {
						tempTags = tempTags + "<span id='coding_"+i+"' class='codingColor'"
								+" onclick='indexChange(event)' style='color:white;'>"
								+tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", "&nbsp;&nbsp;&nbsp;&nbsp;")
								+"<img width='2px' height='15px' style='margin-left: 1px;' src='resources/king/cursor_white.gif' id='cursor_"+i+"' class='cursorCancle'/></span>";
						
						codeText = codeText + tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", " ").replace("<br>"," ");
						if(tempCodeText[i] == "<br>") {
							temp_length = 0;
							row_cursor = -1;
							col_cursor = col_cursor + 1;
							row_length_count = row_length_count+1;
							row_length[row_length_count] = temp_length;
						} else {
							row_cursor = row_cursor+1;
							temp_length = temp_length +1; 
							row_length[row_length_count] = temp_length;
						}
					}
					if(data.codingType=="back" && data.changeIndex<=codingIndex) {
						codingIndex = codingIndex-1;
					} else if(data.codingType=="del" && data.changeIndex<codingIndex) {
						codingIndex = codingIndex-1;
					} else if(data.codingType=="add" && data.changeIndex<=codingIndex) {
						codingIndex = codingIndex+1;
					}
					txtDiv.innerHTML = tempTags;
					$(".cursorCancle").hide();
					codingColorCheck();
					$("#cursor_"+(codingIndex-1)).show();
					break;
				case "classClose":
					alert("수업이 종료되었습니다.");
					break;
				case "openTrue":
					alert("수업이 진행중 입니다.");
					$("#openClick").show();
					$("#codeDiv").show();
					codingStart();
					break;
				default:
					break;
				}
			};
			
			function indexChange(ev) {
				var targetObj = ev.target;
				var targetIndex = parseInt(targetObj.id.substring(7));
				$(".cursorCancle").hide();
				$("#cursor_"+targetIndex).show();
				codingIndex = targetIndex+1;
				var sum = 0;
				var beforeSum = 0;
				for(var i=0; i<row_length_count+1; i++) {
					beforeSum = sum;
					sum = sum + row_length[i]+1;
					if(sum>codingIndex-1) {
						row_cursor = codingIndex-1-beforeSum;
						col_cursor = i;
						return;
					}
				}
			}
			
			function codingStart() {
				$(document).keydown(function(event) {
					var keyCode = event.keyCode;
					var key = event.key;
					var str = "";
					if ((keyCode >= 48 && keyCode <= 90) || (keyCode >= 96 && keyCode <= 109)
							|| keyCode >= 146 || keyCode==111  ) {
						if(key=="\"") str="aa";
						else if(key=="\\") str="qq";
						else str = key;
					} else {
						switch (keyCode) {
						case 13:
							str = "<br>";
							break;
						case 9:
							str = "tt";
							event.preventDefault();
							break;
						case 8:
							if(codingIndex<1) return;
								str = "back";
							break;
						case 46:
							if(codingIndex>=codeTextLength) return;
							str = "del";
							break;
						case 32:
							str = key;
							event.preventDefault();
							break;
						case 37:	//left
							if(codingIndex>1) {
								codingIndex = codingIndex-1;
								$(".cursorCancle").hide();
								$("#cursor_"+(codingIndex-1)).show();
							}
							var sum = 0;
							var beforeSum = 0;
							for(var i=0; i<row_length_count+1; i++) {
								beforeSum = sum;
								sum = sum + row_length[i]+1;
								if(sum>codingIndex-1) {
									row_cursor = codingIndex-1-beforeSum;
									col_cursor = i;
									return;
								}
							}
							return;
						case 38:	//up
							event.preventDefault();
							if(col_cursor>0) {
								var sum = 0;
								for(var i=0; i<col_cursor-1; i++) {
									sum = sum + row_length[i]+1;
								}
								col_cursor = col_cursor -1;

								if(row_cursor>row_length[col_cursor]) codingIndex = sum + row_length[col_cursor];
								else codingIndex = sum + row_cursor+1;
								
								$(".cursorCancle").hide();
								$("#cursor_"+(codingIndex-1)).show();
							}
							return;
						case 39:	//right
							if(codingIndex<codeTextLength) {
								codingIndex = codingIndex+1;
								$(".cursorCancle").hide();
								$("#cursor_"+(codingIndex-1)).show();
							}
							var sum = 0;
							var beforeSum = 0;
							for(var i=0; i<row_length_count+1; i++) {
								beforeSum = sum;
								sum = sum + row_length[i]+1;
								if(sum>codingIndex-1) {
									row_cursor = codingIndex-1-beforeSum;
									col_cursor = i;
									return;
								}
							}
							return;
						case 40:	//down
							event.preventDefault();
							if(col_cursor<row_length_count) {
								var sum = 0;
								for(var i=0; i<col_cursor+1; i++) {
									sum = sum + row_length[i]+1;
								}
								col_cursor = col_cursor +1;
								if(row_cursor>row_length[col_cursor]) codingIndex = sum + row_length[col_cursor];
								else codingIndex = sum + row_cursor+1;
								
								$(".cursorCancle").hide();
								$("#cursor_"+(codingIndex-1)).show();
							}
							return;
						}
					}
					
					if(str=="") return;
					codingSend({
						type : "coding",
						codingIndex : codingIndex,
						str : str,
						teacherid : "${teacherid}",
						targetid : "${targetid}"
					});
				});
			}
			
			function codingColorCheck() {
				$(".cursorCancle").css("color","black;");
				var ppp = -1;
				while(true) {
					ppp = codeText.indexOf("public ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","orange");
					}
				}
				var ppp = -1;
				while(true) {
					ppp = codeText.indexOf("private ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","orange");
					}
				}
				var ppp = -1;
				while(true) {
					ppp = codeText.indexOf("protected ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<9; i++) {
						$("#coding_"+(ppp+i)).css("color","orange");
					}
				}
				var ppp = -1;
				while(true) {
					ppp = codeText.indexOf("throws ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","orange");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("static ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","fuchsia");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("new ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<3; i++) {
						$("#coding_"+(ppp+i)).css("color","fuchsia");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("class ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","fuchsia");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("void ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("String ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("String[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<6; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("int ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<3; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("int[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<3; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("char ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("char[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("long ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("long[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("float ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("float[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("double ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("double[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("int ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<3; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("int[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<3; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("short ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("short[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<5; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("byte ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("byte[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<4; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("boolean ",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<7; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
				ppp = -1;
				while(true) {
					ppp = codeText.indexOf("boolean[",ppp+1);
					if(ppp == -1) break;
					for(var i=0; i<7; i++) {
						$("#coding_"+(ppp+i)).css("color","lime");
					}
				}
			}
		</script>
	</c:if>
	<c:if test="${memberLevel==2 and teacherid==null}">
	<label>강의 선택 : </label>
		<select id="teacherSelect" onchange="teachertSecletChange()" style="width:200px; float:left;">
			<c:forEach items="${classList}" var="classList">
					<option value="${classList.lect_id}">${classList.lect_name}</option>
			</c:forEach>
		</select>
		<div id="send">
			<button id="openButton" onclick="openClick()">강의실 열기</button>
		</div>
		<table id="teacher_table">
			<tr id="txtTable">
			<td colspan="2"><h1>Base Code</h1>
				<div id="txtDiv" name="txtDiv" class="txt"></div>
			</td>
			<td>
				<div id="send">
					<button onclick="closeClass()">강의실 닫기</button>
				</div>
			</td>
			</tr>
			<tr>
				<th width="500px">Source Code</th>
				<th width="95px">학생아이디</th>
				<th>도움요청</th>
			</tr>
		<c:forEach items="${studentList}" var="studentList">
			<tr>
				<td><div id="txtDiv_${studentList}" name="txtDiv_${studentList}" class="txt"
				style=" height: 300px; border:solid;
				font-family: monaco; background-color:#212121;
				padding:10px;overflow-x:auto;overflow-y:auto; text-align: left"></div></td>
				<td><button id="${studentList}" onclick="studentRoom(event)" class="btn btn--sm btn--green" >${studentList}</button></td>
				<td><img id="call_${studentList}" src="resources/king/callCancle.png"></td>
			</tr>
		</c:forEach>
		</table>
		<script>
	function studentRoom(ev) {
		codingSend({
			type : "callCancle",
			targetid : ev.target.id
		});
		window.location.href='listen.do?lect_id='+$("#teacherSelect").val()+'&teacherid=${sessionScope.sessionid}&studentid='+ev.target.id;
	}

	$(function() {
		$("#quick_banner").hide();
		if(${lect_id==-1}) {
			alert("개설 된 강좌가 없습니다");
			history.back();
		}
		$("#txtTable").hide();
		var optionObj = document.getElementById("teacherSelect");
		var optionLength = optionObj.options.length;
		for(var i=0; i<optionLength; i++) {
			if (optionObj.options[i].value == "${lect_id}") {
				optionObj.options[i].selected = "selected";
			}
		}
	});
	
	function teachertSecletChange() {
		var lect_id = $("#teacherSelect").val();
		window.location.href='listen.do?lect_id='+lect_id;
	}
	
	function openClick() {
		codingSend({
			type : "teacherLogin",
			openClass : $("#teacherSelect").val()
		});
	}
	
	function openClass() {
		$("#openButton").hide();
		$("#txtTable").show();
		
		$(document).keydown(function(event) {
			var keyCode = event.keyCode;
			var key = event.key;
			var str = "";
			if ((keyCode >= 48 && keyCode <= 90) || (keyCode >= 96 && keyCode <= 109)
					|| keyCode >= 146 || keyCode==111  ) {
				if(key=="\"") str="aa";
				else if(key=="\\") str="qq";
				else str = key;
			} else {
				switch (keyCode) {
				case 13:
					str = "<br>";
					break;
				case 9:
					str = "tt";
					event.preventDefault();
					break;
				case 8:
					if(codingIndex<1) return;
						str = "back";
					break;
				case 46:
					if(codingIndex>=codeTextLength) return;
					str = "del";
					break;
				case 32:
					str = key;
					event.preventDefault();
					break;
				case 37:	//left
					if(codingIndex>1) {
						codingIndex = codingIndex-1;
						$(".cursorCancle").hide();
						$("#cursor_"+(codingIndex-1)).show();
					}
					var sum = 0;
					var beforeSum = 0;
					for(var i=0; i<row_length_count+1; i++) {
						beforeSum = sum;
						sum = sum + row_length[i]+1;
						if(sum>codingIndex-1) {
							row_cursor = codingIndex-1-beforeSum;
							col_cursor = i;
							return;
						}
					}
					return;
				case 38:	//up
					event.preventDefault();
					if(col_cursor>0) {
						var sum = 0;
						for(var i=0; i<col_cursor-1; i++) {
							sum = sum + row_length[i]+1;
						}
						col_cursor = col_cursor -1;

						if(row_cursor>row_length[col_cursor]) codingIndex = sum + row_length[col_cursor];
						else codingIndex = sum + row_cursor+1;
						
						$(".cursorCancle").hide();
						$("#cursor_"+(codingIndex-1)).show();
					}
					return;
				case 39:	//right
					if(codingIndex<codeTextLength) {
						codingIndex = codingIndex+1;
						$(".cursorCancle").hide();
						$("#cursor_"+(codingIndex-1)).show();
					}
					var sum = 0;
					var beforeSum = 0;
					for(var i=0; i<row_length_count+1; i++) {
						beforeSum = sum;
						sum = sum + row_length[i]+1;
						if(sum>codingIndex-1) {
							row_cursor = codingIndex-1-beforeSum;
							col_cursor = i;
							return;
						}
					}
					return;
				case 40:	//down
					event.preventDefault();
					if(col_cursor<row_length_count) {
						var sum = 0;
						for(var i=0; i<col_cursor+1; i++) {
							sum = sum + row_length[i]+1;
						}
						col_cursor = col_cursor +1;
						if(row_cursor>row_length[col_cursor]) codingIndex = sum + row_length[col_cursor];
						else codingIndex = sum + row_cursor+1;
						
						$(".cursorCancle").hide();
						$("#cursor_"+(codingIndex-1)).show();
					}
					return;
				}
			}
			
			if(str=="") return;
			codingSend({
				type : "coding",
				codingIndex : codingIndex,
				str : str
			});
		});
		
		
	}
	
	function closeClass() {
		$("#openButton").show();
		$("#txtTable").hide();
		codingSend({
			type : "classClose",
			studentList : $(".student_id").text()
		});
		
		txtDiv.innerHTML="";
		
		$(document).keydown();
	}

	var txtDiv = document.getElementById('txtDiv');
	var codingIndex = 0;
	var codeText = "";
	var codeTextLength = 0;
	var row_length = new Array();
	var row_length_count = 0;
	var row_cursor = 0;
	var col_cursor = 0;

	var sessionid = "${sessionScope.sessionid}";
	//웹 소켓 객체를 저장할 변수를 선언
	var codingConn = new WebSocket(
			"ws://192.168.43.23:8080/controller/coding-ws.do");
	
	function codingSend(message) {
		//attach the other peer username to our messages
		message.name = sessionid;
		codingConn.send(JSON.stringify(message));
	}
	codingConn.onmessage = function(msg) {
		var data = JSON.parse(msg.data);
		switch (data.type) {
		case "opening":	
			if(data.openClass==$("#teacherSelect").val()) {
			openClass();
				var callStudents = data.callStudents.substring(1,data.callStudents.length-1).split(", ");
				var callStudentsLength = callStudents.length;
				if(callStudents[0]!="") {
					for(var i=0; i<callStudentsLength; i++) {
						document.getElementById("call_"+callStudents[i]).src = "resources/king/call.png";
					}
				}
				
				var studentListSize = "${studentList.size()}";
				
				var tempCodeText;
				var tampLength;
				var tempTags;
				
				var studentsCode = data.studentsCode.split("`+!_@)#(");
				var tempstudentList = ${studentList};
				
				for(var i=1; i<studentListSize+1; i++) {
					tempstudentid = tempstudentList[i-1].id;
					tempCodeText = studentsCode[i].substring(1,studentsCode[i].length-1).split(", ");
					tampLength = tempCodeText.length;
					tempTags = "";
					codeText = "";
					
					for(var j=0; j<tampLength; j++) {
						tempTags = tempTags + "<span style='color:white;'>"
								+tempCodeText[j].replace("qq","\\").replace("aa","\"").replace("tt", "&nbsp;&nbsp;&nbsp;&nbsp;")
								+"</span>";
						codeText = codeText + tempCodeText[j].replace("qq","\\").replace("aa","\"").replace("tt", " ").replace("<br>"," ");
					}
					var tempDiv = document.getElementById("txtDiv_"+tempstudentid);
					tempDiv.innerHTML = tempTags;
					
					codingColorCheck(tempstudentid);
				}
			}
			break;
		case "connFalse":	
			alert("수업중인 강좌가 있습니다.");
			break;
		case "enter":	
			codingSend({
				type : "conn",
				studentList : "${studentList}"
			});
			break;
		case "coding":
			if(data.studentid==null) {
				var tempCodeText = data.codes.substring(1,data.codes.length-1).split(", ");
				codeText = "";
				codeTextLength = tempCodeText.length;
				var tempTags = "";
				col_cursor = 0;
				row_cursor = -1;
				var temp_length = 0;
				row_length_count = 0;
				
				for(var i=0; i<codeTextLength; i++) {
					tempTags = tempTags + "<span class='codingColor'"
							+" onclick='indexChange(event)' style='color:white;'>"
							+tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", "&nbsp;&nbsp;&nbsp;&nbsp;")
							+"<img width='2px' height='15px' style='margin-left: 1px;' src='resources/king/cursor_white.gif' id='cursor_"+i+"' class='cursorCancle'/></span>";
					
					codeText = codeText + tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", " ").replace("<br>"," ");
					if(tempCodeText[i] == "<br>") {
						temp_length = 0;
						row_cursor = -1;
						col_cursor = col_cursor + 1;
						row_length_count = row_length_count+1;
						row_length[row_length_count] = temp_length;
					} else {
						row_cursor = row_cursor+1;
						temp_length = temp_length +1; 
						row_length[row_length_count] = temp_length;
					}
				}
				
				if(data.codingType=="back" && data.changeIndex<=codingIndex) {
					codingIndex = codingIndex-1;
				} else if(data.codingType=="del" && data.changeIndex<codingIndex) {
					codingIndex = codingIndex-1;
				} else if(data.codingType=="add" && data.changeIndex<=codingIndex) {
					codingIndex = codingIndex+1;
				}
				
				txtDiv.innerHTML = tempTags;
				
				$(".cursorCancle").hide();
				codingColorCheck("");
				$("#cursor_"+(codingIndex-1)).show();
			} else {
				var tempCodeText = data.codes.substring(1,data.codes.length-1).split(", ");
				var tampLength = tempCodeText.length;
				var tempTags = "";
				codeText = "";
				var studentid = data.studentid;
				
				for(var i=0; i<tampLength; i++) {
					tempTags = tempTags + "<span style='color:white;'>"
							+tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", "&nbsp;&nbsp;&nbsp;&nbsp;")
							+"</span>";
					codeText = codeText + tempCodeText[i].replace("qq","\\").replace("aa","\"").replace("tt", " ").replace("<br>"," ");
				}
				
				var tempDiv = document.getElementById("txtDiv_"+data.studentid);
				tempDiv.innerHTML = tempTags;
				
				codingColorCheck(studentid);
			}
			
			break;
		case "leave":
			break;
		case "call":
			document.getElementById("call_"+data.studentid).src = "resources/king/call.png";
			break;
		default:
			break;
		}
	};
	
	function indexChange(ev) {
		var targetObj = ev.target;
		var targetIndex = parseInt(targetObj.id.substring(7));
		$(".cursorCancle").hide();
		$("#cursor_"+targetIndex).show();
		codingIndex = targetIndex+1;
		var sum = 0;
		var beforeSum = 0;
		for(var i=0; i<row_length_count+1; i++) {
			beforeSum = sum;
			sum = sum + row_length[i]+1;
			if(sum>codingIndex-1) {
				row_cursor = codingIndex-1-beforeSum;
				col_cursor = i;
				return;
			}
		}
	}
	
	function codingColorCheck(name) {
		$(".cursorCancle").css("color","black;");
		var ppp = -1;
		while(true) {
			ppp = codeText.indexOf("public ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","orange");
			}
		}
		var ppp = -1;
		while(true) {
			ppp = codeText.indexOf("private ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","orange");
			}
		}
		var ppp = -1;
		while(true) {
			ppp = codeText.indexOf("protected ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<9; i++) {
				$("#coding_"+name+(ppp+i)).css("color","orange");
			}
		}
		var ppp = -1;
		while(true) {
			ppp = codeText.indexOf("throws ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","orange");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("static ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","fuchsia");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("new ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<3; i++) {
				$("#coding_"+name+(ppp+i)).css("color","fuchsia");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("class ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","fuchsia");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("void ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("String ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("String[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<6; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("int ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<3; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("int[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<3; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("char ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("char[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("long ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("long[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("float ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("float[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("double ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("double[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("int ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<3; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("int[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<3; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("short ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("short[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<5; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("byte ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("byte[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<4; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("boolean ",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<7; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
		ppp = -1;
		while(true) {
			ppp = codeText.indexOf("boolean[",ppp+1);
			if(ppp == -1) break;
			for(var i=0; i<7; i++) {
				$("#coding_"+name+(ppp+i)).css("color","lime");
			}
		}
	}
</script>
	</c:if>
	</div>
</body>
</html>