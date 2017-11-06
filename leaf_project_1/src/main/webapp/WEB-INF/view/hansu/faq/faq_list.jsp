<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>자주 묻는 질문(FAQ)</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
dl {
	width: 90%;
	height: 90%:
	margin: 50px auto;
}

dt {
	cursor: pointer;
}

dd {
	display: none;
	margin: 0;
}


</style>
<script>
 $( function () {
    //dt 를 클릭했을 때
	 $('dt').click(function() {
		  if( $('+dd',this).css('display')=='none' ) {  
		   $('dd').slideUp('fast');                       
		   $('+dd',this).slideDown('fast');
		  }else{
			  $('dd').slideUp('fast'); 
		  }
		  

		  
		 });

} );  

    </script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<table>
		<th><b>자주 묻는 질문(FAQ)</b></th><br> 
			<c:forEach items="${ list }" var="list">
				<tr>
					<td>번호:</td><td>${list.faq_id }</td>
				</tr>
				<tr>
					<td><dt>${list.faq_title}</dt>
					<dd>${fn:replace(list.faq_content,crlf,'</br>')}</dd>
					</td>
				</tr>	
				<tr>	
					<td><a href="faq_updateform.do?faq_id=${ list.faq_id }"><button>수 정</button></a></td>
      	 		    <td><a href="faq_delete.do?faq_id=${ list.faq_id }"><button>삭 제</button></a></td> 
				</tr>		
			</c:forEach>
			</table>

<a href="faq_writeform.do"><button>추 가</button></a>

</body>
</html>