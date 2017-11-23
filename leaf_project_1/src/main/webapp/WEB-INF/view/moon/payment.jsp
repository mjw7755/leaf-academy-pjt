<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>구매정보 확인</h1>
<hr>
 <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
 <input type="hidden" name="cmd" value="_xclick">
 <input type="hidden" name="business" value="mjw7755-facilitator@naver.com">
 상품명 : <input type="text" name="item_name" value="${dto.payment_lect_subject }">
 가격 : <input type="text" name="amount" value="${dto.payment_lect_charge }">달러
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