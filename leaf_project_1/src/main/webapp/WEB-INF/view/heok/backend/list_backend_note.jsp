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
		
		var n_content  = $('#in1_'+s).val();
		var n_title  = $('#in2_'+s).val();
		var n_send_id  = $('#in3_'+s).val();
		var n_recv_id  = $('#in4_'+s).val();
		var n_send_del_yn  = $('#in5_'+s).val();
		var n_recv_del_yn  = $('#in6_'+s).val();
		var n_open_date  = $('#in7_'+s).val();
		var n_write_date  = $('#in8_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_note.do',
            data:{
            	n_id: s,
            	n_content: n_content,
            	n_title: n_title,
            	n_send_id: n_send_id,
            	n_recv_id: n_recv_id,
            	n_send_del_yn: n_send_del_yn,
            	n_recv_del_yn: n_recv_del_yn,
            	n_open_date: n_open_date,
            	n_write_date: n_write_date,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_note.do';
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
		<option value="note" selected="selected">Note</option>
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
<div id="search">	
	<form action="search_backend_note.do" method="post">
		<select name="column">
			<option value="n_id">n-id</option>
			<option value="n_content">n_content</option>
			<option value="n_title">n_title</option>
			<option value="n_send_id">n_title</option>
			<option value="n_recv_id">n_recv_id</option>
			<option value="n_send_del_yn">n_send_del_yn</option>
			<option value="n_recv_del_yn">n_recv_del_yn</option>
			<option value="n_open_date">n_open_date</option>
			<option value="n_write_date">n_write_date</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table>
	<th>n_id</th>
	<th>n_content</th>
	<th>n_title</th>
	<th>n_send_id</th>
	<th>n_recv_id</th>
	<th>n_send_del_yn</th>
	<th>n_recv_del_yn</th>
	<th>n_open_date</th>
	<th>n_write_date</th>
	<c:forEach items="${nlist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.n_id}</td>
		
			<td><label id="la1_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_content}</label>			 <input type="text" style="display: none;"  id="in1_${list.n_id}" class="in_${list.n_id }"  value="${list.n_content}"></td>
			<td><label id="la2_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_title}</label> 	 <input type="text" style="display: none;"  id="in2_${list.n_id}" class="in_${list.n_id }"   value="${list.n_title}"></td>
			<td><label id="la3_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_send_id}</label> 		 <input type="text" style="display: none;"  id="in3_${list.n_id}" class="in_${list.n_id }"   value="${list.n_send_id}"></td>
			<td><label id="la4_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_recv_id}</label>		 <input type="text" style="display: none;"  id="in4_${list.n_id}" class="in_${list.n_id }"   value="${list.n_recv_id}"></td>
			<td><label id="la5_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_send_del_yn}</label>	 <input type="text" style="display: none;"  id="in5_${list.n_id}" class="in_${list.n_id }"   value="${list.n_send_del_yn}"></td>
			<td><label id="la6_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_recv_del_yn}</label>	 <input type="text" style="display: none;"  id="in6_${list.n_id}" class="in_${list.n_id }"   value="${list.n_recv_del_yn}"></td>
			<td><label id="la7_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_open_date }</label>		 <input type="text" style="display: none;"  id="in7_${list.n_id}" class="in_${list.n_id }"   value="${list.n_open_date}"></td>
			<td><label id="la8_${list.n_id}"  class="la_${list.n_id}"  style="display:show;">${list.n_write_date }</label> 			<input type="text" style="display: none;"  id="in8_${list.n_id}" class="in_${list.n_id }"   value="${list.n_write_date}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.n_id}"
				onclick="show1('${list.n_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.n_id}"
				onclick="show_update('${list.n_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>