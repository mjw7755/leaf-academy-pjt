<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function(){
		$("#application").click(function(){
			var sessionid = "${sessionScope.sessionid}";
			
			if(sessionid == ""){
				alert("로그인이 필요한 서비스 입니다.");
				location.href="loginForm.do";
			}else{
				location.href
			}
		});
	});
</script>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#detail{
	width: 800px;
}
#detail hr{
	border: thin solid #cccccc;
}
/*  */
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
/*  */
#detail_table th{
    /* border-top: 1px solid; */
    border-bottom: 1px solid #cccccc;
    padding-top: 15px;
    padding-bottom: 15px;
    background-color: #f4f3f1;
}
#detail_table td{
	border-bottom: 1px solid #cccccc;
	height: 50px;
	text-align: center;
}
#detail_table{
	margin-bottom: 20px;
	border-collapse: collapse;
	width:800px;
}
</style>

<body>
  	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_curri.png">
   		</div>
   	</div>
   	    <div id="detail">
	<h1>
	<div>${curri_subject}</div>
	</h1>
<hr>
</div>
		
	<input type="hidden" name="curri_id" value="${curri_id }">
	<table id="detail_table">
		<tr>
			<th>클래스명</th>
			<th>수강기간</th>
			<th>강의레벨</th>
			<th>강사명</th>
			<th>수강시간</th>
			<th>수강인원</th>
			<th>수강료</th>
			<th>수강신청</th>
		</tr>
		<c:forEach items="${list }" var="list" varStatus="status">
				<tr onclick="test(this)">
					<td>${list.lect_name}</td>
					<td>${list.lect_start_day}~ ${list.lect_end_day }</td>
					<td>${list.curri_level }</td>
					<td>${list.member_id }</td>
					<td>${list.lect_start_time} <br>~${list.lect_end_time }</td>
					<td>${list.lect_person_num}</td>
					<td>${list.lect_charge }</td>
					<td>
					<c:if test="${sessionScope.sessionid != null }">
						<a
							href="listform_appli.do?lect_id=${list.lect_id}&curri_id=${list.curri_id}">
								<button id="application" class="btn2 btn-info">수강신청</button>
						</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		
		<%-- <c:forEach items="${dto }" var="dto" >
		<tr>
			<td>${dto.lect_start_day } ~ ${dto.lect_end_day}</td>
			<td>${dto.lect_name }</td>
			<td>${dto.member_id }</td>
			<td>${dto.lect_start_time } ~ ${dto.lect_end_time}</td>
			<td>${dto.curri_level}</td>
			<td>${dto.lect_person_num }</td>
		</tr>
		</c:forEach> --%>
	</table>
   	    <div id="detail">
	<h1>커리큘럼</h1>
<hr>
</div>

	<div id="curri_detail" class="curri_detail margin-large">
		<dl class="curri_detail_row">
			<dd class="curri_detail_data">${fn:replace(curri_content,crlf,'</br>')}</dd>
		</dl>
	
	</div>

	
	<div>
	<input type="button" value="목록"
						onclick="window.location.href='list_curri.do' " class="btn2 btn-info">
	</div>
	
	
</body>
</html>