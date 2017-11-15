<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<head>
<title>답변 달기</title>
<style type="text/css">
#qnareplyTable {
   width: 800px;
   text-align: center;
}
#qnareplyTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<br><br><br><br><br>
	<form action="replyok.do" >
	<table id="qnareplyTable">
		<tr>
			<td id="whqrp">제목 : </td><!-- qna_title -->
			<td><input type="text" name="qna_title" value="re: ${dto.qna_title }" style="width: 100%;"></td>
		</tr>		
		<tr>
			<td>내용 : </td><!-- qna_content -->
			<td><textarea style="width: 100%; height:300px" name="qna_content" ></textarea></td>
		</tr>
  		<tr>
	        <td colspan="2">
		    <c:if test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
		    <input type="submit" value="답변"> | 
		        <input type="reset" value="취소">
		    </c:if>    
		        <input type="button" onClick="location.href='qna_list.do'" value="목록">
     		</td>
 		 </tr>
	</table>
<input type="hidden" name="qna_id" value="${dto.qna_id}">
<input type="hidden" name="qna_ref" value="${dto.qna_ref}">
<input type="hidden" name="qna_step" value="${dto.qna_step}">
<input type="hidden" name="qna_level" value="${dto.qna_level}">
</form>
<br><br><br><br><br>
</body>
</html>
