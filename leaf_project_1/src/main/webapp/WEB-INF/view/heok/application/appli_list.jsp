<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

<script type ="text/javascript">
	$(document).ready(fucntion(){
			
	$("input:radio[name='express']").change(fucntion(){
		var express=this.value;
		if(express=="home"){
			$("#newcategory").hide();
			$("#homecategory").show();
			
		}else if(express =="new"){
			$("#newcategory").show();
			$("#homecategory").hide();
		}		
			
		});
	});

</script>

<body>
<h3>결제진행</h3>
<span>
	<li>교재 / 도서 배송기간 - 교재 / 도서 발송일로 부터 서울: 2~3일, 지방 : 3~4일(일요일 및 법정 공휴일은 제외)</li>
	<li>교재 / 도서를 함께 구매하신 강좌의 취소는, 먼저 교재가 반송이 되어야 취소하실 수 있습니다.</li>
	<li>교재 결제 시 보너스캐쉬와 이벤트캐쉬는 사용하실 수 없으며, 배송지 정보의 기본주소는 배송주소관리에서 기본주소로 설정하시기 바랍니다.</li>
	<li>수강중인 강좌와 교재는 수강중 재구매할 수 없습니다.
	<br>교재 분실*파손 등의 이유로 재구매시 학습 지원 센터(02-7375-1436) 또는 공지사항을 이용해 주시기 바랍니다</li>
	<li>불법으로 구매한 교재 혹은 무단 복제한 교재를 사용할 때는 저작권법에 따라 법적 처벌을 받을 수 있습니다.</li>
</span>
<br>

<h3>주문확인</h3>
<span>
	<table>
		<tr>
			<th>구매강좌명</th>
			<th>강사명</th>
			<th>가격</th>
		</tr>
		<tr>
			<td>${curri_subject}</td>
			<td>${member_id}</td>
			<td>${lect_charge}</td>
		</tr>
		<tr>
			<td colspan="3" align="right">${dto.lect_charge}</td>
		</tr>
	</table>
</span>

<h3>배송지 정보</h3>
<span>
배송정보 선택
	<input name="express" type="radio" title="거주지" value="home" checked><span>거주지</span>
	<input name="express" type="radio" title="새로입력" value="new"><span>새로입력</span>
	<br><br>
</span>
	<span id = "homecategory">
		<table>
		
		<tr>
			<th>받는사람</th>
			<td><input type="text" id="reciever" value="${dto.appli_reciever}"/></td>
		</tr>	
		<tr>
			<th>전화번호(휴대폰)</th>
			<td><input type="text"value="${dto.appli_tel}"/>
			</tr>

		<tr>
			<th>우편번호 </th>
			<td>
				<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999"></span>
				<input type="text" value="${dto.appli_addnum}" id="appli_addnum" />
				<input type="text" value="${dto.appli_address}" id="appli.address"/>
			</td>
		</tr>
		<tr>
			<th>배송시 유의사항</th>
			<td><input type="text" id="caution"/></td>
		</tr>
		</table>
	</span>
	
	
	<span id = "newcategory" style="display:none">
		<table>
		
		<tr>
			<th>받는사람</th>
			<td><input type="text" id="reciever" value="${appli_reciever }" /></td>
		</tr>	
		<tr>
			<th>전화번호(휴대폰)</th>
			<td><form:input path="appli_tel" placeholder="000-0000-0000"/>
			<form:errors path="appli_tel" cssClass="error"/></td>
			</tr>

		<tr>
			<th>우편번호 </th>
			<td>
				<form:input path="appli_addnum" id="sample4_postcode" placeholder="우편번호" />
				<form:errors path="appli_addnum" cssClass="error" /><br/>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<form:input path="appli_address" id="sample4_roadAddress" placeholder="도로명주소"/>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color: #999"></span>
				<form:errors path="appli_address" cssClass="error" />
			</td>
		</tr>
		<tr>
			<th>배송시 유의사항</th>
			<td><input type="text" id="caution"/></td>
		</tr>
		</table>
	</span>
</body>
</html>