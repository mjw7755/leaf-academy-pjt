<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">
	function listChange(params) {
		var url = "list_backend_" + params.value + ".do";
		window.location.href = url;
	}

	function show(str){
		   
		   var curri_id = str;
		  alert(curri_id);
		  
		   $.ajax({
	            type:'POST',
	            url:'select_curri_byModal.do',
	            data:{
	            	curri_id: curri_id,
	            
	            },
	            success: function(result){
	            	alert("들어옴");
	               if(result == '0'){
	            	   alert("result == 0");
	            	
	            	   $('#curri_label').css("display","none");
	            	   $('#curri_input').css("display","block");
	            	  
	                 /*  location.reload();  */
	               }
	            }
	         });
		   /* var sss = ${member_id}; 
		   alert(sss); */
		   /*  $("#modal_number").val(manager_number);
		    $("#modal_name").val(manager_name);
		    $("#modal_mmr").val(manager_mmr);
		    $("#modal_group").val(manager_group);
		    $("#vacationModal").modal('show'); */
		}
	 	
	
	function show1(str) {
		
		var s = str;
		
		$('.la_'+s).css("display", "none");
		$('.in1_'+s).css("display", "block");
		$('.in2_'+s).css("display", "block");
		$('.in3_'+s).css("display", "block");
		$('.in4_'+s).css("display", "block");
		$('.in5_'+s).css("display", "block");
		$('.in6_'+s).css("display", "block");
		$('.in7_'+s).css("display", "block");
		$('.in8_'+s).css("display", "block");
		
		$('#btn_update_by_display_yet_'+ s).css("display", "none");
		$('#btn_update_by_display_now_' + s).css("display", "block");
	}  
	
function show_update(str) {
		var s = str;
		
		var member_id  = $('.in1_'+s).val();
		var curri_subject  = $('.in2_'+s).val();
		var curri_level  = $('.in3_'+s).val();
		var curri_content  = $('.in4_'+s).val();
		var curri_write_time  = $('.in5_'+s).val();
		var curri_modify_time  = $('.in6_'+s).val();
		var curri_accept  = $('.in7_'+s).val();
		var enabled  = $('.in8_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display.do',
            data:{
            	curri_id: s,
            	member_id: member_id,
            	curri_subject: curri_subject,
            	curri_level: curri_level,
            	curri_content: curri_content,
            	curri_write_time: curri_write_time,
            	curri_modify_time: curri_modify_time,
            	curri_accept: curri_accept,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
            	  
               }
            }
         });
	}  

</script>

<body>
	
	<select
		style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;"
		onchange="listChange(this);">
		<option value="curri" selected="selected">Curriculum </option>
		<option value="lect"> Lecture </option>
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
	</select>
	
	<form action="search_backend_curri.do" method="post">
		<select name="column">
			<option value="curri_id">Curri-id</option>
			<option value="member_id">Member-id</option>
			<option value="curri_subject">Curri-subject</option>
			<option value="curri_level">Curri-level</option>
			<option value="curri_content">Curri-content</option>
			<option value="curri_write_time">Curri-write_time</option>
			<option value="curri_modify_time">Curri-modify_time</option>
			<option value="curri_accept">Curri-accept</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue" placeholder="키워드 검색 가능합니다."> 
		<input type="submit" id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>Curri_id</th>
	<th>Member_id</th>
	<th>Subject</th>
	<th>Level</th>
	<th>Content</th>
	<th>Write_time</th>
	<th>Modify_time</th>
	<th>Accept</th>
	<th>Enabled</th>
		<form action="update_curri.do" method="post">
	<c:forEach items="${clist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.curri_id}</td>
			
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="display: none;"  class="in1_${list.curri_id}"  value="${list.member_id}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_subject}</label> 	 <input type="text" style="display: none;"  class="in2_${list.curri_id}"  value="${list.curri_subject}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_level}</label> 		 <input type="text" style="display: none;"  class="in3_${list.curri_id}"  value="${list.curri_level}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_content}</label>		 <input type="text" style="display: none;"  class="in4_${list.curri_id}"  value="${list.curri_content}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_write_time}</label>	 <input type="text" style="display: none;"  class="in5_${list.curri_id}"  value="${list.curri_write_time}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_modify_time}</label>	 <input type="text" style="display: none;"  class="in6_${list.curri_id}"  value="${list.curri_modify_time}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.curri_accept }</label>		 <input type="text" style="display: none;"  class="in7_${list.curri_id}"  value="${list.curri_accept}"></td>
			<td><label class="la_${list.curri_id}"  style="display:show;">${list.enabled }</label> 			<input type="text" style="display: none;"  class="in8_${list.curri_id}"  value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.curri_id}"
				onclick="show1('${list.curri_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.curri_id}"
				onclick="show_update('${list.curri_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
</form>
	</table>

</body>
</html>