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
		var qna_title  = $('#in2_'+s).val();
		var qna_content  = $('#in3_'+s).val();
		var qna_writedate  = $('#in4_'+s).val();
		var qna_modifydate  = $('#in5_'+s).val();
		var qna_level  = $('#in6_'+s).val();
		var qna_ref  = $('#in7_'+s).val();
		var qna_step  = $('#in8_'+s).val();
		var enabled  = $('#in9_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_qna.do',
            data:{
            	qna_id: s,
            	member_id: member_id,
            	qna_title: qna_title,
            	qna_content: qna_content,
            	qna_writedate: qna_writedate,
            	qna_modifydate: qna_modifydate,
            	qna_level: qna_level,
            	qna_ref: qna_ref,
            	qna_step: qna_step,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_qna.do';
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
		<option value="qna" selected="selected">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
	
	<form action="search_backend_qna.do" method="post">
		<select name="column">
			<option value="qna_id">qna_id</option>
			<option value="member_id">Member-id</option>
			<option value="qna_title">qna_title</option>
			<option value="qna_content">qna_content</option>
			<option value="qna_writedate">qna_writedate</option>
			<option value="qna_modifydate">qna_modifydate</option>
			<option value="qna_ref">qna_ref</option>
			<option value="qna_step">qna_step</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>qna_id</th>
	<th>Member_id</th>
	<th>qna_title</th>
	<th>qna_content</th>
	<th>qna_writedate</th>
	<th>qna_modifydate</th>
	<th>qna_ref</th>
	<th>qna_step</th>
	<th>Enabled</th>
	<c:forEach items="${qlist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.qna_id}</td>
			
			<td><label id="la1_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="display: none;"  id="in1_${list.qna_id}" class="in_${list.qna_id }"  value="${list.member_id}"></td>
			<td><label id="la2_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_title}</label> 	 <input type="text" style="display: none;"  id="in2_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_title}"></td>
			<td><label id="la3_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_content}</label> 		 <input type="text" style="display: none;"  id="in3_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_content}"></td>
			<td><label id="la4_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_writedate}</label>		 <input type="text" style="display: none;"  id="in4_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_writedate}"></td>
			<td><label id="la5_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_modifydate}</label>	 <input type="text" style="display: none;"  id="in5_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_modifydate}"></td>
			<td><label id="la6_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_ref}</label>	 <input type="text" style="display: none;"  id="in6_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_ref}"></td>
			<td><label id="la7_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.qna_step }</label>		 <input type="text" style="display: none;"  id="in7_${list.qna_id}" class="in_${list.qna_id }"   value="${list.qna_step}"></td>
			<td><label id="la8_${list.qna_id}"  class="la_${list.qna_id}"  style="display:show;">${list.enabled }</label> 			<input type="text" style="display: none;"  id="in8_${list.qna_id}" class="in_${list.qna_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.qna_id}"
				onclick="show1('${list.qna_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.qna_id}"
				onclick="show_update('${list.qna_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>