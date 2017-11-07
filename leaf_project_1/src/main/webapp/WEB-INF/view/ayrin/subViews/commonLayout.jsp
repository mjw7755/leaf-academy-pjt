<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">

	<!-- header 영역 -->
	<div class="header-div">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- content 영역 -->
	<div class="content-div">
		
		<tiles:insertAttribute name="content"/>
		
		<!-- leftMenu 영역 -->
		<tiles:insertAttribute name="leftMenu"></tiles:insertAttribute>
	</div>
	
	<!-- footer 영역 -->
	<div class="footer-div">
		<tiles:insertAttribute name="footer"/>
	</div>
	
</div>
</body>
</html>