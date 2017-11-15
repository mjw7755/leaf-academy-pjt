<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#faqwriteTable {
   width: 800px;
   text-align: center;
}
#faqwriteTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<br><br><br><br>
<form action="faq_write.do" >
	<table id="faqwriteTable">
		<tr>
			<td id="whqrp">제목 : </td><!-- faq_title -->
			<td><input type="text" name="faq_title" style="width: 100%"></td>
		</tr>		
		<tr>
			<td>내용 : </td><!-- faq_content -->
			<td><textarea name="faq_content" style="width: 100%; height:300px"></textarea></td>
		</tr>	
		<tr>
			<td colspan="2">
				<input type="button" value="취소"  onclick="window.location.href='faq_list.do'">
				<input type="reset" value="초기화" >
				<input type="submit" value="추가" >
			</td>
		</tr>
	</table>
</form>
<br><br><br><br>
</body>
</html>