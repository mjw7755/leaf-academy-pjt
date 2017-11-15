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
<br><br>
<table style="width: 700px">
	<th><b>자주 묻는 질문(FAQ)</b><br></th>
		<c:forEach items="${ list }" var="list">
			<tr>
				<td style="height:20px"><input type="hidden" value="번호:${list.faq_id}"></td>
			</tr>
			<tr>
				<td>
					<dt>${list.faq_title}</dt>
					<dd>${fn:replace(list.faq_content,crlf,'</br>')}</dd>
				</td>
			</tr>	
			<tr>	
			<c:if test="${sessionScope.sessionid == '관리자'}">
				<td><a href="faq_updateform.do?faq_id=${ list.faq_id }"><button>수정</button></a>
				<a href="faq_delete.do?faq_id=${ list.faq_id }"><button>삭제</button></a></td> 
			</c:if>
			</tr>		
		</c:forEach>
</table>
<c:if test="${sessionScope.sessionid == '관리자'}">
<a href="faq_writeform.do"><button>추가</button></a>
</c:if>
<br><br>
</body>
</html>