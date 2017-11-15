<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#noticewriteTable {
   width: 800px;
   text-align: center;
}
#noticewriteTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
}
</style>
</head>
<body>
<br><br><br><br><br>
	<form action="notice_write.do" >
		<table id="noticewriteTable">		
			<tr>
				<td id="whqrp">제목 : </td>
				<td><input type="text" name="notice_title" style="width: 100%;"></td>
			</tr>		
			<tr>
				<td id="whqrp">내용 : </td>
				<td><textarea style="width: 100%; height:300px" name="notice_content" ></textarea></td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="button" value="취소" onclick="window.location.href='notice_list.do' ">
					<input type="reset" value="초기화">
					<input type="submit" value="추가">
				</td>
			</tr>
		</table>
	</form>
<br><br><br><br><br>
</body>
</html>