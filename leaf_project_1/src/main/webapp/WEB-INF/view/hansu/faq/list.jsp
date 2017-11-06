<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
   function hide(){
      alert("해당내용이 삭제됩니다");
   }
   
   function multiDelete(){
	   var t= document.getElementsByName("faq_id");
	   var sum = new Array();
	   var j=0;
	   for (var i =0 ; i<t.length; i++){
	      if(t[i].checked){
	         sum[j] = t[i].value;
	         j=j+1;
	         /* alert(t[i].value); */
	      }
	   }
	   /* alert("test.do?gno="+sum); */
	   window.location.href="faq_multidelete.do?faq_id="+sum;
	}

	<!--
	function hide(){
	   var el = document.querySelectorAll('#multi');
	   for (var i =0 ; i<el.length; i++){
	      if(el[i].style.display !='table-cell' )
	         el[i].style.display = 'table-cell';
	      else 
	         el[i].style.display = 'none';
	   }
	}

	function test(params){
	   var dname = params.innerHTML.split('<td>')[2].split('</td>')[0];
	   document.getElementsByName('keyvalue')[0].value=dname;
	}
	//-->
</script>
<style type="text/css">
table {
   width: 100%;
   text-align: center;
   font-size: 20px;
   
}
table th{
   background-color: black;
   color: white;
}
table tr:nth-child(even) {
   background-color: lightgray;
}
table tr:HOVER {
   color: white;
   background-color: black;
}
table tr:ACTIVE{
   color: black;
   font-weight:bold;
   background-color: lightyellow;
}
</style>
<!-- <script type="text/javascript">

function hide(){
   alert("해당 내용이 삭제됩니다.");
}


</script> -->
</head>
<body>
   <table>
      <tr>
         <th>faq_id</th>
         <th>faq_title</th>
         <th>faq_content</th>
  		 <th><a href="faq_writeform.do"><button>추가</button></a></th>
 		 <th colspan="2"><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>     
      </tr>
      <c:forEach items="${ list }" var="list">
         <tr>
            <td>${list.faq_id}</td>
            <td><a href="faq_detail.do?faq_id=${ list.faq_id }" style="text-decoration: none;">${list.faq_title}</a></td>
            <td>${list.faq_content}</td>
            <td><a href="faq_updateform.do?faq_id=${ list.faq_id }"><button id="edit">수 정</button> </a></td>
            <td><a href="faq_delete.do?faq_id=${ list.faq_id }"><button id="delete">삭제</button></a></td>
             <td id="multi"><input type="checkbox" style="width: 30px;" name="faq_id" value="${ list.faq_id }"></td>
         </tr>
      </c:forEach>
   </table>
      	<form action="faq_search.do" method="post">
		<select name="column">
			<option value="faq_id">아이디</option>
			<option value="faq_title">제목</option>
			<option value="faq_content">내용</option>
		</select>
		<input type="text" name="keyvalue">
		<input type="submit" value="검색">
	</form>
</body>
</html>