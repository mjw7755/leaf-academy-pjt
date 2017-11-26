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
	#t_notice_div{
		width:600px;
		float:left;
		margin-left: 30px;
	}
	#t_notice_div a{
		text-decoration: none;
		color:#000;
	}
	#t_notice_div hr{
		border: thin solid;
		border-color: #cccccc;
	}
/* table */

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
/*  */
#tnoticeDIV {
    height: 320px;
    width: 600px;
    float: left;
    overflow: auto;
}
#tnotice_table{
	border-collapse: collapse;
}
#tnotice_table td{
	width: 100%;
	padding-left: 20px;
	padding-top: 20px;
	padding-bottom: 10px;
	font-weight: bold;
	border-bottom: 1px solid #cccccc;
}
#tnotice_table td a{
	color:#21307a;
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
<div id="t_notice_div">
<a href="tnotice_list.do"><h1>강사님 공지사항</h1></a>
<hr>

	<br><div id="tnoticeDIV">
		<table id="tnotice_table">
		<c:forEach items="${list}" var="list">
			<tr>
				<td><a href="#" onclick="detail(event)" data-needpopup-show="#tnoticeDetail" name="content_${list.tnotice_id}">＊ ${list.tnotice_title}</a></td>
				<td><input id="content_${list.tnotice_id}" type="hidden" value="${list.tnotice_content}"/></td>
			</tr>
		</c:forEach>
		</table>
	</div>
	<div id="tnoticeDetail" class="needpopup"></div>
	<div align="center" id="page">
      <c:if test="${param.page>5}">
      <c:if test="${flag == 'list'}">
         <a class="button btn-prev" href="tnotice_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="button btn-prev" href="tnotice_search.do?page=${startPage-1}&keyvalue=${keyvalue}">이전</a>
      </c:if>
      </c:if>
      
   <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+i}" >${startPage+i}</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+i}&keyvalue=${keyvalue}">${startPage+i}</a>
      </c:if>
      </c:if>
   </c:forEach>
   
      <c:if test="${countPage>=startPage+5}">
      <c:if test="${flag == 'list'}">
         <a class="strong" href="tnotice_list.do?page=${startPage+5}">다음</a>
      </c:if>
      <c:if test="${flag == 'search'}">
         <a class="strong" href="tnotice_search.do?page=${startPage+5}&keyvalue=${keyvalue}">다음</a>
      </c:if>
      </c:if>
   </div>
</div>	
</body>
</html>