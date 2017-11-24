<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
#curri_table {
   width: 1200px;
   text-align: center;
   border-collapse: collapse;
   margin-top: 50px;
}
#curri_table td{
   height: 50px;
   border-bottom: 1px solid #cccccc;
}
#curri_table th{
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
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
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
      
      var member_id  = $('#in1_'+s).val();
      var curri_subject  = $('#in2_'+s).val();
      var curri_level  = $('#in3_'+s).val();
      var curri_content  = $('#in4_'+s).val();
      var curri_write_time  = $('#in5_'+s).val();
      var curri_modify_time  = $('#in6_'+s).val();
      var curri_accept  = $('#in7_'+s).val();
      var enabled  = $('#in8_'+s).val();

      $.ajax({
            type:'POST',
            url:'update_by_display_curriculum.do',
            data:{
               curri_id: s,
               member_id: member_id,
               curri_subject: curri_subject,
               curri_level: curri_level,
               curri_content: curri_content,
               curri_write_time: curri_write_time,
               curri_modify_time: curri_modify_time,
               curri_accept: curri_accept,
               enabled: enabled,
               
            },
            success: function(result){
               if(result == '0'){
                
               $('.la_'+s).css("display", "block");
                  $('.in_'+s).css("display", "none");
                    
               $('#btn_update_by_display_yet_'+ s).css("display", "block");
                 $('#btn_update_by_display_now_' + s).css("display", "none");
                 window.location.href='list_backend_curri.do';
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
      <option value="curri" selected="selected">Curriculum </option>
      <option value="lect"> Lecture </option>
      <option value="member">Member</option>
      <option value="book">Book</option>
      <option value="faq">Faq</option>
      <option value="ja">Jageok</option>
      <option value="note">Note</option>
      <option value="notice">Notice</option>
      <option value="pay">Payment</option>
      <option value="qna">QnA</option>
      <option value="rev">Review</option>
      <option value="stu">Student</option>
      <option value="t_i">Teacher_Intro</option>
      <option value="tnotice">Teacher_Notice</option>
   </select>
<div id="search">   
   <form action="search_backend_curri.do" method="post">
      <select name="column">
         <option value="curri_id">Curri-id</option>
         <option value="member_id">Member-id</option>
         <option value="curri_subject">Curri-subject</option>
         <option value="curri_level">Curri-level</option>
         <option value="curri_content">Curri-content</option>
         <option value="curri_write_time">Curri-write_time</option>
         <option value="curri_modify_time">Curri-modify_time</option>
         <option value="curri_accept">Curri-accept</option>
         <option value="enabled">Enable</option>
      </select> 
      <input size="30" type="text" id="keyvalue" name="keyvalue" placeholder="키워드 검색 가능합니다."> 
       <input type="image" src="resources/ram/search.png" id="search_icon">&nbsp;
   </form>
</div>   
   <table id="curri_table">
   <th>Curri_id</th>
   <th>Member_id</th>
   <th>Subject</th>
   <th>Level</th>
   <th>Content</th>
   <th>Write_time</th>
   <th>Modify_time</th>
   <th>Accept</th>
   <th>Enabled</th>
   <th></th>
   <c:forEach items="${clist }" var="list" varStatus="status">
      <tr onclick="test(this)">
         <td>${list.curri_id}</td>
         
         <td><label id="la1_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.member_id}</label>          <input type="text" style="width: 55px;display: none;"   id="in1_${list.curri_id}" class="in_${list.curri_id }"  value="${list.member_id}"></td>
         <td><label id="la2_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_subject}</label>     <input type="text" style="width: 55px;display: none;"   id="in2_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_subject}"></td>
         <td><label id="la3_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_level}</label>        <input type="text" style="width: 55px;display: none;"   id="in3_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_level}"></td>
         <td><label id="la4_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_content}</label>       <input type="text" style="width: 55px;display: none;"   id="in4_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_content}"></td>
         <td><label id="la5_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_write_time}</label>    <input type="text" style="width: 55px;display: none;"   id="in5_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_write_time}"></td>
         <td><label id="la6_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_modify_time}</label>    <input type="text" style="width: 55px;display: none;"   id="in6_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_modify_time}"></td>
         <td><label id="la7_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.curri_accept }</label>       <input type="text" style="width: 55px;display: none;"   id="in7_${list.curri_id}" class="in_${list.curri_id }"   value="${list.curri_accept}"></td>
         <td><label id="la8_${list.curri_id}"  class="la_${list.curri_id}"  style="display:show;">${list.enabled }</label>          <input type="text" style="width: 55px;display: none;"   id="in8_${list.curri_id}" class="in_${list.curri_id }"   value="${list.enabled}"></td>
         <td>
         
         <button type="button"  id="btn_update_by_display_yet_${list.curri_id}"
            onclick="show1('${list.curri_id}')" style="display:show;" class="btn2 btn-info">수 정</button> 
            
         <button type="button"  id="btn_update_by_display_now_${list.curri_id}"
            onclick="show_update('${list.curri_id}')"  style="display:none;" class="btn2 btn-info">완 료</button> 
         </td>
      </tr>
   </c:forEach>   
   </table>

</body>
</html>