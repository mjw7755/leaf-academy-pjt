<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
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
<br><br><br><br><br><br>
   <form action="member_write.do" >
   <table>
      <tr>
         <td>ID</td>
         <td>:</td>
         <td><input type="text" name="member_id" required="required" value="${ member_id }"></td>
      </tr>
      
      <tr>
         <td>NAME</td>
         <td>:</td>
         <td><input type="text" name="member_name" required="required" ></td>
      </tr>
      
      <tr>
         <td>PWD</td>
         <td>:</td>
         <td><input type="text" name="member_pwd" ></td>
      </tr>
      
      <tr>
         <td>TEL</td>
         <td>:</td>
         <td><input type="text" name="member_tel"></td>
      </tr>
      
      <tr>
         <td>EMAIL</td>
         <td>:</td>
         <td><input type="text" name="member_email"></td>
      </tr>
      
      <tr><td colspan="3"><hr> </td> </tr>
      
            <tr>
               <td>
                  <input type="button" value="취소" style="width: 100%;" 
                                        onclick="window.location.href='member_list.do'" class="btn btn--sm btn--green">
               </td>
               <td>   <input type="reset" value="초기화" style="width: 100%" class="btn btn--sm btn--green"></td>
               <td>   <input type="submit" value="추가" style="width: 100%" class="btn btn--sm btn--green"></td>
            </tr>
   </table>
   </form>
<br><br><br><br><br><br>
</body>
</html>