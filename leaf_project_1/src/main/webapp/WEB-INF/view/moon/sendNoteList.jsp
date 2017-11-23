<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<span>보낸 쪽지함</span>
	<hr>
	<table>
		<thead>
			<th>No.</th>
			<th>제 목</th>
			<th>받은사람</th>
			<th>읽은쪽지확인</th>
			<th>쪽지삭제</th>
		</thead>
		<tbody>
			<c:forEach items="${map.list }" var="list">
				<tr>
					<td>${list.n_id }</td>
					<td><a href="noteSendContent.do?n_id=${list.n_id }">${list.n_title }</a></td>
					<td>${list.n_recv_id }</td>
					<td><c:if test="${list.n_open_date != null}">읽음 </c:if><c:if test="${list.n_open_date == null}">읽지않음</c:if></td>
					<td><input type="checkbox" id="n_Btn" name="n_note" value="${list.n_id }"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<c:if test="${map.BoardPager.curPage > 1 }">
						<a href="javascript:list('1')">[처음]</a>
					</c:if> 
					<c:if test="${map.BoardPager.curBlock > 1 }">
						<a href="javascript:list('${map.BoardPager.prevPage }')">[이전]</a>
					</c:if> 
					<c:forEach var="num" begin="${map.BoardPager.blockBegin }" end="${map.BoardPager.blockEnd }">
						<c:choose>
							<c:when test="${num == map.BoardPager.curPage }">
								<span style="color: red">${num }</span>&nbsp;
							</c:when>

							<c:otherwise>
								<a href="javascript:list('${num }')">${num }</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					<c:if test="${map.BoardPager.curBlock <= map.BoardPager.totalBlock }">
						<a href="javascript:list('${map.BoardPager.nextPage }')">[다음]</a>
					</c:if> 
					<c:if test="${map.BoardPager.curPage <= map.BoardPager.totalPage }">
						<a href="javascript:list('${map.BoardPager.totalPage }')">[끝]</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td><button id="noteDel">쪽지삭제</button></td>
			</tr>
		</tbody>
	</table>
</table>
</body>
</html>