<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#jageokwriteTable {
   width: 800px;
   text-align: center;
}
#jageokwriteTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
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
    text-shadow: 0 1px 1px #c4c4c4;
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
font-size: 0.5em; }
</style>
</head>
<body>
   <form action="jageok_write.do" >
   <table id="jageokwriteTable">
      <%-- <tr>
         <td>NO</td>
         <td>:</td>
         <td><input type="text" name="jageok_id" required="required" value="${ jageok_id }"></td>value="${ jageok_id }"
      </tr> 
      
      <tr>
         <td>member_id</td>
         <td>:</td>
         <td><input type="text" name="member_id" required="required" ></td>
      </tr> --%>
      
      <tr>
         <td id="whqrp">자격증 : </td>
         <td><input type="text" name="jageok_title" style="width: 100%;"></td>
      </tr>
      
      <tr>
         <td id="whqrp">시험일 : </td>
         <td><input type="text" name="jageok_date" style="width: 100%;"></td>
      </tr>
      
      <tr>
         <td id="whqrp">비용 : </td>
         <td><input type="text" name="jageok_cost" style="width: 100%;"></td>
      </tr>
      <tr>
		 <td colspan="2">
		 <input type="button" value="취소" onclick="window.location.href='jageok_list.do'" class="btn btn--sm btn--green">
         <input type="reset" value="초기화" class="btn btn--sm btn--green">
         <input type="submit" value="추가" class="btn btn--sm btn--green"></td>
      </tr>
   </table>
   </form>
</body>
</html>