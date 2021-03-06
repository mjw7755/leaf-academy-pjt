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
#pay_table {
   width: 1200px;
   text-align: center;
   border-collapse: collapse;
   margin-top: 50px;
}
#pay_table td{
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
#pay_table th{
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
		
		var payment_lect_id  = $('#in1_'+s).val();
		var payment_member_id  = $('#in2_'+s).val();
		var payment_addnum  = $('#in3_'+s).val();
		var payment_address  = $('#in4_'+s).val();
		var payment_address2  = $('#in5_'+s).val();
		var payment_caution  = $('#in6_'+s).val();
		var payment_lect_subject  = $('#in7_'+s).val();
		var payment_lect_charge  = $('#in8_'+s).val();
		var payment_fee  = $('#in9_'+s).val();
		var payment_currency  = $('#in10_'+s).val();
		var payment_payer_email  = $('#in11_'+s).val();
		var payment_member_name  = $('#in12_'+s).val();
		var payment_member_tel  = $('#in13_'+s).val();
		var payment_teacher_name  = $('#in14_'+s).val();
		var payment_write_date  = $('#in15_'+s).val();
		var payment_pay_chk  = $('#in16_'+s).val();

		$.ajax({
            type:'POST',
            url:'update_by_display_payment.do',
            data:{
            	payment_id: s,
            	payment_lect_id: payment_lect_id,
            	payment_member_id: payment_member_id,
            	payment_addnum: payment_addnum,
            	payment_address: payment_address,
            	payment_address2: payment_address2,
            	payment_caution: payment_caution,
            	payment_lect_subject: payment_lect_subject,
            	payment_lect_charge: payment_lect_charge,
            	payment_fee: payment_fee,
            	payment_currency: payment_currency,
            	payment_payer_email: payment_payer_email,
            	payment_member_name: payment_member_name,
            	payment_member_tel: payment_member_tel,
            	payment_teacher_name: payment_teacher_name,
            	payment_write_date: payment_write_date,
            	payment_pay_chk: payment_pay_chk,
            	
            },
            success: function(result){
               if(result == '0'){
            	 
            	$('.la_'+s).css("display", "block");
               	$('.in_'+s).css("display", "none");
              		
            	$('#btn_update_by_display_yet_'+ s).css("display", "block");
           		$('#btn_update_by_display_now_' + s).css("display", "none");
           		window.location.href='list_backend_pay.do';
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
		<option value="pay" selected="selected">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
		<option value="tnotice">Teacher_Notice</option>
	</select>
<div id="search">	
	<form action="search_backend_pay.do" method="post">
		<select name="column">
			<option value="payment_id">payment_id</option>
			<option value="payment_lect_id">payment_lect_id</option>
			<option value="payment_member_id">payment_member_id</option>
			<option value="payment_addnum">payment_addnum</option>
			<option value="payment_address">payment_address</option>
			<option value="payment_address2">payment_address2</option>
			<option value="payment_caution">payment_caution</option>
			<option value="payment_lect_subject">payment_lect_subject</option>
			<option value="payment_lect_charge">payment_lect_charge</option>
			<option value="payment_fee">payment_fee</option>
			<option value="payment_currency">payment_currency</option>
			<option value="payment_payer_email">payment_payer_email</option>
			<option value="payment_member_name">payment_member_name</option>
			<option value="payment_member_tel">payment_member_tel</option>
			<option value="payment_teacher_name">payment_teacher_name</option>
			<option value="payment_write_date">payment_write_date</option>
			<option value="payment_pay_chk">payment_pay_chk</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다.">  <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
	</form>
</div>	
	<table id="pay_table">
	<th>payment_id</th>
	<th>payment_lect_id</th>
	<th>payment_member_id</th>
	<th>payment_addnum</th>
	<th>payment_address</th>
	<th>payment_address2</th>
	<th>payment_caution</th>
	<th>payment_lect_subject</th>
	<th>payment_lect_charge</th>
	<th>payment_fee</th>
	<th>payment_currency</th>
	<th>payment_payer_email</th>
	<th>payment_member_name</th>
	<th>payment_member_tel</th>
	<th>payment_teacher_name</th>
	<th>payment_lect_subject</th>
	<th>payment_write_date</th>
	<th>payment_pay_chk</th>
	<th></th>
	<c:forEach items="${plist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.payment_id}</td>
			
			<td><label id="la1_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_lect_id}</label>			 <input type="text" style="width: 100px;display: none;"  id="in1_${list.payment_id}" class="in_${list.payment_id }"  value="${list.payment_lect_id}"></td>
			<td><label id="la2_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_member_id}</label> 	 <input type="text" style="width: 100px;display: none;"  id="in2_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_member_id}"></td>
			<td><label id="la3_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_addnum}</label> 		 <input type="text" style="width: 100px;display: none;"  id="in3_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_addnum}"></td>
			<td><label id="la4_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_address}</label>		 <input type="text" style="width: 300px;display: none;"  id="in4_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_address}"></td>
			<td><label id="la5_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_address2}</label>	 <input type="text" style="width: 200px;display: none;"  id="in5_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_address2}"></td>
			<td><label id="la6_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_caution}</label>	 <input type="text" style="width: 100px;display: none;"  id="in6_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_caution}"></td>
			<td><label id="la7_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_lect_subject }</label>		 <input type="text" style="width: 200px;display: none;"  id="in7_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_lect_subject}"></td>
			<td><label id="la8_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_lect_charge }</label> 			<input type="text" style="width: 100px;display: none;"  id="in8_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_lect_charge}"></td>
			<td><label id="la9_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_fee }</label> 			<input type="text" style="width: 100px;display: none;"  id="in9_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_fee}"></td>
			<td><label id="la10_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_currency }</label> 			<input type="text" style="width: 100px;display: none;"  id="in10_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_currency}"></td>
			<td><label id="la11_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_payer_email }</label> 			<input type="text" style="width: 200px;display: none;"  id="in11_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_payer_email}"></td>
			<td><label id="la12_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_member_name }</label> 			<input type="text" style="width: 100px;display: none;"  id="in13_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_member_name}"></td>
			<td><label id="la13_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_member_tel }</label> 			<input type="text" style="width: 200px;display: none;"  id="in14_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_member_tel}"></td>
			<td><label id="la14_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_teacher_name }</label> 			<input type="text" style="width: 100px;display: none;"  id="in15_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_teacher_name}"></td>
			<td><label id="la15_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_write_date }</label> 			<input type="text" style="width: 150px;display: none;"  id="in16_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_write_date}"></td>
			<td><label id="la16_${list.payment_id}"  class="la_${list.payment_id}"  style="display:show;">${list.payment_pay_chk }</label> 			<input type="text" style="width: 100px;display: none;"  id="in17_${list.payment_id}" class="in_${list.payment_id }"   value="${list.payment_pay_chk}"></td>
			<td>
			
			<button type="button"  id="btn_update_by_display_yet_${list.payment_id}"
				onclick="show1('${list.payment_id}')" style="display:show;" class="btn2 btn-info">수 정</button> 
				
			<button type="button"  id="btn_update_by_display_now_${list.payment_id}"
				onclick="show_update('${list.payment_id}')"  style="display:none;" class="btn2 btn-info">완 료</button> 
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>