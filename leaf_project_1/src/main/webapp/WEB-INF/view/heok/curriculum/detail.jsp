<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style type="text/css">
div {
	text-align: center;
	font-size: 20px;
}

</style>

<body>
<fieldset>
		<legend>
			<h3>강좌</h3>
		</legend>
		
	<input type="hidden" name="curri_id" value="${dto.curri_id }">
	<h1>
		<div style="font-style: italic;color :gold; font-size: 80px;">${dto.curri_subject}</div>
	</h1>
	<table style="border: thin;text-align: center; margin: auto;">
		<tr>
			<th colspan="2">수강기간</th>
				<td colspan="2">${dto.lect_start_day } ~ ${dto.lect_end_day}</td>
			<th>클래스명</th>
				<td>${dto.lect_name }</td>
			<th colspan="2">수강시간</th>
				<td colspan="2">${dto.lect_start_time } ~ ${dto.lect_end_time}</td>
				<td></td>
		</tr>
		<tr>
			<th>강사명<th>
				<td>${dto.member_id }</td>
				<td></td>
			<th>강의레벨</th>
				<td>${dto.curri_level}</td>
				<td></td>
			<th>수강인원</th>
				<td>${dto.lect_person_num }</td>
				<td></td>
		</tr>
	</table>
	<div id="curri_detail" class="curri_detail margin-large">
		
		<dl class="curri_detail_row">
			<dd class="curri_detail_data">${fn:replace(dto.curri_content,crlf,'</br>')}</dd>
		</dl>
	
	</div>
	<a href="listform_appli.do?lect_id=${list.lect_id}&curri_id=${list.curri_id}">
							<button id="application" class="btn2 btn-info">수강신청</button>
					</a>
	<hr>
	<div>
	<input type="button" value="목록"
						onclick="window.location.href='list_curri.do' ">
	</div>
</fieldset>
</body>
</html>