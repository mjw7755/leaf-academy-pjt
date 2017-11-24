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
		
		var member_id  = $('#in1_'+s).val();
		var notice_title  = $('#in2_'+s).val();
		var notice_content  = $('#in3_'+s).val();
		var notice_writedate  = $('#in4_'+s).val();
		var notice_modifydate  = $('#in5_'+s).val();
		var enabled  = $('#in6_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_notice.do',
            data:{
            	notice_id: s,
            	member_id: member_id,
            	notice_title: notice_title,
            	notice_content: notice_content,
            	notice_writedate: notice_writedate,
            	notice_modifydate: notice_modifydate,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_notice.do';
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
		<option value="ja">Jageok</option>
		<option value="note">Note</option>
		<option value="notice" selected="selected">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
<div id="search">	
	<form action="search_backend_notice.do" method="post">
		<select name="column">
			<option value="notice_id">notice_id</option>
			<option value="member_id">member_id</option>
			<option value="notice_title">notice_title</option>
			<option value="notice_content">notice_content</option>
			<option value="notice_writedate">notice_writedate</option>
			<option value="notice_modifydate">notice_modifydate</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table>
	<th>notice_id</th>
	<th>Member_id</th>
	<th>notice_title</th>
	<th>notice_content</th>
	<th>notice_writedate</th>
	<th>notice_modifydate</th>
	<th>Enabled</th>
	<c:forEach items="${noticelist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.notice_id}</td>
			
	<td><label id="la1_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="display: none;"  id="in1_${list.notice_id}" class="in_${list.notice_id }"  value="${list.member_id}"></td>
	<td><label id="la2_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.notice_title}</label> 	 <input type="text" style="display: none;"  id="in2_${list.notice_id}" class="in_${list.notice_id }"   value="${list.notice_title}"></td>
	<td><label id="la3_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.notice_content}</label> 		 <input type="text" style="display: none;"  id="in3_${list.notice_id}" class="in_${list.notice_id }"   value="${list.notice_content}"></td>
	<td><label id="la4_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.notice_writedate}</label>		 <input type="text" style="display: none;"  id="in4_${list.notice_id}" class="in_${list.notice_id }"   value="${list.notice_writedate}"></td>
	<td><label id="la5_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.notice_modifydate}</label>	 <input type="text" style="display: none;"  id="in5_${list.notice_id}" class="in_${list.notice_id }"   value="${list.notice_modifydate}"></td>
	<td><label id="la6_${list.notice_id}"  class="la_${list.notice_id}"  style="display:show;">${list.enabled}</label>	 <input type="text" style="display: none;"  id="in6_${list.notice_id}" class="in_${list.notice_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.notice_id}"
				onclick="show1('${list.notice_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.notice_id}"
				onclick="show_update('${list.notice_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>