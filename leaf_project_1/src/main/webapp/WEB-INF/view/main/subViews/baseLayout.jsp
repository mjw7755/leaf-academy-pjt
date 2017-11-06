<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>

	<!-- title 영역 -->
	<tiles:getAsString name="title"/>
	
</title>

<!-- css 영역 -->
<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet">

<!-- js 영역 -->
<link href='<tiles:getAsString name="js"/>' type="text/css" rel="stylesheet">

</head>
<body>
<div class="wrapper">

	<!-- header 영역 -->
	<div class="header-div">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- content 영역 -->
	<div class="container-div">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<!-- footer 영역 -->
	<div class="footer-div">
		<tiles:insertAttribute name="footer"/>
	</div>
	
</div>
</body>
</html>