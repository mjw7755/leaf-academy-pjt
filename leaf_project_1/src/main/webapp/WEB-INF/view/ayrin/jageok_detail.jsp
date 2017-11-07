<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
 
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

         NO. : <input readonly="readonly" type="text" name="jageok_id" value="${dto.jageok_id}"><br>
         TITLE : <input type="text" name="jageok_title" value="${dto.jageok_title}"><br>
         DATE : <input type="text" name="jageok_date" value="${dto.jageok_date}"><br>
         COST : <input type="text" name="jageok_cost" value="${dto.jageok_cost}"><br>
        
	<a href="jageok_updateform.do?jageok_id=${ dto.jageok_id }"><button>수정</button></a>
	<a href="jageok_list.do"><button>목록</button></a>
	


<%-- 	<table width="700" cellpadding="0" cellspacing="0" border="1">
		<form action="jageok_updateform.do?jageok_id=${ list.jageok_id }" method="post">
			<input type="hidden" name="jageok_id" value="${list.jageok_id}">
			<tr>
				<td>번호</td>
				<td>${detail.jageok_id}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${detail.bHit}</td>
			</tr>
			<tr>
				<td>책 제목</td>
				<td><input type="text" name="bName" value="${list.jageok_title}"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="bTitle" value="${list.jageok_date}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><textarea rows="10" name="bContent">${list.jageok_cost}</textarea></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><textarea rows="10" name="bContent">${detail.bContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
					<a href="list">목록보기</a>
					<a href="jageok_delete.do?jageok_id=${ list.jageok_id }">글삭제</a>
					<a href="reply_view?bId=${ detail.bId }">답변</a>
				</td>
			</tr>
		</form>
	</table> --%>
</body>
</html>

