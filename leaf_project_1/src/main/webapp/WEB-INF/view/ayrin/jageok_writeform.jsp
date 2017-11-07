<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
   <form action="jageok_write.lcs" >
   <table>
      <%-- <tr>
         <td>NO</td>
         <td>:</td>
         <td><input type="text" name="jageok_id" required="required" value="${ jageok_id }"></td>value="${ jageok_id }"
      </tr> --%>
      
      <tr>
         <td>member_id</td>
         <td>:</td>
         <td><input type="text" name="member_id" required="required" ></td>
      </tr>
      
      <tr>
         <td>TITLE</td>
         <td>:</td>
         <td><input type="text" name="jageok_title" ></td>
      </tr>
      
      <tr>
         <td>DATE</td>
         <td>:</td>
         <td><input type="text" name="jageok_date"></td>
      </tr>
      
      <tr>
         <td>COST</td>
         <td>:</td>
         <td><input type="text" name="jageok_cost"></td>
      </tr>
      
      <tr><td colspan="3"><hr> </td> </tr>
      
            <tr>
               <td>
                  <input type="button" value="취소" style="width: 100%;" 
                                        onclick="window.location.href='jageok_list.lcs' ">
               </td>
               <td>   <input type="reset" value="초기화" style="width: 100%"></td>
               <td>   <input type="submit" value="추가" style="width: 100%"></td>
            </tr>
   </table>
   </form>
</body>
</html>