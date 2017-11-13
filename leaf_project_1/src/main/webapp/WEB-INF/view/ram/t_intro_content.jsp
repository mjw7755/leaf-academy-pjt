<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/ram/jquery-ui.js"></script>
<link href="css/ram/jquery-ui.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<script type="text/javascript">
	
	$(function() {
		var writeDIV = document.getElementById("writeDIV");
		$("#writeDIV").hide();
		$("#moreReview").hide();
		
		$("#modalButton").button();
		$("#moreReview").dialog({
			autoOpen : false,
			width : 400,
			modal : true,
			buttons : [ {
				text : "ok",
				click : function() {
					$(this).dialog("close");
					window.location.replace("t_intro_content.do?teacher_id=${param.teacher_id}");
				}

			}, {
				text : "cancel",
				click : function() {
					$(this).dialog("close");
					window.location.replace("t_intro_content.do?teacher_id=${param.teacher_id}");
				}
			} ]

		});

		$("#modalButton").click(function(e) {
			$("#moreReview").dialog("open");
			e.preventDefault();
			
			$.ajax({
				url:"review_list.do",
				data:{
					"r_headline" : r_headline,
					"r_content" : r_content	
				},
				success:function(data){
					alert(data);
				}
				
			})
		});

		$("#writeButton").on('click',function() {
			$("#aaa").hide();
			$("#writeDIV").show();
		});

	});
	function hide() {
		alert("해당내용이 삭제됩니다");
	}
</script>
<style type="text/css">
.content {
	width: 100%;
}

.content_t {
	width: 800px;
}

#teacher_img td {
	padding-right: 20px;
	width: 250px;
}

#teacher_name {
	height: 30px;
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="content">
		<input type="hidden" value="${dto.teacher_id}"> <br>
		<table class="content_t">
			<tr id="teacher_img">
				<td rowspan="4"><img src="resources/${dto.teacher_image}"
					style="width: 240px; height: 240px"></td>
			</tr>
			<tr id="teacher_name">
				<td>${dto.member_id}</td>
			</tr>
			<tr>
				<td>약력</td>
				<td>${dto.teacher_introduce}</td>
			</tr>
		</table>
		<!-- <input type="button" value="목록보기" onclick="window.location.href='t_intro_list.do' "> -->

		<c:if
			test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
			<a href="t_intro_updateform.do?teacher_id=${dto.teacher_id }">
				<button id="edit">수 정</button>
			</a>

			<a href="t_intro_delete.do?teacher_id=${ dto.teacher_id }">
				<button id="delete" onclick="hide()">삭 제</button>
			</a>
		</c:if>
		<br>
		<hr>
		<table>
			강사후기
			<a id="modalButton">더보기+</a>
			<c:forEach items="${list}" var="list">
				<ul>
					<li><a
						href="review_content.do?review_id=${ list.review_id }&teacher_id=${dto.teacher_id}">${list.r_headline}</a></li>
				</ul>
			</c:forEach>
		</table>

		<div id="moreReview">
			수강후기

			<div id="aaa">
				<table>
					<tr>
						<th>제목</th>
						<th>등록자</th>
						<c:if test="${ sessionScope.sessionid == '관리자'}">
							<th><a href="#"><button id="multi"
										onclick="multiDelete()">다중삭제</button></a></th>
						</c:if>
					</tr>
					<c:forEach items="${ list }" var="list">
						<tr>
							<td><a
								href="review_content.do?review_id=${ list.review_id }&teacher_id=${list.teacher_id}">${list.r_headline}</a></td>
							<td>${list.member_id }</td>

							<c:if
								test="${sessionScope.sessionid == list.member_id or sessionScope.sessionid == '관리자'}">
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
				<a href="#" id="writeButton">글쓰기</a>

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
				</div>
			
			
				<div id="writeDIV">
			<form action="review_write.do">
				<table>
					<tr>
						<td colspan="3"></td>
					</tr>

					<tr>
						<td>제목</td>
						<td>:</td>
						<td><input type="text" class="write_input" name="r_headline" id="r_headline"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>:</td>
						<td><input type="text" class="write_input" id="r_content"/></td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					
					<tr>
						<td><a href="t_intro_content.do?teacher_id=${param.teacher_id}" style="width: 100%;">취소</a></td>
						<td><input id="aa" type="button" value="add"/></td> 
					</tr>
				</table>
			</form>
		</div>
		</div>

		
	</div>
	
</body>

<script>
$(document).on('click','#aa',function(){
		$("#writeDIV").hide();
		$("#aaa").show();
		
	
	/* $.ajax({
			url:"review_write.do",
			data:{"r_headline" : r_headline,
				"r_content" : r_content	
			},
			success:function(data){
				alert(data);
			}
			
		}) */
});


	
</script>
</html>