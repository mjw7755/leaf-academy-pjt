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
		 <input type="button" value="취소" onclick="window.location.href='jageok_list.do' ">
         <input type="reset" value="초기화">
         <input type="submit" value="추가"></td>
      </tr>
   </table>
   </form>
</body>
</html>