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
		
		var member_pwd  = $('#in1_'+s).val();
		var member_name  = $('#in2_'+s).val();
		var member_tel  = $('#in3_'+s).val();
		var member_email  = $('#in4_'+s).val();
		var member_level  = $('#in5_'+s).val();
		var member_address  = $('#in6_'+s).val();
		var member_addnum  = $('#in7_'+s).val();
		var enabled  = $('#in8_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_member.do',
            data:{
            	member_id: s,
            	member_pwd: member_pwd,
            	member_name: member_name,
            	member_tel: member_tel,
            	member_email: member_email,
            	member_level: member_level,
            	member_address: member_address,
            	member_addnum: member_addnum,
            	enabled: enabled,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_member.do';
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
		<option value="member" selected="selected">Member</option>
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
	<form action="search_backend_member.do" method="post">
		<select name="column">
			<option value="member_id">Member-id</option>
			<option value="member_pwd">Member-pwd</option>
			<option value="member_name">Member-name</option>
			<option value="member_tel">Member-tel</option>
			<option value="member_email">Member-email</option>
			<option value="member_level">Member-level</option>
			<option value="member_address">Member-address</option>
			<option value="member_addnum">Member-addnum</option>
			<option value="enabled">Enable</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>
	<table>
		<th>ID</th>
		<th>Password</th>
		<th>Name</th>
		<th>Tel</th>
		<th>E-Mail</th>
		<th>Level</th>
		<th>Address</th>
		<th>Addnum</th>
		<th>Enabled</th>
		<c:forEach items="${mlist }" var="list" varStatus="status">
			<tr onclick="test(this)">
				<td>${list.member_id}</td>
				
			<td><label id="la1_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_pwd}</label>			 <input type="text" style="display: none;"  id="in1_${list.member_id}" class="in_${list.member_id }"  value="${list.member_pwd}"></td>
			<td><label id="la2_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_name}</label> 	 <input type="text" style="display: none;"  id="in2_${list.member_id}" class="in_${list.member_id }"   value="${list.member_name}"></td>
			<td><label id="la3_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_tel}</label> 		 <input type="text" style="display: none;"  id="in3_${list.member_id}" class="in_${list.member_id }"   value="${list.member_tel}"></td>
			<td><label id="la4_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_email}</label>		 <input type="text" style="display: none;"  id="in4_${list.member_id}" class="in_${list.member_id }"   value="${list.member_email}"></td>
			<td><label id="la5_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_level}</label>	 <input type="text" style="display: none;"  id="in5_${list.member_id}" class="in_${list.member_id }"   value="${list.member_level}"></td>
			<td><label id="la6_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_address}</label>	 <input type="text" style="display: none;"  id="in6_${list.member_id}" class="in_${list.member_id }"   value="${list.member_address}"></td>
			<td><label id="la7_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.member_addnum }</label>		 <input type="text" style="display: none;"  id="in7_${list.member_id}" class="in_${list.member_id }"   value="${list.member_addnum}"></td>
			<td><label id="la8_${list.member_id}"  class="la_${list.member_id}"  style="display:show;">${list.enabled }</label> 			<input type="text" style="display: none;"  id="in8_${list.member_id}" class="in_${list.member_id }"   value="${list.enabled}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.member_id}"
				onclick="show1('${list.member_id}')" style="display:show;">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.member_id}"
				onclick="show_update('${list.member_id}')"  style="display:none;">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>