<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js">
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("input:radio[name='express']").change(function() {
			var express = this.value;
			if (express == "home") {
				$("#newcategory").hide();
				$("#homecategory").show();

			} else if (express == "new") {
				$("#newcategory").show();
				$("#homecategory").hide();
			}
		});
	});
</script>
<body>
	<h3>결제진행</h3>
	<span>
		<li>교재 / 도서 배송기간 - 교재 / 도서 발송일로 부터 서울: 2~3일, 지방 : 3~4일(일요일 및 법정
			공휴일은 제외)</li>
		<li>교재 / 도서를 함께 구매하신 강좌의 취소는, 먼저 교재가 반송이 되어야 취소하실 수 있습니다.</li>
		<li>교재 결제 시 보너스캐쉬와 이벤트캐쉬는 사용하실 수 없으며, 배송지 정보의 기본주소는 배송주소관리에서
			기본주소로 설정하시기 바랍니다.</li>
		<li>수강중인 강좌와 교재는 수강중 재구매할 수 없습니다. <br>교재 분실*파손 등의 이유로 재구매시
			학습 지원 센터(02-7375-1436) 또는 공지사항을 이용해 주시기 바랍니다
	</li>
		<li>불법으로 구매한 교재 혹은 무단 복제한 교재를 사용할 때는 저작권법에 따라 법적 처벌을 받을 수 있습니다.</li>
	</span>
	<br>
	<form action="payment.do" method="post">
		<input type="hidden" name="payment_member_id"
			value="${sessionScope.sessionid }">
		<h3>주문확인</h3>
		<span>
			<table>
				<tr>
					<th>구매강좌명</th>
					<th>강사명</th>
					<th>가격</th>
				</tr>
				<tr>
					<td><input type="text" name="payment_lect_subject"
						value="${cdto.getCurri_subject()}"></td>
					<td><input type="text" name="payment_teacher_name"
						value="${teachername.getMember_name()}"></td>
					<td><input type="text" name="payment_lect_charge"
						value="${ldto.getLect_charge()}"></td>
				</tr>
				<tr>
					<td colspan="3" align="right">${ldto.getLect_charge()}</td>
				</tr>
			</table>
		</span>

		<h3>배송지 정보</h3>
		<span> 배송정보 선택 <input name="express" type="radio" title="거주지"
			value="home" checked><span>거주지</span> <input name="express"
			type="radio" title="새로입력" value="new"><span>새로입력</span> <br>
		<br>
		</span> <span id="homecategory">
			<table>

				<tr>
					<th>받는사람</th>
					<td><input type="text" name="payment_member_name"
						id="reciever" value="${mdto.getMember_name()}" /></td>
				</tr>
				<tr>
					<th>전화번호(휴대폰)</th>
					<td><input type="text" name="payment_member_tel"
						value="${mdto.getMember_tel()}" /></td>
				</tr>

				<tr>
					<th>이메일</th>
					<td><input id="payment_email" name="payment_payer_email" />
				</tr>

				<tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" id="appli_addnum" name="payment_addnum"
						value="${mdto.getMember_addnum()}"> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="appli_address" name="payment_address"
						value="${mdto.getMember_address()}"> <input type="text"
						id="appli_address2" name="payment_address2" placeholder="상세주소">

					</td>
				</tr>
				<tr>
					<th>배송시 유의사항</th>
					<td><input type="text" id="appli_caution"
						name="payment_caution" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="결제정보입력"></td>
				</tr>
			</table>
		</span>
	</form>

	<form action="payment.do" method="post">
		<input type="hidden" name="payment_member_id"
			value="${sessionScope.sessionid }"> <span id="newcategory"
			style="display: none">
			<table>

				<tr>
					<th>받는사람</th>
					<td><input type="text" id="appli_reciever"
						name="payment_member_name" value="${sessionScope.sessionid }" /></td>
				</tr>
				<tr>
					<th>전화번호(휴대폰)</th>
					<td><input id="appli_tel" name="payment_member_tel"
						placeholder="000-0000-0000" />
				</tr>

				<tr>
				<tr>
					<th>이메일</th>
					<td><input id="payment_email" name="payment_payer_email" />
				</tr>

				<tr>
					<th>우편번호</th>
					<td><input type="text" name="payment_addnum"
						id="sample6_postcode" placeholder="우편번호"> <input
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="payment_address" id="sample6_address"
						placeholder="주소"> <input type="text"
						name="payment_address2" id="sample6_address2" placeholder="상세주소">

					</td>
				</tr>
				<tr>
					<th>배송시 유의사항</th>
					<td><input type="text" name="payment_caution" id="caution" /></td>
				</tr>
				<tr>

					<td><input type="submit" value="결제정보입력"></td>
				</tr>
			</table>
		</span>
	</form>
</body>
</html>