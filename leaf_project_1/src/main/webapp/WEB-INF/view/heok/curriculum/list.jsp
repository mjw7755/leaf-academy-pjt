<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>curriculumList Page</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js">
	
</script>

<script type="text/javascript">
	function text(e) {
		alert(e.target.id);
	}
	function listChange(params) {
		var url = "list_" + params.value + ".do";
		window.location.href = url;
	}
/* 	$(function(){
		$(".searchdiv").hide;
			
		$("#search").click(function(){
		
				$("#searchdiv1").show();
		});
		$("#searchbtn").click(function(){
			$("#searchdiv2").show();
			
		});
	}); */
		
	$(function() {
		$(".content").hide();
		var flag = [ false, false, false, false, false, false, false, false,
				false, false, false, false ];
		/* $(".content").hide(); */
		/* $(".month").click(function(){
			var month = this.value.substring(6);
			if(flag[month+1]) {
				$("#content"+month).hide();
				flag[month+1] = false;
			} else {
				$("#content"+month).show();
				
				flag[month+1] = true;
			}
		});
		 */
		/* 	 $("#01").click(function(){
				var monthvalue = $("#01").attr("id");
				alert(monthvalue); */

		$(".monthBtn").click(
				function() {
					var monthvalue = this.id;
					var yearvalue = this.name;
					
					flag[monthvalue - 1] = !flag[monthvalue - 1];
					if (flag[monthvalue - 1]) {

						$.ajax({
							url : "monthlist_curri.do",
							data : {
								"monthvalue" : monthvalue,
								"yearvalue" : yearvalue
							},
							type : "post",

							success : function(data) {
								var res = eval("(" + data + ")");
								var resData = res.result;
								for (var i = 0; i < resData.length; i++) {
									$("#ajaxDataBody" + monthvalue).append(
											"<tr id=\"tr"+monthvalue+"\"><td >"
													+ resData[i][0].value
													+ "</td><td>"
													+ resData[i][1].value
													+ "</a></td><td>"+"<a href ='detail_curri.do?curri_id="+resData[i][0].value+"''>"
													+ resData[i][2].value
													+ "</a></td><td>"
													+ resData[i][3].value
													+ "</td><td>"
													+ resData[i][4].value
													+ "</td><td>"
													+ resData[i][5].value
													+ "</td><td>"
													+ resData[i][6].value
													+ "</td></tr>");
								}
								$("#content" + monthvalue).show();
							},
							error : function(data) {

							}
						});
					} else {
						$("#content" + monthvalue).hide();
						$("#tr"+monthvalue).remove();
					}
				});
	});
</script>
<body>
<c:if test="${ sessionScope.sessionid == '해피도연' ||'관리자1' }">
	<a href="writeform_curri.do" method="post"><button>추가하기</button></a>
</c:if><br>
	<input type="button" id="01" name="2017" class="monthBtn"
		value="2017.01" />
	<input type="button" id="02" name="2017" class="monthBtn"
		value="2017.02" />
	<input type="button" id="03" name="2017" class="monthBtn"
		value="2017.03" />
	<input type="button" id="04" name="2017" class="monthBtn"
		value="2017.04" />
	<input type="button" id="05" name="2017" class="monthBtn"
		value="2017.05" />
	<input type="button" id="06" name="2017" class="monthBtn"
		value="2017.06" />
	<br>
	<input type="button" id="07" name="2017" class="monthBtn"
		value="2017.07" />
	<input type="button" id="08" name="2017" class="monthBtn"
		value="2017.08" />
	<input type="button" id="09" name="2017" class="monthBtn"
		value="2017.09" />
	<input type="button" id="10" name="2017" class="monthBtn"
		value="2017.10" />
	<input type="button" id="11" name="2017" class="monthBtn"
		value="2017.11" />
	<input type="button" id="12" name="2017" class="monthBtn"
		value="2017.12" />
		
	<!-- <input type="button" id="search" name="search" value="search"> -->
	
	<div id="searchdiv1" name="searchdiv1" class="searchdiv1">
	<form action="search_curri.do" method="post">
		<select name="column">
			<option value="curri_subject">강좌명</option>
			<option value="curri_level">강좌레벨</option>
			<option value="member_id">강사명</option>
		</select> <input size="30" type="text" id="keyvalue" name="keyvalue"
			placeholder="키워드 검색 가능합니다."> <input type="submit"
			id="searchbtn" name="searchbtn"value="검색">&nbsp;

	</form>	
	</div>	
	<div id="content01" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">1월</span>

				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody01">

				</tbody>
			</table>
		</fieldset>
	</div>


	<div id="content02" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">2월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody02">

				</tbody>


			</table>

		</fieldset>
	</div>
	<div id="content03" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">3월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody03">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content04" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">4월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody04">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content05" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">5월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody05">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content06" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">6월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody06">

				</tbody>

			</table>

		</fieldset>
	</div>
	<div id="content07" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">7월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<c:if test="${ sessionScope.sessionid == '해피도연' ||'관리자1' }">
				<th>
					curri_id
				</th>
				</c:if>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody07">

				</tbody>

			</table>
		</fieldset>
	</div>

	<div id="content08" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">8월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody08">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content09" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">9월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody09">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content10" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">10월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody10">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content11" class="content">
		<fieldset>
			<legend>
				<span style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">11월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody11">

				</tbody>

			</table>

		</fieldset>
	</div>

	<div id="content12" class="content">
		<fieldset>
			<legend>
				<span
					style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">12월</span>
				
			</legend>

			<table style="text-align: center;">
				<thead>
				<th>
					curri_id
				</th>
					<th>개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>

				</thead>
				<tbody id="ajaxDataBody12">

				</tbody>

			</table>

		</fieldset>
	</div>
	<hr>
	 <div id="searchdiv2" name="searchdiv2" class="searchdiv2">
		<fieldset>
			<legend>
				<span style="width: 350px; height: 50px; font-size: 30px; font-weight: bold;">검색</span>
				
			</legend>
			
			<table cellpadding="5" style="text-align: center;">
					<th colspan="2">개강일</th>
					<th><b>강좌명</b></th>
					<th><b>강사</b></th>
					<th><b>강좌레벨</b></th>
					<th><b>클래스명</b></th>
					<th><b>수강인원</b></th>
				
				<th id = "multi"><b></b></th>
				
				<c:forEach items="${list }" var="list" varStatus="status" >
					<tr onclick="test(this)">
						<td colspan="2"> ${list.lect_start_day}</td>
						<td><a href="detail_curri.do?curri_id=${list.curri_id}">${list.curri_subject}</a></td>
						<td>${list.member_id}</td>
						<td>${list.curri_level}</td>
						<td>${list.lect_name}</td>
						<td>${list.lect_person_num}</td>
						
						<c:if test="${ sessionScope.sessionid == '해피도연' ||'관리자1' }">
							<td><a href="delete_curri.do?curri_id=${list.curri_id}"><button id="delete">삭제</button></a></td>
							<td><a href="updateForm_curri.do?curri_id=${list.curri_id}"><button id="update">수정</button></a></td>
						</c:if>
					</tr>
				</c:forEach>
				
			</table>
			
		</fieldset>
	 
	 <div>
      <c:if test="${param.page>5}">
         <c:if test="${flag == 'list' }">
         <a class="button btn-prev" href="list_curri.do?page=${startPage-1}">이전</a>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="button btn-prev" href="search_curri.do?page=${startPage-1}&column=${column}&keyvalue=${keyvalue}">이전</a>
         </c:if>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
      <c:if test="${flag == 'list' }">
         <a class="strong" href="list_curri.do?page=${startPage+i}">${startPage+i}</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
          <a class="strong" href="search_curri.do?page=${startPage+i}&column=${column}&keyvalue=${keyvalue}">${startPage+i}</a></li>
         </c:if>
        
      </c:if>
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
           <c:if test="${flag == 'list' }">
         <a class="strong" href="list_curri.do?page=${startPage+5}">다음</a></li>
         </c:if>
         <c:if test="${flag == 'search' }">
         <a class="strong" href="search_curri.do?page=${startPage+5}&column=${column}&keyvalue=${keyvalue}">다음</a></li>
         </c:if>
         
      </c:if>
   </div>
</div>
	
</body>
</html>





