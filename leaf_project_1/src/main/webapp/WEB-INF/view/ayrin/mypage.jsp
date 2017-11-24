<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

$(function(){
	$("#passchk").click(function(){
		var passwd = $("#member_pwd_1").val();
			$.ajax({
				url:"member_del.do",
				type:"post",
				data:{"passwd":passwd},
				success:function(data){
					//var res = JSON.parse(data);
					if(data==0){
						alert("암호가 틀렸습니다.");
						$("#member_pwd_1").val("");
					}else{
						alert("회원탈퇴가 완료되었습니다.");
						location.href = 'main.do';
				}
			}
		});
	});
});
</script>
<!-- <style type="text/css">
.error {
	color: red;
}
/* span{
  font-size: 15px;
} */
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
</style> -->
<script type="text/javascript">
function checkfield(){
	var f1 = document.forms[0];
	  var pw1 = f1.member_pwd.value;
	  var pw2 = f1.pwd_check.value;
	  var prmpw = $('#member_pwd').val();
	if(pw1 != pw2){
		alert("암호확인을 해주세요");
		history.back();
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
function insertChk(){	  
	  var frm = document.companyForm; 
	  if(!chkVal('member_id','아이디'))return false;
	  if($("#idChk").val() == 'N'){
		  alert('ID체크를 해주세요.'); 
		  return;
	  }
}
</script>
<script>
$(function() {
   // Hide all elements which id starts with text.
   $("#attendance_icon").hide();
   $("#grade_icon").hide();
   $("#lecture_icon").hide();
   $("#notice_icon").hide();
   $("#student_care_icon").hide();
   
   $("#member_history").hide();
   $("#member_bye").hide();
   
   $("#attendance").hover(function() {
      $("#attendance_icon").show()
   }, function() {
      $("#attendance_icon").hide();
   });
   $("#grade").hover(function() {
      $("#grade_icon").show()
   }, function() {
      $("#grade_icon").hide();
   });
   $("#lecture").hover(function() {
      $("#lecture_icon").show()
   }, function() {
      $("#lecture_icon").hide();
   });
   $("#notice").hover(function() {
      $("#notice_icon").show()
   }, function() {
      $("#notice_icon").hide();
   });
   $("#student_care").hover(function() {
      $("#student_care_icon").show()
   }, function() {
      $("#student_care_icon").hide();
   });
   
   $("#attendance").click(function() {
		$("#member_history").hide();
		$("#member_bye").hide();
		$("#member_info").show();
	});
	$("#lecture").click(function() {
		$("#member_info").hide();
		$("#member_bye").hide();
		$("#member_history").show();
	});
	$("#grade").click(function() {
		$("#member_info").hide();
		$("#member_history").hide();
		$("#member_bye").show();
	});
});
</script>
<style type="text/css">
.my_page {
   width: 100%;
}
/* 내용 div */
#member_info {
   /* border: 1px solid; */
   width: 600px;
   height: 500px;
   margin-left: 30px;
   float: left;
}
#member_history {
   /* border: 1px solid; */
   width: 600px;
   height: 500px;
   margin-left: 30px;
   float: left;
}
#member_bye {
	/* border: 1px solid; */
	width: 600px;
	height: 500px;
	margin-left: 30px;
	float: left;
}
/* mypage text */
#my_page_text {
   width: 100%;
   height: 150px;
   background-color: #1b7817;
   color: #fff;
   font-size: 25px;
   font-weight: bold;
   text-align: center;
}
/* 메뉴하위내용 */
#attendance, #grade, #lecture, #notice, #student_care {
   text-align: left;
   /* padding: 10px 0px 10px 10px; */
   padding-bottom: 10px;
   padding-left: 10px;
   padding-top: 10px;
   border-bottom: 1px solid;
   font-weight: 700;
   color: #949694;
}
#attendance :hover, #grade :hover, #lecture :hover, #notice :hover,   #student_care :hover {
   color: #1b7817;
   font-weight: 900;
   height: 38px;
}
#attendance_icon, #grade_icon, #lecture_icon, #notice_icon,   #student_care_icon {
   color: #1b7817;
   font-weight: bold;
   float: right;
   height: 100%;
}
 #contents1 { 
	margin-top: 20px;
 } 
 #contents1 td{ 
	padding-bottom: 10px;
 } 
.btn {
       display: inline-block;
    border: none;
    border-radius: .3em;
    -webkit-box-shadow: inset 0 0 0 1px #323232, inset 0 -0.25em 0 #9f9e9e, 0 0.25em 0.25em #666666;
    /* box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05); */
    color: #000;
    cursor: pointer;
    font-family: 'Raleway', sans-serif;
    font-weight: bold;
    line-height: 1.5;
    letter-spacing: 1px;
    padding: .5em 1.5em .75em;
    position: relative;
    text-decoration: none;
    /* text-shadow: 0 1px 1px #c4c4c4; */
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    /* margin-left: 10px; */
}
.btn:active {
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
margin-top: .25em;
padding-bottom: .5em; }
.btn:active, .btn:focus {
outline: none; }
.btn--green {
    background-color: #fff; }
.btn--green {
font-size: 1em; }
.btn--sm {
font-size: 0.6em; }
#rkdnsep{
	text-align: center;
}
#mypage_form hr{
	border: thin solid;
	border-color: #cccccc;
}
#text{
	padding-right: 30px;
    font-size: 13px;
    font-weight: bold;
    width: 110px;
}
/*  */
.form-control {
	/* display: block; */
    margin-right: 10px;
    /* width: 100%; */
    /* height: 34px; */
    padding: 6px 12px;
    /* font-size: 14px; */
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
/*  */
.btn3 {
	display: inline-block;
    padding: 4px 12px;
    width:100px;
    margin-bottom: 0;
    /* margin-top: 12px; */
    font-size: 12px;
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
/*  */
#member_bye_table {
	margin-top: 20px;
}
#member_bye_table td{
	padding-bottom: 10px;
}
</style>
</head>
<body>
<div class="my_page">
     
   <div id="member_info">
   		<sf:form method="post" action="member_modify.do" commandName="dto" name="memberchk">
   		<div id="mypage_form">
    		<h1>개인정보 수정</h1>
		<hr>
		</div>
	<table id="contents1">
		<tr>
			<td id="text">아이디 </td>
			<td id="text">${dto.member_id}</td>
		</tr>
		<tr>
     	    <td id="text"><span>암호  </span></td>
    		<td><sf:password path="member_pwd" id="member_pwd" placeholder="영어 숫자 특수문자를 조합" class="form-control"/>
     		    <sf:errors path="member_pwd" cssClass="error" /></td>
  	    </tr>
  	    <tr>
    		<td id="text"><span>암호확인  </span></td>
     	<td>
       		<input type="password" name="pwd_check" onkeyup="checkPwd()"  placeholder="암호 확인" class="form-control"></input>
       	 	<div id="checkPwd"></div>
     		</td>
 		 </tr>
		<tr>
			<td id="text">이름(Full Name) </td>
			<td><sf:input path="member_name" placeholder="이름 입력" value="${dto.member_name}" class="form-control"/>
			<sf:errors path="member_name" cssClass="error"/></td>
		</tr>
		<tr>
			<td id="text">전화번호(휴대폰)  </td>
			<td><sf:input path="member_tel" placeholder="000-0000-0000" value="${dto.member_tel}" class="form-control"/>
			<sf:errors path="member_tel" cssClass="error"/></td>
	    </tr>
		<tr>
			<td id="text">우편번호  </td>
			<td><sf:input path="member_addnum" id="sample4_postcode" placeholder="우편번호" value="${dto.member_addnum}" class="form-control"/>
			<sf:errors path="member_addnum" cssClass="error" /><br/>
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn3 btn-primary btn-sm"><br>
			<sf:input path="member_address" id="sample4_roadAddress" placeholder="도로명주소" value="${dto.member_address}" class="form-control"/>
			<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color: #999"></span>
			<sf:errors path="member_address" cssClass="error" /></td>
		</tr>
		<tr>
			<td id="text">이메일  </td>
			<td><sf:input path="member_email"  placeholder="이메일 입력" value="${dto.member_email}" class="form-control"/>
		    <sf:errors path="member_email" cssClass="error" /></td>
		</tr>
	<tr id="rkdnsep">
		<!-- <input type="submit" value="수정하기"> -->
		<td colspan="2">
			<input type="submit" value="수정완료" onclick="checkfield();" class="btn btn--sm btn--green">
			<input type="reset" value="취소" class="btn btn--sm btn--green">
		</td>
	</tr>			
	</table>
	
				
</sf:form>
    
   </div>
   <div id="member_history">
   <div id="mypage_form">
    		<h1>결제내역 조회</h1>
		<hr>
		</div>
      <table>
         <tr>
            <td>내역어케?? </td>
            <td><input readonly="readonly" type="text" name="member_id" value="${dto.member_id}" style="width:300px"></td>
         </tr>
         <tr>
            <td>내역어케?? </td>
            <td><input readonly="readonly" name="member_name" value="${dto.member_name}" style="width:300px"></td>
         </tr>
         <tr>
            <td>내역어케?? </td>
            <td><input type="text" name="member_pwd" value="${dto.member_pwd}" style="width:300px"></td>
         </tr>
         <tr>
            <td>내역어케?? </td>
            <td><input type="text" name="member_tel" value="${dto.member_tel}" style="width:300px"></td>
         </tr>
         <tr>
            <td>내역어케?? </td>
            <td><input type="text" name="member_email" value="${dto.member_email}" style="width:300px"></td>
         </tr>
      </table>
   </div>
   <div id="member_bye"> 
      	<div id="mypage_form">
    		<h1>회원 탈퇴</h1>
		<hr>
		</div>
		<table id="member_bye_table">
			<tr>
			   <td id="text">아이디</td>
			   <td id="text">${dto.member_id}</td>
			</tr>
			<tr>
			    <td id="text"><span>암호 </span></td>
			    <td><input type="password" name="member_pwd" id="member_pwd_1" class="form-control"/>
			<tr id="rkdnsep">
				<!-- <input type="submit" value="수정하기"> -->
				<td colspan="2">
					<input type="button" value="탈퇴하기" id="passchk" class="btn btn--sm btn--green">
					<input type="reset" value="취소" class="btn btn--sm btn--green">
				</td>
			</tr>         
		</table>
	</div>
</div>
</body>
</html>