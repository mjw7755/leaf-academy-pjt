<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<!-- css 영역 -->
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet">

<!-- js 영역 -->
<link href='<tiles:getAsString name="js"/>' type="text/css"	rel="stylesheet">
<style type="text/css">
body{
	margin: 0;
	padding: 0;
}
</style>

</head>
<body>
	<div class="wrapper">
	<table width="100%">
	
		<tr height="100">
			<!-- header 영역 -->
				<td><tiles:insertAttribute name="header" /></td>
			
		</tr>
		
		<tr height="670" align="center">
			<!-- content 영역 -->
			<div class="container-div">
				<td><tiles:insertAttribute name="content" /></td>
			</div>
		</tr>
		
		<tr>
			<!-- footer 영역 -->
			<div class="footer-div">
				<td><tiles:insertAttribute name="footer" /></td>
			</div>
		</tr>
	</table>
		</div>
</body>
</html>