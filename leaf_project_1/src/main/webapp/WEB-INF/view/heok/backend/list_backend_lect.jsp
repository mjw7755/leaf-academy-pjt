<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#listchange_select {
    width: 250px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #1b7817;
    border: 2px solid #2b6728;
    border-radius: 3px;
}
/*  */
#search{
   width: 800px;
   margin-top:20px;
   margin-bottom: 20px;
}
#search select{
   height: 21.2px;
}
#search form{
   font-size: 13px;
}
#search form input{
   font-size: 13px;
}
#search_icon{
   vertical-align: middle;
}
/*  */
</style>
</head>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function listChange(params) {
		var url = "list_backend_" + params.value + ".do";
		window.location.href = url;
	}
	
	function show1(str) {
		
		var s = str;
		$('.la_'+s).css("display", "none");
		$('.in_'+s).css("display", "block");
		
		$('#btn_update_by_display_yet_'+ s).css("display", "none");
		$('#btn_update_by_display_now_' + s).css("display", "block");
	}  
	
function show_update(str) {
		var s = str;
		
		var curri_id  = $('#in1_'+s).val();
		var lect_name  = $('#in2_'+s).val();
		var lect_person_num  = $('#in3_'+s).val();
		var lect_start_day  = $('#in4_'+s).val();
		var lect_end_day  = $('#in5_'+s).val();
		var lect_start_time  = $('#in6_'+s).val();
		var lect_end_time  = $('#in7_'+s).val();
		var lect_write_time  = $('#in8_'+s).val();
		var lect_modify_time  = $('#in9_'+s).val();
		var lect_charge  = $('#in10_'+s).val();
		var lect_accept  = $('#in11_'+s).val();
		var lect_open  = $('#in12_'+s).val();
		var enabled  = $('#in13_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_lecture.do',
            data:{
            	lect_id: s,
            	curri_id: curri_id,
            	lect_name: lect_name,
            	lect_person_num: lect_person_num,
            	lect_start_day: lect_start_day,
            	lect_end_day: lect_end_day,
            	lect_start_time: lect_start_time,
            	lect_end_time: lect_end_time,
            	lect_write_time: lect_write_time,
            	lect_modify_time: lect_modify_time,
            	lect_charge: lect_charge,
            	lect_accept: lect_accept,
            	lect_open: lect_open,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_lect.do';
               }
            }
         });
	}  

</script>

<body>
<div id="backend_page">
<h1>BACKEND PAGE</h1>
<hr>
</div>
	<select
		onchange="listChange(this);" id="listchange_select">
		<option value="curri">Curriculum </option>
		<option value="lect" selected="selected"> Lecture </option>
		<option value="member">Member</option>
		<option value="book">Book</option>
		<option value="faq">Faq</option>
		<option value="ja">Jageok</option>
		<option value="note">Note</option>
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
<div id="search">	
	<form action="search_backend_lect.do" method="post">
		<select name="column">
			<option value="lect_id">Lect-id</option>
			<option value="curri_id">Curri_id</option>
			<option value="lect_name">Lect-name</option>
			<option value="lect_person_num">Person-num</option>
			<option value="lect_start_day">Start-day</option>
			<option value="lect_end_day">End-day</option>
			<option value="lect_start_time">Start-time</option>
			<option value="lect_end_time">End-time</option>
			<option value="lect_write_time">Write-time</option>
			<option value="lect_modify_time">Modify-time</option>
			<option value="lect_charge">Charge</option>
			<option value="lect_accept">Accept</option>
			<option value="lect_open">open</option>
			<option value="enabled">Enabled</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table>
		<th>Lect-id</th>
		<th>Curri-id</th>
		<th>Lect-name</th>
		<th>Person-num</th>
		<th>Start-day</th>
		<th>End-day</th>
		<th>Start-time</th>
		<th>End-time</th>
		<th>Write-time</th>
		<th>Modify-time</th>
		<th>Charge</th>
		<th>Accept</th>
		<th>lect_open</th>
		<th>Enabled</th>
		<c:forEach items="${llist }" var="list" varStatus="status">
			<tr onclick="test(this)">
				<td>${list.lect_id}</td>
				
			<td><label id="la1_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.curri_id}</label>			 <input type="text" style="display: none;"  id="in1_${list.lect_id}" class="in_${list.lect_id }"  value="${list.curri_id}"></td>
			<td><label id="la2_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_name}</label>			 <input type="text" style="display: none;"  id="in2_${list.lect_id}" class="in_${list.lect_id }"  value="${list.lect_name}"></td>
			<td><label id="la3_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_person_num}</label> 	 <input type="text" style="display: none;"  id="in3_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_person_num}"></td>
			<td><label id="la4_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_start_day}</label> 		 <input type="text" style="display: none;"  id="in4_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_start_day}"></td>
			<td><label id="la5_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_end_day}</label>		 <input type="text" style="display: none;"  id="in5_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_end_day}"></td>
			<td><label id="la6_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_start_time}</label>	 <input type="text" style="display: none;"  id="in6_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_start_time}"></td>
			<td><label id="la7_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_end_time}</label>	 <input type="text" style="display: none;"  id="in7_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_end_time}"></td>
			<td><label id="la8_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_write_time }</label>		 <input type="text" style="display: none;"  id="in8_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_write_time}"></td>
			<td><label id="la9_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_modify_time }</label>		 <input type="text" style="display: none;"  id="in9_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_modify_time}"></td>
			<td><label id="la10_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_charge }</label>		 <input type="text" style="display: none;"  id="in10_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_charge}"></td>
			<td><label id="la11_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_accept }</label>		 <input type="text" style="display: none;"  id="in11_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_accept}"></td>
			<td><label id="la12_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.lect_open }</label>		 <input type="text" style="display: none;"  id="in12_${list.lect_id}" class="in_${list.lect_id }"   value="${list.lect_open}"></td>
			<td><label id="la13_${list.lect_id}"  class="la_${list.lect_id}"  style="display:show;">${list.enabled }</label> 			<input type="text" style="display: none;"  id="in13_${list.lect_id}" class="in_${list.lect_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.lect_id}"
				onclick="show1('${list.lect_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.lect_id}"
				onclick="show_update('${list.lect_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>