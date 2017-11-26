<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
#pay{
   width: 800px;
}
#pay hr{
   border: thin solid #cccccc;
}
#notice{
   width: 700px;
   font-size: 13px;
   font-weight: bold;
   color:#21307a;
   text-align: left;
   margin-left: 20px;
}
#notice li{
   margin-bottom: 10px;
}
/*  */
.form-control {
   display: block;
   margin-right: 15px;
   width: 300px;
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
.form-control2 {
   display: block;
   margin-right: 15px;
   width: 150px; 
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
   padding: 6px 12px;
   margin-bottom: 12px;
   margin-top:12px;
   margin-left:5px;
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
/*  */
#home_table th, #new_table th{
   text-align: left;
   padding-right: 15px;
}
#home_table td,#new_table td{
   padding-bottom: 10px;
}
#text_center{
   text-align: center;
}
</style>
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
      <!-- top banner -->
      <div id="top_banner">
         <div id="banner">
         <img src="resources/ram/top_banner_curri.png">
         </div>
      </div>
          <div id="pay">
   <h1>
      결제 진행
   </h1>
<hr>
</div>
      <div id="notice">
   <span>
      <li>교재 / 도서 배송기간 - 교재 / 도서 발송일로 부터 서울: 2~3일, 지방 : 3~4일(일요일 및 법정
         공휴일은 제외)</li>
      <li>교재 / 도서를 함께 구매하신 강좌의 취소는, 먼저 교재가 반송이 되어야 취소하실 수 있습니다.</li>
      <li>교재 결제 시 보너스캐쉬와 이벤트캐쉬는 사용하실 수 없으며,<br> 배송지 정보의 기본주소는 배송주소관리에서
         기본주소로 설정하시기 바랍니다.</li>
      <li>수강중인 강좌와 교재는 수강중 재구매할 수 없습니다. <br>교재 분실*파손 등의 이유로 재구매시
         학습 지원 센터(02-7375-1436) 또는 공지사항을 이용해 주시기 바랍니다
   </li>
      <li>불법으로 구매한 교재 혹은 무단 복제한 교재를 사용할 때는 저작권법에 따라 법적 처벌을 받을 수 있습니다.</li>
   </span>
   </div>
   <input type="hidden" value="${ldto.lect_id }">
   <form action="payment.do" method="post">
    <input type="hidden" name="payment_lect_id" value="${ldto.getLect_id()}" />
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
                  value="${cdto.getCurri_subject()}" class="form-control2"></td>
               <td><input type="text" name="payment_teacher_name"
                  value="${teachername.getMember_name()}" class="form-control2"></td>
               <td><input type="text" name="payment_lect_charge"
                  value="${ldto.getLect_charge()}$" class="form-control2"></td>
            </tr>
<%--             <tr>
               <td colspan="3" align="right">${ldto.getLect_charge()}</td>
            </tr> --%>
         </table>
      </span>

      <h3>배송지 정보</h3>
      <span> 배송정보 선택 
      <input name="express" type="radio" title="거주지" value="home" checked="checked"><span>거주지</span> 
      <input name="express" type="radio" title="새로입력" value="new" ><span>새로입력</span> <br>
      <br>
      </span> <span id="homecategory">
         <table id="home_table">

            <tr>
               <th>받는사람</th>
               <td><input type="text" name="payment_member_name"
                  id="reciever" value="${mdto.getMember_name()}" class="form-control"/></td>
            </tr>
            <tr>
               <th>전화번호(휴대폰)</th>
               <td><input type="text" name="payment_member_tel"
                  value="${mdto.getMember_tel()}" class="form-control"/></td>
            </tr>

            <tr>
               <th>이메일</th>
               <td><input id="payment_email" name="payment_payer_email" class="form-control"/>
            </tr>

            <tr>
            <tr>
               <th style="vertical-align: middle;">우편번호</th>
               <td><input type="text" id="appli_addnum" name="payment_addnum"
                  value="${mdto.getMember_addnum()}" class="form-control"> <!-- <input type="button"
                  onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn3 btn-primary btn-sm"> -->
                  <input type="text" id="appli_address" name="payment_address"
                  value="${mdto.getMember_address()}" class="form-control"> <input type="text"
                  id="appli_address2" name="payment_address2" placeholder="상세주소" class="form-control">

               </td>
            </tr>
            <tr>
               <th>배송시 유의사항</th>
               <td><input type="text" id="appli_caution"
                  name="payment_caution" class="form-control"/></td>
            </tr>
            <tr>
               <td colspan="2" id="text_center"><input type="submit" value="결제정보입력" class="btn2 btn-info"></td>
            </tr>
         </table>
      </span>
   </form>

   <form action="payment.do" method="post">
      <input type="hidden" name="payment_member_id"
         value="${sessionScope.sessionid }"> <span id="newcategory"
         style="display: none">
         <table id="new_table">

            <tr>
               <th>받는사람</th>
               <td><input type="text" id="appli_reciever"
                  name="payment_member_name" value="${sessionScope.sessionid }" class="form-control"/></td>
            </tr>
            <tr>
               <th>전화번호(휴대폰)</th>
               <td><input id="appli_tel" name="payment_member_tel"
                  placeholder="000-0000-0000" class="form-control"/>
            </tr>

            <tr>
            <tr>
               <th>이메일</th>
               <td><input id="payment_email" name="payment_payer_email" class="form-control"/>
            </tr>

            <tr>
               <th>우편번호</th>
               <td><input
                  type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn3 btn-primary btn-sm">
               <input type="text" name="payment_addnum"
                  id="sample6_postcode" placeholder="우편번호" class="form-control">
                  <input type="text" name="payment_address" id="sample6_address"
                  placeholder="주소" class="form-control"> <input type="text"
                  name="payment_address2" id="sample6_address2" placeholder="상세주소" class="form-control">

               </td>
            </tr>
            <tr>
               <th>배송시 유의사항</th>
               <td><input type="text" name="payment_caution" id="caution" class="form-control"/></td>
            </tr>
            <tr>

               <td colspan="2" id="text_center"><input type="submit" value="결제정보입력"class="btn2 btn-info"></td>
            </tr>
         </table>
      </span>
   </form>
</body>
</html>