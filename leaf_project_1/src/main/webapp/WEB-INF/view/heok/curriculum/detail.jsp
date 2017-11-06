<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>
			기모딱
		</td>
	</tr>
</table>
<input type="hidden" name="curri_id" value="${dto.curri_id }">
<h3><div>${dto.curri_subject}</div></h3>
<div id="curri_detail" class="curri_detail margin-large">
		
		<dl class="curri_detail_row">
			<dd class="curri_detail_data">${dto.curri_content}</dd>
		</dl>
	
	</div>
</body>
</html>