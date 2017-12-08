<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/moon/Chart.bundle.js"></script>
<script type="text/javascript" src="js/moon/utils.js"></script>
<link rel="stylesheet" href="css/moon/Nwagon.css" type="text/css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <style type="text/css">
 .chk-inner-div{
 	width:300px;
 	margin-top:200px;
 }
 </style>
<!-- <script type="text/javascript">
	$(function(){
		var maxSize = '${fn:length(dataMapList)}';
		for(var i=1;i<maxSize;i++){
			$('.wrapper'+i).hide();		
		}
		
		$(".chkBtn").bind('click',function(){
			var btnId = $(this).attr('id');
				
			for(var i=0;i<maxSize;i++){
				if(i == btnId){
					$('.wrapper'+i).show();					
				}else {
					$('.wrapper'+i).hide();
				}
				
			}
			
		});
	});
</script> -->
</head>
<!-- top banner -->
<div class="chk-inner-div">
<c:if test="${lect_chk != null }">
	<body>
		듣고있는 강의가 없습니다.
	</body>
</c:if>

<c:if test="${lect_chk == null }">
<c:forEach items="${dataMapList }" var="list" varStatus="status">
	  <body>
    <div id="piechart${status.index }" style="width: 900px; height: 500px;"></div>
  </body>
  <div>
  	<table>
  		<tr>
  			<td>출석률 : </td><td><fmt:formatNumber value="${list.get('perAttd') }" pattern=".00"/></td>
  		</tr>
  		<tr>
  			<td>출석 : </td><td>${list.get('att') }</td>
  		</tr>
  		<tr>
  			<td>결석 : </td><td>${list.get('abs') }</td>
  		</tr>
  		<tr>
  			<td>지각 : </td><td>${list.get('late') }</td>
  		</tr>
  		<tr>
  			<td>조퇴 : </td><td>${list.get('el') }</td>
  		</tr>
  	</table>
  </div>
</c:forEach>

<c:forEach items="${dataMapList }" var="list" varStatus="status">
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
		var index = "${status.index }";
      function drawChart() {
		var att = parseInt("${list.get('att')}");
		var abs = parseInt("${list.get('abs')}");
		var el = parseInt("${list.get('el')}");
		var late = parseInt("${list.get('late')}");
		
        index = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['출석', att],
          ['결석', abs],
          ['지각', el],
          ['조퇴', late]
        ]);

        var options = {
          title: '${list.get("lect_name")} 출결 현황'
        };
		
        var chart = new google.visualization.PieChart(document.getElementById('piechart${status.index }'));

        chart.draw(index, options);
      }
    </script>
</c:forEach>
</c:if>
</div>

</html>