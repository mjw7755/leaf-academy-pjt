<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js"></script> 
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
<style type="text/css">
.error {
	color: red;
}
span{
  font-size: 15px;
}
#checkMsg{
	
  font-size: 15px;
}
#checkPwd{
  color : red;
  font-size: 15px;
}

#member_id2{
  color : red;
  font-size: 15px;
}

</style>
<script type="text/javascript">
function checkfield(){
	var f1 = document.forms[0];
	  var pw1 = f1.member_pwd.value;
	  var pw2 = f1.pwd_check.value;
	  var prmpw = $('#member_pwd').val();
	  
	if(pw1 != pw2){
		alert("암호확인을 해주세요");
		  return false;
	}
	document.memberchk.submit();
}
function checkPwd(){
	  var f1 = document.forms[0];
	  var pw1 = f1.member_pwd.value;
	  var pw2 = f1.pwd_check.value;
	  var prmpw = $('#member_pwd').val();
	  var pwReg = /^((?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,16})$/g;
	  
	  if(pw1!=pw2){
	   
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	   if(pw2 == ""){
			  $("#checkPwd").empty();
		  }
	   if(prmpw == ""){
			  $("#checkPwd").empty();
		  }
	  }else{
		  if(prmpw.length >=4 && prmpw.length <=16){
			  if(pwReg.test( prmpw )){
	   document.getElementById('checkPwd').style.color = "blue";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
			  }else{
				  document.getElementById('checkPwd').style.color = "red";
				   document.getElementById('checkPwd').innerHTML = "영문자 숫자 특수문자를 조합해주세요."; 
			  }
		  }else{
			  document.getElementById('checkPwd').style.color = "red";
			   document.getElementById('checkPwd').innerHTML = "비밀번호는 4글자 이상 16글자 이하만 사용 가능 합니다."; 
		  }
	  }
	  
	 }
</script>
<script type="text/javascript"> 
function insertChk(){
	  
	  var frm = document.companyForm; 
	  
	  if(!chkVal('member_id','아이디'))return false;
	  if($("#idChk").val() == 'N'){alert('ID체크를 해주세요.'); return;}
	  

	  </script>	
</head>
<body>
<br><br><br><br><br><br>
<sf:form method="post" action="member_bye.do" commandName="dto" name="memberchk">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="member_id" id="member_id" value="${dto.member_id}" readonly="readonly"/></td>
		</tr>
		<tr>
     	    <td><span>암호 </span></td>
    		<td><sf:password path="member_pwd" id="member_pwd" placeholder="영어 숫자 특수문자를 조합"/>
     		    <sf:errors path="member_pwd" cssClass="error" /></td>


	<tr>
	<!-- <input type="submit" value="수정하기"> -->
	<td><input type="submit" value="수정완료" ></td>
				<td><input type="reset" value="취소"></td>
	</tr>			
	</table>
	
				
</sf:form>
<br><br><br><br><br><br>
</body>
</html>
<%-- LEVEL : <input type="readonly" name="member_level" value="${dto.member_level}"><br>
ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>