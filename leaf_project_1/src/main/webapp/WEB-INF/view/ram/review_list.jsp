<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript">
	function hide() {
		alert("해당내용이 삭제됩니다");
	}

	function multiDelete() {
		var t = document.getElementsByName("review_id");
		var sum = new Array();
		var j = 0;
		for (var i = 0; i < t.length; i++) {
			if (t[i].checked) {
				sum[j] = t[i].value;
				j = j + 1;
				/* alert(t[i].value); */
			}
		}
		/* alert("test.do?gno="+sum); */
		window.location.href = "review_multidelete.do?review_id=" + sum
				+ "&teacher_id=${param.teacher_id}";
	}
</script>
</head>
<body>
	수강후기
	<h3>

		<table>
			<tr>
				<th>제목</th>
				<th>등록자</th>
				<c:if test="${ sessionScope.sessionid == '관리자'}">
				<th><a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a></th>
				</c:if>
			</tr>
			<c:forEach items="${ list }" var="list">
				<tr>
					<td><a
						href="review_content.do?review_id=${ list.review_id }&teacher_id=${list.teacher_id}">${list.r_headline}</a></td>
					<td>${list.member_id }</td>
					
					<c:if test="${sessionScope.sessionid == list.member_id or sessionScope.sessionid == '관리자'}">
					<td><a
						href="review_updateform.do?review_id=${ list.review_id }"">수정</a></td>
					<td><a
						href="review_delete.do?review_id=${ list.review_id }&teacher_id=${param.teacher_id}">
							<button id="delete" onclick="hide()">삭 제</button>
					</a></td>
					</c:if>
					<c:if test="${ sessionScope.sessionid == '관리자'}">
					<td id="multi"><input type="checkbox" style="width: 30px;"
						name="review_id" value="${ list.review_id }"></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<a href="review_writeform.do?teacher_id=${ dto.teacher_id }"">글쓰기</a>

		<div>
			<c:if test="${param.page>5}">
				<c:if test="${flag == 'list' }">
					<a class="button btn-prev"
						href="review_list.do?page=${startPage-1}&teacher_id=${dto.teacher_id}">이전</a>
				</c:if>
				<c:if test="${flag == 'search' }">
					<a class="button btn-prev"
						href="review_search.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}&teacher_id=${dto.teacher_id}">이전</a>
				</c:if>
			</c:if>
			<c:forEach var="i" begin="0" end="4" varStatus="status">
				<c:if test="${countPage>=startPage+i}">
					<c:if test="${flag == 'list' }">
						<a class="strong"
							href="review_list.do?page=${startPage+i}&teacher_id=${dto.teacher_id}">${startPage+i}</a>
						</li>
					</c:if>
					<c:if test="${flag == 'search' }">
						<a class="strong"
							href="review_search.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}&teacher_id=${dto.teacher_id}">${startPage+i}</a>
						</li>
					</c:if>

				</c:if>
			</c:forEach>
			<c:if test="${countPage>=startPage+5}">
				<c:if test="${flag == 'list' }">
					<a class="strong"
						href="review_list.do?page=${startPage+5}&teacher_id=${dto.teacher_id}">다음</a>
					</li>
				</c:if>
				<c:if test="${flag == 'search' }">
					<a class="strong"
						href="review_search.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}&teacher_id=${dto.teacher_id}">다음</a>
					</li>
				</c:if>

			</c:if>
		</div>
		<form action="review_search.do" method="post">
			<select name="column">
				<option value="member_id">작성자</option>
				<option value="r_headline">제목</option>
			</select> <input type="text" name="keyvalue"> <input type="submit"
				value="검색">
		</form>
</body>
</html>