<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#pay_info{
	width: 800px;
}
#pay_info hr{
	border: thin solid #cccccc;
}
/*  */
.form-control {
	display: block;
	margin-right: 15px;
	/* width: 300px; */
	/* height: 34px; */
	padding: 6px 0px;
	padding-left:10px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	/* margin-left: 15px; */
}
/*  */
#pay_info_table{
	margin-top:20px;
	margin-bottom: 20px;
}
#pay_info_table th{
	text-align: left;
	padding-right: 20px;
}

</style>
</head>
<body>
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_curri.png">
   		</div>
   	</div>
   	    <div id="pay_info">
	<h1>
	결제 정보 확인
	</h1>
<hr>
</div>
 <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
 <input type="hidden" name="cmd" value="_xclick" >
 <input type="hidden" name="business" value="mjw7755-facilitator@naver.com">
<table id="pay_info_table"> 
 <tr><th>상품명</th>
<td><input type="text" name="item_name" value="${dto.payment_lect_subject }" class="form-control" readonly="readonly"></td>
</tr>
<tr>
<th>가격</th> 
<td><input type="text" name="amount" value="${dto.payment_lect_charge } $" class="form-control" readonly="readonly"></td>
</table>
 <input type="hidden" name="currency_code" value="USD">
 <input type="hidden" name="item_number" value="${payNum }">
 <input type="hidden" name="custom" value="${payment_member_name}">
 <input type="hidden" name="charset" value="UTF-8">
 <input type="image" name="submit" border="0" 
src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" 
alt="PayPal - The safer, easier way to pay online">
 </form>
</body>
</html>