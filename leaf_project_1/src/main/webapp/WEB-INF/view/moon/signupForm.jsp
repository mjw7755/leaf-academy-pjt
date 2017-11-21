<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#banner{
	width:800px;
}
#banner img{
	/* float: right; */
}
.btn-info {
	color: #fff;
	background-color: #5bc0de;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #31b0d5;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #31b0d5;
	border-color: #269abc;
}
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	margin-top:12px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
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
h1{
	margin-bottom: 10px;
}
#submit{
	text-align: center;
}
</style>
<script type="text/javascript">
/* function checkfield(){
	if(document.memberchk.member_pwd.value!=document.memberchk.member_pwd2.value){
		 //비밀번호와 비밀번호확인의 값이 다를 경우
		 
		 alert("입력한 2개의 비밀번호가 일치하지 않습니다.");
		 document.memberchk.member_pwd.focus();
		 exit;
		 
		 }
	
} */
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
function chkDupId(){
	var prmid = $('#member_id').val();
 
	$.ajax({
		type : 'POST',  
		data:{"prmid" : prmid},
		url : 'chkDupId.do',
		success : function(data) {
			var chkRst = data;
			var idReg = /^[A-Za-z0-9]{4,12}$/g;

		if(chkRst == 0) {
		/* alert("등록 가능 합니다.");*/
		if(prmid.length >= 4 && prmid.length <= 12) {
			if( idReg.test( prmid ) ) {
				document.getElementById('member_id2').style.color = "blue";
				document.getElementById('member_id2').innerHTML = "등록 가능 합니다.";
				return;
         	} else {
				document.getElementById('member_id2').style.color = "red";
				document.getElementById('member_id2').innerHTML =  "사용할 수 없는 문자가 있습니다.(영 소, 대문자 숫자만 사용 가능)"; 
          	}
		} else if(prmid.length > 13) {
			document.getElementById('member_id2').style.color = "red";
			document.getElementById('member_id2').innerHTML =  "아이디는 4글자 이상 12글자 이하만 사용 가능 합니다."; 
		}
		
		if(prmid == "") { $("#member_id2").empty(); }
  	 	
			$("#idChk").val('Y'); 
			
	    } else {
		/* alert("중복 되어 있습니다.");*/
			document.getElementById('member_id2').style.color = "red";
			document.getElementById('member_id2').innerHTML =  "중복 되어 있습니다."; 
		}
		
		    $("#idChk").val('N');
		    
	    },
   		error : function(xhr, status, e) { //alert(e); 
   		}
 	});  
}
</script>
<!-- <script type="text/javascript"> 
function insertChk(){
	var frm = document.companyForm; 
	if(!chkVal('member_id','아이디'))
		return false;
	if($("#idChk").val() == 'N'){
		alert('ID체크를 해주세요.'); 
		return;
	}
}
</script> -->	
</head>
<body>
<div id="top_banner">
	<div id="banner">
	<img src="resources/top_banner3.png">
	</div>
</div>
<h1>회원가입</h1><hr><br>
<sf:form method="post" action="signup.do" commandName="dto" name="memberchk" role="form">
	<table>
		<tr>
			<td>아이디 : </td>
			<td><input type="hidden" id="idChk" value="N" />
			<sf:input path="member_id" id="member_id"  onkeyup="chkDupId()"  placeholder="아이디 입력" style="width:200px"/>
			<sf:errors path="member_id" cssClass="error" /><div id="member_id3"></div>
			<div id="member_id2"></div>
			</td>
		</tr>
		<tr>
    		<td><span>암호 : </span></td>
   		    <td><sf:password path="member_pwd" id="member_pwd" placeholder="영어 숫자 특수문자를 조합" style="width:200px"/>
    		    <sf:errors path="member_pwd" cssClass="error" /></td>
    		</tr>
		<tr>
		    <td><span>암호확인 : </span></td>
		    <td>
		        <input type="password" name="pwd_check" onkeyup="checkPwd()"  placeholder="암호 확인" style="width:200px"></input>
		        <div id="checkPwd"></div>
		    </td>
		</tr>			
		<tr>
			<td>이름(Full Name) : </td>
			<td><sf:input path="member_name" placeholder="이름 입력" style="width:200px"/>
				<sf:errors path="member_name" cssClass="error"/></td>
		</tr>
		<tr>
			<td>전화번호(휴대폰) : </td>
			<td><sf:input path="member_tel" placeholder="000-0000-0000" style="width:200px"/>
			<sf:errors path="member_tel" cssClass="error"/></td>
		</tr>
		<tr>
			<td>우편번호 :</td>
			<td><sf:input path="member_addnum" id="sample4_postcode" placeholder="우편번호" style="width:200px"/>
			<sf:errors path="member_addnum" cssClass="error" /><br/>
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<sf:input path="member_address" id="sample4_roadAddress" placeholder="도로명주소" style="width:200px"/>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color: #999"></span>
				<sf:errors path="member_address" cssClass="error" /></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><sf:input path="member_email" placeholder="이메일 입력(aaa@aaa.com)" style="width:200px"/>
				<input type="button" onclick="" value="인증번호전송"/>
			 	<sf:errors path="member_email" cssClass="error" /></td>
		</tr>
		<tr>
			<td>이메일인증 :</td>
			<td><sf:input path="member_email" placeholder="인증번호 입력" style="width:200px"/>
				<input type="button" onclick="" value="인증번호확인"/>
			 	<sf:errors path="member_email" cssClass="error" /></td>
		</tr>
		<tr id="submit">
			<td colspan="2"><input type="button" value="회원가입" onclick="checkfield();" class="btn btn-info">
			<input type="reset" value="리셋" class="btn btn-info"></td>
		</tr>
	</table>
</sf:form>
</body>
</html>