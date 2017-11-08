<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%-- <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>
<html>
<head>
<title>답변 달기</title>
</head>
<body>
	<form action="replyok.do" >
	<table>
		
		
		<tr>
			<td>qna_title</td>
			<td>:</td>
			<td><input type="text" name="qna_title" value="re: ${dto.qna_title }" ></td>
		</tr>
		
		<tr>
			<td>qna_content</td>
			<td>:</td>
			<td><input type="text" name="qna_content" ></td>
		</tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="답변"> | 
        <input type="reset" value="취소">
        <input type="button" onClick="location.href='qna_list.do'" value="목록">
     </td>
  </tr>
</table>
<input type="hidden" name="qna_id" value="${dto.qna_id}">
<input type="hidden" name="qna_ref" value="${dto.qna_ref}">
<input type="hidden" name="qna_step" value="${dto.qna_step}">
<input type="hidden" name="qna_level" value="${dto.qna_level}">
</form>
</div>
<br><br>
<table><tr><td><tr><b>http://www.ojcedu.com</tr></td></tr></table>
</body>
</html>
