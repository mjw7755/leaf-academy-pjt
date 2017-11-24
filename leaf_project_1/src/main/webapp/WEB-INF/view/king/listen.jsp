<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label style="float: left;">강의 선택 : </label>
	<c:if test="${memberLevel==1}">
	<select id="studentSelect" onchange="studentSecletChange()" style="width:200px; float:left;">
			<c:forEach items="${classList}" var="classList">
					<option value="${classList.lect_id}">${classList.lect_name}</option>
			</c:forEach>
		</select>
		<div style="width:1000px; margin:0 auto;">
			<table>
				<tr>
					<td colspan="2">
						<table border="1" width="100%">
						<tr id="txtTable">
						<td><h1>Source Code</h1>
							<div id="txtDiv" name="txtDiv"
								style="width: 600px; height: 300px; border:solid;
								font-family: monaco; background-color:#212121;
								padding:10px; "></div>
						</td>
						</tr>
						<c:if test="${sessionScope.sessid != teacherid }">
						<tr>
							<td><button onclick="teacherCall()">도움요청</button></td>
						</tr>
						</c:if>
						</table>
					</td>
				</tr>		
			</table>
		</div>
	</c:if>
	<c:if test="${memberLevel==2}">
		<select id="teacherSelect" onchange="teachertSecletChange()" style="width:200px; float:left;">
			<c:forEach items="${classList}" var="classList">
					<option value="${classList.lect_id}">${classList.lect_name}</option>
			</c:forEach>
		</select>
		<button >쪽지</button>
		<button id="openButton" onclick="openClick()">강의실 열기</button>
		<table border="1">
			<tr id="txtTable">
			<td></td>
			<td><h1>Base Code</h1>
				<div id="txtDiv" name="txtDiv"
					style="width: 600px; height: 300px; border:solid;
					font-family: monaco; background-color:#212121;
					padding:10px;overflow-x:scroll;overflow-y:scroll;"></div>
			</td>
			<td>
				<button onclick="closeClass()">강의실 닫기</button>
			</td>
			</tr>
			<tr>
				<td width="120px">학생아이디</td>
				<td>Source Code</td>
				<td width="100px">도움요청</td>
			</tr>
		<c:forEach items="${studentList}" var="studentList">
			<tr>
				<td><button id="${studentList}" onclick="studentRoom(event)">${studentList}</button></td>
				<td><div id="txtDiv_${studentList}" name="txtDiv_${studentList}"
				style="width: 600px; height: 300px; border:solid;
				font-family: monaco; background-color:#212121;
				padding:10px;overflow-x:scroll;overflow-y:scroll;"></div></td>
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
		alert(ev.target.id);
		window.location.href='listening2.do?teacherid=${sessionScope.sessionid}&studentid='+ev.target.id;
	}

	$(function() {
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
						codingIndex = sum + row_cursor+1;
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
			"ws://192.168.0.126:8080/controller/coding-ws.do");
	
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
				if(data.callStudents!=null) {
					var callStudents = data.callStudents.substring(1,data.callStudents.length-1).split(", ");
					var callStudentsLength = callStudents.length;
					for(var i=0; i<callStudentsLength; i++) {
						document.getElementById("call_"+callStudents[i]).src = "resources/king/call.png";
					}
				}
			}
			break;
		case "connFalse":	
			alert("수업중인 강좌가 있습니다.");
			break;
		case "enter":	
			codingSend({
				type : "conn"
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
				codingColorCheck("");
				$("#cursor_"+(codingIndex-1)).show();
			} else {
				var tempCodeText = data.codes.substring(1,data.codes.length-1).split(", ");
				var tampLength = tempCodeText.length;
				var tempTags = "";
				codeText = "";
				var studentid = data.studentid + "_";
				
				for(var i=0; i<tampLength; i++) {
					tempTags = tempTags + "<span id='coding_"+studentid+i+"' style='color:white;'>"
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
</body>
</html>