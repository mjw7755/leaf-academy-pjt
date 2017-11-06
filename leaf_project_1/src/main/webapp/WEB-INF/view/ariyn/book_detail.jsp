<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt"%>
 
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

         NO. : <input readonly="readonly" type="text" name="book_id" value="${dto.book_id}"><br>
         TITLE : <input type="text" name="book_title" value="${dto.book_title}"><br>
         WRITER : <input type="text" name="book_writer" value="${dto.book_writer}"><br>
         COST : <input type="text" name="book_cost" value="${dto.book_cost}"><br>
        
	<a href="book_updateform.lcs?book_id=${ dto.book_id }"><button>수정</button></a>
	<a href="book_list.lcs"><button>목록</button></a>
	


<%-- 	<table width="700" cellpadding="0" cellspacing="0" border="1">
		<form action="book_updateform.lcs?book_id=${ list.book_id }" method="post">
			<input type="hidden" name="book_id" value="${list.book_id}">
			<tr>
				<td>번호</td>
				<td>${detail.book_id}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${detail.bHit}</td>
			</tr>
			<tr>
				<td>책 제목</td>
				<td><input type="text" name="bName" value="${list.book_title}"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="bTitle" value="${list.book_writer}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><textarea rows="10" name="bContent">${list.book_cost}</textarea></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><textarea rows="10" name="bContent">${detail.bContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
					<a href="list">목록보기</a>
					<a href="book_delete.lcs?book_id=${ list.book_id }">글삭제</a>
					<a href="reply_view?bId=${ detail.bId }">답변</a>
				</td>
			</tr>
		</form>
	</table> --%>
</body>
</html>

