<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
		
		var member_id  = $('#in1_'+s).val();
		var teacher_introduce  = $('#in2_'+s).val();
		var teacher_image  = $('#in3_'+s).val();
		var enabled  = $('#in4_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_t_i.do',
            data:{
            	teacher_id: s,
            	member_id: member_id,
            	teacher_introduce: teacher_introduce,
            	teacher_image: teacher_image,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_t_i.do';
               }
            }
         });
	}  

</script>
<body>
	<select
		style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;"
		onchange="listChange(this);">
		<option value="curri">Curriculum </option>
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
		<option value="t_i" selected="selected">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
	
	<form action="search_backend_t_i.do" method="post">
		<select name="column">
			<option value="teacher_id">teacher_id</option>
			<option value="member_id">Member-id</option>
			<option value="teacher_introduce">teacher_introduce</option>
			<option value="teacher_image">teacher_image</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>teacher_id</th>
	<th>Member_id</th>
	<th>teacher_introduce</th>
	<th>teacher_image</th>
	<th>Enabled</th>
	<c:forEach items="${t_ilist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.teacher_id}</td>

			<td><label id="la1_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="display: none;"  id="in1_${list.teacher_id}" class="in_${list.teacher_id }"  value="${list.member_id}"></td>
			<td><label id="la2_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.teacher_introduce}</label> 	 <input type="text" style="display: none;"  id="in2_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.teacher_introduce}"></td>
			<td><label id="la3_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.teacher_image}</label> 		 <input type="text" style="display: none;"  id="in3_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.teacher_image}"></td>
			<td><label id="la4_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.enabled}</label>		 <input type="text" style="display: none;"  id="in4_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.teacher_id}"
				onclick="show1('${list.teacher_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.teacher_id}"
				onclick="show_update('${list.teacher_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>