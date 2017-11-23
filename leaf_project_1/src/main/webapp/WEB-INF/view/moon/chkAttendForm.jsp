<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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


<c:forEach items="${dataMapList }" var="list" varStatus="status">
	  <body>
    <div id="piechart${status.index }" style="width: 900px; height: 500px;"></div>
  </body>
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
          title: '출결 현황';
        };
		
        var chart = new google.visualization.PieChart(document.getElementById('piechart${status.index }'));

        chart.draw(index, options);
      };
    </script>
</c:forEach>

<!-- <body>
    Table and divs that hold the pie charts
    <table class="columns">
      <tr>
        <td><div id="Sarah_chart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
      </tr>
    </table>
  </body>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load Charts and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Draw the pie chart for Sarah's pizza when Charts is loaded.
      google.charts.setOnLoadCallback(drawSarahChart);

      // Draw the pie chart for the Anthony's pizza when Charts is loaded.
      google.charts.setOnLoadCallback(drawAnthonyChart);
		
      
      
      // Callback that draws the pie chart for Sarah's pizza.
      function drawSarahChart() {
  
    	  var att = parseInt("${dataMapList.get(0).get('att')}");
          var abs = parseInt("${dataMapList.get(0).get('abs')}");
          var late = parseInt("${dataMapList.get(0).get('late')}");
          var el = parseInt("${dataMapList.get(0).get('el')}");

        // Create the data table for Sarah's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['출석', att],
          ['결석', abs],
          ['지각', late],
          ['조퇴', el]
        ]);

        // Set options for Sarah's pie chart.
        var options = {title:'How Much Pizza Sarah Ate Last Night',
                       width:400,
                       height:300};

        // Instantiate and draw the chart for Sarah's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
        chart.draw(data, options);
      }

      // Callback that draws the pie chart for Anthony's pizza.
      function drawAnthonyChart() {
    	  var att = parseInt("${dataMapList.get(1).get('att')}");
          var abs = parseInt("${dataMapList.get(1).get('abs')}");
          var late = parseInt("${dataMapList.get(1).get('late')}");
          var el = parseInt("${dataMapList.get(1).get('el')}");
        // Create the data table for Anthony's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
        	 ['출석', att],
             ['결석', abs],
             ['지각', late],
             ['조퇴', el]
        ]);

        // Set options for Anthony's pie chart.
        var options = {title:'How Much Pizza Anthony Ate Last Night',
                       width:400,
                       height:300};

        // Instantiate and draw the chart for Anthony's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
        chart.draw(data, options);
      }
    </script> -->

</html>