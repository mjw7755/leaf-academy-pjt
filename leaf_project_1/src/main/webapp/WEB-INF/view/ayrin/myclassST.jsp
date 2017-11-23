<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/ayrin/needpopup.min.css">
<script src="js/ayrin/needpopup.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myclassST</title>
<style type="text/css">
#my_class{
	margin-top: 35px;
}
#tnoticeDIV {
	height: 320px;
	width: 550px;
	border: 1px solid;
	float:left;
}
/* table */
#menu {
   width: 200px;
   margin-left: 25%;
   float: left;
}
#menu tr {
   width: 150px;
}
#menu a {
   text-decoration: none;
   font-size: 13px;
   color: #5e5f5e;
}
/* mypage text */
#my_page_text {
   width: 100%;
   height: 150px;
   background-color: #1b7817;
   color: #fff;
   font-size: 25px;
   font-weight: bold;
   text-align: center;
}
/* 메뉴하위내용 */
#attendance, #grade, #lecture, #t_notice, #student_care {
   text-align: left;
   /* padding: 10px 0px 10px 10px; */
   padding-bottom: 10px;
   padding-left: 10px;
   padding-top: 10px;
   border-bottom: 1px solid;
   font-weight: 700;
   color: #949694;
}
#attendance :hover, #grade :hover, #lecture :hover, #t_notice :hover, #student_care :hover {
   color: #1b7817;
   font-weight: 900;
   height: 38px;
}
#attendance_icon, #grade_icon, #lecture_icon, #t_notice_icon, #student_care_icon {
   color: #1b7817;
   font-weight: bold;
   float: right;
   height: 100%;
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
<script>

$(function() {
	$("#lecture_icon").hide();
	$("#grade_icon").hide();
	$("#attendance_icon").hide();
	$("#t_notice_icon").hide();
	
	$("#tnoticeDetail").hide();
	
	$("#lecture").hover(function() {
	   $("#lecture_icon").show()
	}, function() {
	   $("#lecture_icon").hide();
	});
	$("#grade").hover(function() {
	   $("#grade_icon").show()
	}, function() {
	   $("#grade_icon").hide();
	});
	$("#attendance").hover(function() {
	   $("#attendance_icon").show()
	}, function() {
	   $("#attendance_icon").hide();
	});
	$("#t_notice").hover(function() {
	   $("#t_notice_icon").show()
	}, function() {
	   $("#t_notice_icon").hide();
	});
   
	/* $("#lecture").click(function() {
		alert("연결해야함");
	});
	$("#grade").click(function() {
		alert("연결해야함");
	});
	$("#attendance").click(function() {
		alert("연결해야함");
	}); 
	$("#t_notice").click(function() {
		$("tnoticeDIV").show();
	}); */
});


$(function() {
	$("#tnoticeDetail").dialog({
        autoOpen : false,
        width : 600,
        modal : true,
        buttons : [ {
           text : "ok",
           click : function() {
              $(this).dialog("close");
              window.location.replace("tnotice_detail.do?tnotice_id=${param.tnotice_id}");
           }
        }
        ]
     });
});
needPopup.config.custom = {
		'removerPlace': 'outside',
		'closeOnOutside': false,
	};
	needPopup.init();
function detail(ev) {
	document.getElementById("tnoticeDetail").innerHTML = "<p>"+document.getElementById(ev.target.name).value+"</p>";
}


</script>
</head>
<body>
	<select>
		<c:forEach items="${history}" var="history">
		<c:if test="${history.payment_pay_chk eq 1}">
		<c:if test="${sessionScope.sessionid == history.payment_member_id}">
			<option value="class1">${history.payment_lect_subject }</option>
		</c:if>
		</c:if>
		</c:forEach>
	</select>
	<button >쪽지</button>
	<button onclick="window.location.href='listening.do'">강의하기</button><br>

	<div id="tnoticeDIV">
		<table>
		<c:forEach items="${list}" var="list">
			<tr>
				<td><a onclick="detail(event)" data-needpopup-show="#tnoticeDetail" name="content_${list.tnotice_id}">${list.tnotice_title}</a></td>
				<td><input id="content_${list.tnotice_id}" type="hidden" value="${list.tnotice_content}"/></td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div id="tnoticeDetail" class="needpopup"></div>
	
</body>
</html>