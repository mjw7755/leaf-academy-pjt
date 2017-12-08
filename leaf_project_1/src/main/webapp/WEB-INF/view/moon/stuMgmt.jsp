<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   
</script>
<style type="text/css">
   .student_list{
      width:600px;
      float:left;
      margin-left: 30px;
      overflow: auto;
      height: 500px;
   }
   .student_list a{
      text-decoration: none;
      color:#000;
   }
   .student_list hr{
      border: thin solid;
      border-color: #cccccc;
   }
   label{
      float:left;
      font-weight: bold;
      font-size: 20px;
      margin-right: 15px;
   }
   select {
    width: 250px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #1b7817;
    border: 2px solid #2b6728;
    border-radius: 3px;
    }

#first_line{
   text-align: left;
}    
/*  */
#stu_table th{
   border-bottom: 1px solid #cccccc;
   padding-top: 15px;
   padding-bottom: 15px;
   background-color: #f4f3f1;
}
#stu_table td{
   border-bottom: 1px solid #cccccc;
    height: 50px;
    /* font-size: 13px; */
    font-weight: bold;
    text-align: center;
}
#stu_table td a{
   color:#21307a;
}
#stu_table{
   border-collapse: collapse;
   margin-top: 50px;
   width: 600px;
}
/*  */
/* #send{
   margin-top: 20px;
   width:800px;
   text-align: left;
} */

#send input{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #21307a;
    margin-right: 5px;
    /* margin-top: 15px; */
    padding: 5px;
    border: 2px solid;
    border-radius: 4px;
    background-color: #fff;
}
</style>
</head>
<body>
<div class="student_list">
<a href="stuMgmtForm.do"><h1>학생 관리</h1></a>
<hr>
<div id="first_line">
<label>강의 선택 : </label>
      <select id="teacherSelect" onchange="teachertSecletChange()">
         <c:forEach items="${classList}" var="classList">
               <option value="${classList.lect_id}">${classList.lect_name}</option>
         </c:forEach>
      </select>
</div>      
     <%--  <div id="stu_id">
      <table>
         <tr>
            <td width="120px">학생아이디</td>
         </tr>
         <c:forEach items="${studentList}" var="studentList">
         <tr>
            <td>${studentList}</td>
         </tr>
         </c:forEach>
      </table>
      </div> --%>

      <div>
   <table id="stu_table">
      <form action="noteSendForm.do">
      
      <thead>
         <th>학생 아이디</th>
         <th colspan="4">출결</th>
         <th><div id="send"><input type="submit" value="쪽지 보내기"></div></th>
      </thead>
      <tbody>
         <c:forEach items="${studentList}" var="studentList">
            <tr>
               <td>${studentList}</td>
               <td><a href="stuMgmtExcel.do?lect_id=${lect_id }&student_id=${studentList}&chk_str=출석">출석</a></td>
               <td><a href="stuMgmtExcel.do?lect_id=${lect_id }&student_id=${studentList}&chk_str=지각">지각</a></td>
               <td><a href="stuMgmtExcel.do?lect_id=${lect_id }&student_id=${studentList}&chk_str=결석">결석</a></td>
               <td><a href="stuMgmtExcel.do?lect_id=${lect_id }&student_id=${studentList}&chk_str=조퇴">조퇴</a></td>
               <td align="center"><input type="checkbox" name="studentChk" id="studentChk" value="${studentList}"></td>
            </tr>
         </c:forEach>      
      </tbody>
      </form>
   </table>
   </div>
   <script type="text/javascript">
      function teachertSecletChange() {
         var lect_id = $("#teacherSelect").val();
         window.location.href='stuMgmtForm.do?lect_id='+lect_id;
      }
      
      $(function() {
         $("#txtTable").hide();
         var optionObj = document.getElementById("teacherSelect");
         var optionLength = optionObj.options.length;
         for(var i=0; i<optionLength; i++) {
            if (optionObj.options[i].value == "${lect_id}") {
               optionObj.options[i].selected = "selected";
            }
         }
      });
   </script>
   
</div>
</body>
</html>