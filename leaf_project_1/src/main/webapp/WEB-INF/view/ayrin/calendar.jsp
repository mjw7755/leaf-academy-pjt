<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='css/ayrin/fullcalendar.css' />
<script type="text/javascript" src='js/ayrin/jquery.min.js'></script>
<script src='js/ayrin/jquery-ui.min.js'></script>
<script src='js/ayrin/moment.min.js'></script>
<script src='js/ayrin/fullcalendar.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>fullcalendar</title>
<script type="text/javascript">
$(document).ready(function() {
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	alert('나와라');
	var calendar = $('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		
		selectable: true,
		selectHelper: true,
		select: function(start, end, allDay) {
			
			var title = prompt('일정을 입력하세요.');
			if (title) {
			
				calendar.fullCalendar('renderEvent',
					{
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
			}
			calendar.fullCalendar('unselect');
			
		},
		editable: true,
		events: [
			{
				title: '01 All Day Event',
				start: new Date(y, m, 1)
			},
			{
				title: '02 Long Event',
				start: new Date(y, m, d-5),
				end: new Date(y, m, d-2)
			},
			{
				id: 999,
				title: '03 Repeating Event',
				start: new Date(y, m, d-3, 16, 0),
				allDay: false
			},
			{
				id: 999,
				title: '04 Repeating Event',
				start: new Date(y, m, d+4, 16, 0),
				allDay: false
			},
			{
				title: '05 Meeting',
				start: new Date(y, m, d, 10, 30),
				allDay: false
			},
			{
				title: '06 Lunch',
				start: new Date(y, m, d, 12, 0),
				end: new Date(y, m, d, 14, 0),
				allDay: false
			},
			{
				title: '07 Birthday Party',
				start: new Date(y, m, d+1, 19, 0),
				end: new Date(y, m, d+1, 22, 30),
				allDay: false // 주간의 나타남, true 나타나지않음
			},
			{
				title: '08 Click for Google',
				start: new Date(y, m, 28),
				end: new Date(y, m, 29),
				url: 'http://google.com/'
			}
		]
	});	
});
</script>
<style type='text/css'>

	/* body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}  */

	#calendar {
		width: 700px;
		margin: 0 auto;
		}

</style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>