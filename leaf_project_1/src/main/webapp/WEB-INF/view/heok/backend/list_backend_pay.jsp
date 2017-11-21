<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function listChange(params) {
		var url = "list_backend_" + params.value + ".do";
		window.location.href = url;
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
		<option value="pay" selected="selected">Payment</option>
		<option value="qna">QnA</option>
		<option value="rev">Review</option>
		<option value="stu">Student</option>
		<option value="t_i">Teacher_Intro</option>
	</select>
	
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
			<option value="payment_buy_time">payment_buy_time</option>
			<option value="payment_fee">payment_fee</option>
			<option value="payment_currency">payment_currency</option>
			<option value="payment_code">payment_code</option>
			<option value="payment_payer_email">payment_payer_email</option>
			<option value="payment_custom_num">payment_custom_num</option>
			<option value="payment_status">payment_status</option>
			<option value="payment_member_name">payment_member_name</option>
			<option value="payment_member_tel">payment_member_tel</option>
			<option value="payment_teacher_name">payment_teacher_name</option>
			<option value="payment_write_date">payment_write_date</option>
			<option value="payment_pay_chk">payment_pay_chk</option>
		</select> 
		<input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" value="검색">&nbsp;

	</form>
	
	<table>
	<th>payment_id</th>
	<th>payment_lect_id</th>
	<th>payment_member_id</th>
	<th>payment_addnum</th>
	<th>payment_address</th>
	<th>payment_address2</th>
	<th>payment_caution</th>
	<th>payment_lect_subject</th>
	<th>payment_lect_charge</th>
	<th>payment_buy_time</th>
	<th>payment_fee</th>
	<th>payment_currency</th>
	<th>payment_code</th>
	<th>payment_payer_email</th>
	<th>payment_custom_num</th>
	<th>payment_status</th>
	<th>payment_member_name</th>
	<th>payment_member_tel</th>
	<th>payment_teacher_name</th>
	<th>payment_lect_subject</th>
	<th>payment_write_date</th>
	<th>payment_pay_chk</th>
	<c:forEach items="${plist }" var="list" varStatus="status">
		<tr onclick="test(this)">
			<td>${list.payment_id}</td>
			<td>${list.payment_lect_id}</td>
			<td>${list.payment_member_id}</td>
			<td>${list.payment_addnum}</td>
			<td>${list.payment_address}</td>
			<td>${list.payment_address2}</td>
			<td>${list.payment_caution}</td>
			<td>${list.payment_lect_subject }</td>
			<td>${list.payment_lect_charge }</td>
			<td>${list.payment_buy_time }</td>
			<td>${list.payment_fee }</td>
			<td>${list.payment_currency }</td>
			<td>${list.payment_code }</td>
			<td>${list.payment_payer_email }</td>
			<td>${list.payment_custom_num }</td>
			<td>${list.payment_status }</td>
			<td>${list.payment_member_name }</td>
			<td>${list.payment_member_tel }</td>
			<td>${list.payment_teacher_name }</td>
			<td>${list.payment_write_date }</td>
			<td>${list.payment_pay_chk }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>