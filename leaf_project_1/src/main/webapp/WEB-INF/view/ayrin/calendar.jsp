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
	var calendar = $('#calendar').fullCalendar({
		header: {
			left: 'prev, next today', //왼쪽버튼 순서 : 이전달(prev), 다음달(), 오늘(이번달)로 이동하는 기능
			center: 'title', //가운데 타이틀 : 현재 출력된 월(title)
			right: 'month,agendaWeek,agendaDay' //오른쪽 버튼 순서 : 날짜를 보는 기간(월,주,일)을 지정
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
				start: new Date(y, m, d-3, 18, 0),
				allDay: false
			},
			{
				id: 999,
				title: '04 Repeating Event',
				start: new Date(y, m, d+4, 19, 0),
				allDay: true
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