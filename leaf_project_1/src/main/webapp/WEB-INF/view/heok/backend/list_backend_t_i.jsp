<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#backend_page{
   width: 100%;
}
#backend_page hr{
   border: thin solid #cccccc;
}
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
#t_i_table {
   width: 1200px;
   text-align: center;
   border-collapse: collapse;
   margin-top: 50px;
}
#t_i_table td{
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
#t_i_table th{
   border-bottom: 1px solid #cccccc;
   background-color: #f4f3f1;
   height: 50px;
   padding-left: 10px;
   padding-right: 10px;
}
/* button */
.btn-info { 
   color: #fff;
   background-color: #f16022;
   border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
   color: #fff;
   background-color: #b64413;
   border-color: #1b6d85;
}
.btn-info:hover {
   color: #fff;
   background-color: #b64413;
   border-color: #973911;
}
.btn2 {
   display: inline-block;
   padding: 1px 12px;
   margin-bottom: 12px;
   margin-top:12px;
   margin-left:5px;
   font-size: 14px;
   font-weight: 400;
   /* line-height: 1.42857143; */
   text-align: center;
   white-space: nowrap;
   vertical-align: middle;
   -ms-touch-action: manipulation;
   touch-action: manipulation;
   cursor: pointer;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
   background-image: none;
   border: 1px solid transparent;
   border-radius: 4px;   
}
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
		<option value="notice">Notice</option>
		<option value="pay">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i" selected="selected">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
<div id="search">	
	<form action="search_backend_t_i.do" method="post">
		<select name="column">
			<option value="teacher_id">teacher_id</option>
			<option value="member_id">Member-id</option>
			<option value="teacher_introduce">teacher_introduce</option>
			<option value="teacher_image">teacher_image</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table id="t_i_table">
	<th>teacher_id</th>
	<th>Member_id</th>
	<th>teacher_introduce</th>
	<th>teacher_image</th>
	<th>Enabled</th>
	<th></th>
	<c:forEach items="${t_ilist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.teacher_id}</td>

			<td><label id="la1_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.member_id}</label>			 <input type="text" style="width: 100px;display: none;"  id="in1_${list.teacher_id}" class="in_${list.teacher_id }"  value="${list.member_id}"></td>
			<td><label id="la2_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.teacher_introduce}</label> 	 <input type="text" style="width: 500px;display: none;"  id="in2_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.teacher_introduce}"></td>
			<td><label id="la3_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.teacher_image}</label> 		 <input type="text" style="width: 200px;display: none;"  id="in3_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.teacher_image}"></td>
			<td><label id="la4_${list.teacher_id}"  class="la_${list.teacher_id}"  style="display:show;">${list.enabled}</label>		 <input type="text" style="width: 50px;display: none;"  id="in4_${list.teacher_id}" class="in_${list.teacher_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.teacher_id}"
				onclick="show1('${list.teacher_id}')" style="display:show;" class="btn2 btn-info">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.teacher_id}"
				onclick="show_update('${list.teacher_id}')"  style="display:none;" class="btn2 btn-info">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>