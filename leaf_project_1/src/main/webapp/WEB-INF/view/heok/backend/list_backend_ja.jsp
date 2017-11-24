<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		
		var member_id  = $('#in1_'+s).val();
		var jageok_title  = $('#in2_'+s).val();
		var jageok_date  = $('#in3_'+s).val();
		var jageok_cost  = $('#in4_'+s).val();
		var enabled  = $('#in5_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_jageok.do',
            data:{
            	jageok_id: s,
            	member_id: member_id,
            	jageok_title: jageok_title,
            	jageok_date: jageok_date,
            	jageok_cost: jageok_cost,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_ja.do';
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
		<option value="lect"> Lecture </option>
		<option value="member">Member</option>
		<option value="book">Book</option>
		<option value="faq">Faq</option>
		<option value="ja" selected="selected">Jageok</option>
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
	<form action="search_backend_ja.do" method="post">
		<select name="column">
			<option value="jageok_id">jageok_id</option>
			<option value="member_id">Member-id</option>
			<option value="jageok_title">Curri-subject</option>
			<option value="jageok_date">Curri-level</option>
			<option value="jageok_cost">Curri-content</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table>
	<th>jageok_id</th>
	<th>Member_id</th>
	<th>jageok_title</th>
	<th>jageok_date</th>
	<th>jageok_cost</th>
	<th>Enabled</th>
	<form action="update_jageok.do" method="post">
	<c:forEach items="${jalist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.jageok_id}</td>
			
			<td><label id="la1_${list.jageok_id}"  class="la_${list.jageok_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="display: none;"  id="in1_${list.jageok_id}" class="in_${list.jageok_id }"  value="${list.member_id}"></td>
			<td><label id="la2_${list.jageok_id}"  class="la_${list.jageok_id}"  style="display:show;">${list.jageok_title}</label> 	 <input type="text" style="display: none;"  id="in2_${list.jageok_id}" class="in_${list.jageok_id }"   value="${list.jageok_title}"></td>
			<td><label id="la3_${list.jageok_id}"  class="la_${list.jageok_id}"  style="display:show;">${list.jageok_date}</label> 		 <input type="text" style="display: none;"  id="in3_${list.jageok_id}" class="in_${list.jageok_id }"   value="${list.jageok_date}"></td>
			<td><label id="la4_${list.jageok_id}"  class="la_${list.jageok_id}"  style="display:show;">${list.jageok_cost}</label>		 <input type="text" style="display: none;"  id="in4_${list.jageok_id}" class="in_${list.jageok_id }"   value="${list.jageok_cost}"></td>
			<td><label id="la5_${list.jageok_id}"  class="la_${list.jageok_id}"  style="display:show;">${list.enabled}</label>	 <input type="text" style="display: none;"  id="in5_${list.jageok_id}" class="in_${list.jageok_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.jageok_id}"
				onclick="show1('${list.jageok_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.jageok_id}"
				onclick="show_update('${list.jageok_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
</form>
	</table>
</body>
</html>