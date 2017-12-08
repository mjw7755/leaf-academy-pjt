<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$("#noteDel").bind('click', function(){
		var note_chk_values = [];
		
		$("input[name=n_note]:checked").each(function() {
			  note_chk_values.push($(this).val());
			});
		
		$.ajax({
			url:"sendNoteDelete.do",
			data:{"send_note_chk_values" : note_chk_values},
			
			success:function(data){
				if(data == '1'){
					alert("쪽지를 삭제하였습니다.");
					location.reload();
				}else{
					alert("쪽지삭제를 실패했습니다.")
				}
				
			},
			
		});
		
	});
	
});
function list(page){
    location.href="sendNoteList.do?curPage="+page;
}
</script>
<style type="text/css">
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
#sendnote_form{
	width: 800px;
}
#sendnote_form hr{
	border: thin solid;
	border-color: #cccccc;
}
/*  */
#send_table{
	width: 800px;
	margin-top: 20px;
	border-collapse: collapse;
}
#send_table th{
	background-color: #f4f3f1;
	border-bottom: 1px solid;
	border-bottom-color: #cccccc;
	height: 50px;
}
#send_table tr{
	border-bottom: 1px solid;
	border-bottom-color: #cccccc;
	height: 50px;
}
#send_table td{
	text-align: center;
}
#send_table a{
	text-decoration: none;
	color:#21307a;
	font-weight: bold;
}
/*  */
/* button */
.btn-info {
	color: #fff;
	background-color: #f16022;
	border-color: #46b8da;
}
.btn-info.focus, .btn-info:focus {
	color: #fff;
	background-color: #b64413;
	border-color: #1b6d85;
}
.btn-info:hover {
	color: #fff;
	background-color: #b64413;
	border-color: #973911;
}
.btn2 {
	display: inline-block;
	padding: 1px 12px;
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
	font-size: 14px;
	font-weight: 400;
	/* line-height: 1.42857143; */
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;	
}
/*  */
#page {
	margin-top: 10px;
}
#page a, #page span{
    text-decoration: none;
    font-weight: bold;
    font-size: 15px;
    color: #13b69d;
    margin-right: 5px;
}
</style>
</head>
<body>
	   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_mypage.png">
   		</div>
   	</div>
    <!-- top banner end -->
   		<div id="sendnote_form">
    		<h1>보낸 쪽지함</h1>
		<hr>
		</div>
<table >
	<table id="send_table">
		<thead>
	<!-- 		<th>No.</th> -->
			<th>받은사람</th>
			<th>제 목</th>
			<th>읽은쪽지확인</th>
			<th><button id="noteDel" class="btn2 btn-info">쪽지삭제</button></th>
		</thead>
		<tbody>
			<c:forEach items="${map.list }" var="list">
				<tr>
					<%-- <td>${list.n_id }</td> --%>
					<td>${list.n_recv_id }</td>
					<td><a href="noteSendContent.do?n_id=${list.n_id }">${list.n_title }</a></td>
					<td><c:if test="${list.n_open_date != null}"><img src="resources/ram/open-message.png"> </c:if>
					<c:if test="${list.n_open_date == null}"><img src="resources/ram/message.png"></c:if></td>
					<td><input type="checkbox" id="n_Btn" name="n_note" value="${list.n_id }"></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"  id="page">
					<c:if test="${map.BoardPager.curPage > 1 }">
						<a href="javascript:list('1')"><<</a>
					</c:if> 
					<c:if test="${map.BoardPager.curBlock > 1 }">
						<a href="javascript:list('${map.BoardPager.prevPage }')"><</a>
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
						<a href="javascript:list('${map.BoardPager.nextPage }')">></a>
					</c:if> 
					<c:if test="${map.BoardPager.curPage <= map.BoardPager.totalPage }">
						<a href="javascript:list('${map.BoardPager.totalPage }')">>></a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</table>
</body>
</html>