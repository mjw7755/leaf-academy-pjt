<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#noteDel").bind('click', function(){
		var note_chk_values = [];
		
		$("input[name=n_note]:checked").each(function() {
			  note_chk_values.push($(this).val());
			});
		
		alert(note_chk_values);
		
		$.ajax({
			url:"noteDelete.do",
			data:{"note_chk_values" : note_chk_values},
			
			success:function(data){
				if(data == '1'){
					alert("쪽지를 삭제하였습니다.");
				}else{
					alert("쪽지삭제를 실패했습니다.")
				}
				
			},
			
		});
		
	});
	
});
function list(page){
    location.href="noteList.do?curPage="+page;
}
</script>
</head>
<body>
	<span>쪽지함</span>
	<hr>
	<table>
		<thead>
			<th>No.</th>
			<th>제 목</th>
			<th>보낸사람</th>
			<th>보낸시간</th>
			<th>쪽지삭제</th>
		</thead>
		<tbody>
			<c:forEach items="${map.list }" var="list">
				<tr>
					<td>${list.n_id }</td>
					<td><a href="noteContent.do?n_id=${list.n_id }">${list.n_title }</a></td>
					<td>${list.n_send_id }</td>
					<td>${list.n_write_date }</td>
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
				<td><button id="noteDel">쪽지삭제</button></td><td><a href="sendNoteList.do">보낸쪽지함</a><a href="noteSendForm.do">쪽지 보내기</a></td>
			</tr>
		</tbody>
	</table>
</body>
</html>