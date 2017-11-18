<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/ayrin/needpopup.min.css">
<script src="js/ayrin/needpopup.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myclass</title>
<style type="text/css">
#notice {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
#chulcheck {
	height: 300px;
	width: 450px;
	border: 1px solid;
}
#grade {
	height: 300px;
	width: 100%;
	border: 1px solid;
}

a[data-needpopup-show] {
				display: inline-block;
				margin: 0 10px 10px 0;
				padding: 10px 15px;
				letter-spacing: 1px;
				text-decoration: none;
				color: #fff;
				background: #7B5207;
			  border-radius: 3px;
			  box-shadow: 0 1px 1px 1px rgba(0, 0, 0, 0.2);
			}

			p {
				font-size: 1.2em;
				line-height: 1.4;
				color: #343638;
				margin: 20px 0;
			}

			.needpopup {
			  border-radius: 6px;
			  box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
			}

			.needpopup p {
				margin: 0;
			}
			.needpopup p + p {
				margin-top: 10px;
			}
</style>
<script type="text/javascript">
/* $(function() {
	$("#noticeDetail").hide();
	$("#noticeModal").button();
	$("#noticeDetail").dialog({
        autoOpen : false,
        width : 600,
        modal : true,
        buttons : [ {
           text : "ok",
           click : function() {
              $(this).dialog("close");
              window.location.replace("notice_detail.do?notice_id=${param.notice_id}");
           }
        }
        ]
     });
	$("#noticeModal").click(function(e) {
	    $("#noticeDetail").dialog("open");
	});
}); */
needPopup.config.custom = {
		'removerPlace': 'outside',
		'closeOnOutside': false,
		onShow: function() {
			console.log('needPopup is shown');
		},
		onHide: function() {
			console.log('needPopup is hidden');
		}
	};
	needPopup.init();
function detail(ev) {
	document.getElementById("noticeDetail").innerHTML = "<p>"+document.getElementById(ev.target.name).value+"</p>";
}
</script>
</head>
<body>
<!-- member_level 학생일때 -->
<c:if test="${sessionScope.sessionid!='관리자'}">
	<select>
		<option value="class1" selected="selected">JAVA 기초 (상)</option>
		<option value="class2">JAVA 기초 (중)</option>
		<option value="class3">JAVA 기초 (하)</option>
	</select>
	<button >쪽지</button>
	<button onclick="window.location.href='listening.do'">강의 듣기</button><br>
	
	<div style="width:1000px; margin:0 auto;">
		<table>
			<tr>
				<td>
					<div id="notice">
						<table>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><a onclick="detail(event)" data-needpopup-show="#noticeDetail" name="content_${list.notice_id}">${list.notice_title}</a></td>
								<td><input id="content_${list.notice_id}" type="hidden" value="${list.notice_content}"/></td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</td>
				<td>
					<div id="chulcheck">출결 현황 (달력으로?)</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="grade">성적 현황</div>
				</td>
			</tr>		
		</table>
	</div>
</c:if>	

		<div id="noticeDetail" class="needpopup"></div>

<!-- member_level 강사일때 -->
<c:if test="${sessionScope.sessionid=='관리자'}">
	<select>
		<option value="class1" selected="selected">JAVA 기초 (상)</option>
		<option value="class2">JAVA 기초 (중)</option>
		<option value="class3">JAVA 기초 (하)</option>
	</select>
	<button >쪽지</button>
	<button onclick="window.location.href='listening.do'">강의 듣기</button><br>
	
	<div style="width:1000px; margin:0 auto;">
		<table>
			<tr>
				<td>
					<div id="notice">공지사항 게시판</div>
				</td>
				<td>
					<div id="chulcheck">평균, 우수학생 1~3랭킹</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="grade">학생List 및 체크박스 쪽지보내기</div>
				</td>
			</tr>		
		</table>
	</div>
</c:if>	
</body>
</html>