<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="curri_detail" class="curri_detail margin-large">
		
		<dl class="curri_detail_row">
			<dd class="curri_detail_data">${dto.curri_content}</dd>
		</dl>
	
	</div>
	<hr>
	<div>
	<input type="button" value="목록"
						onclick="window.location.href='list_curri.do' ">
	</div>
</fieldset>
</body>
</html>