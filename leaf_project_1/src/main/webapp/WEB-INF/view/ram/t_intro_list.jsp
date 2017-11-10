<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript">
   function hide(){
      alert("해당내용이 삭제됩니다");
   }
   
   function multiDelete(){
      var t= document.getElementsByName("teacher_id");
      var sum = new Array();
      var j=0;
      for (var i =0 ; i<t.length; i++){
         if(t[i].checked){
            sum[j] = t[i].value;
            j=j+1;
            /* alert(t[i].value); */
         }
      }
      /* alert("test.do?gno="+sum); */
      window.location.href="t_intro_multidelete.do?teacher_id="+sum;
   }

</script>
	<script>
	 /* Demo purposes only */
	  $(".hover").mouseleave(
	    function() {
	      $(this).removeClass("hover");
	    }
	  );
	</script>
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="http://www.blueb.co.kr/data/201010/IJ12882511794405/jquery.tablesorter.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
   $("#t_intro").tablesorter(); 
}); 
</script> -->
<style type="text/css">
.teacher_intro{
   width:800px;
}
#t_search{
   font-size: 12px;
   width:100%;
}
#t_search p{
   float: right;
}
#t_search input{
   font-size: 12px;
}
#function{
   float:right;
   width:100%;
   padding-bottom: 10px;
}
#t_intro{
   width:100%;
}
#t_intro td{
   padding-bottom: 30px;
   width:230px;
}
#t_name{
   vertical-align: bottom;
   text-align: center;
   
}

/* Icon set - http://ionicons.com/ */

@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800);
figure.snip1141 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  float: left;
  overflow: hidden;
  margin: 10px 1%;
  min-width: 220px;
  max-width: 240px;
  max-height: 240px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1141 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.snip1141 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}

figure.snip1141 .circle {
  position: relative;
  height: 55px;
  width: 55px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50%;
  text-align: center;
}

figure.snip1141 .circle:before,
figure.snip1141 .circle:after {
  border: 2px solid white;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.snip1141 .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

figure.snip1141 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  display: block;
  width: 100%;
  overflow: hidden;
}

figure.snip1141 h2 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  letter-spacing: -1px;
  line-height: 55px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
}

figure.snip1141 .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}

figure.snip1141 i {
  color: white;
  font-size: 48px;
  line-height: 55px;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}

figure.snip1141:hover .circle,
figure.snip1141.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.snip1141:hover .circle:before,
figure.snip1141.hover .circle:before,
figure.snip1141:hover .circle:after,
figure.snip1141.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.snip1141:hover h2,
figure.snip1141.hover h2 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.snip1141:hover img,
figure.snip1141.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

figure.snip1141:hover i,
figure.snip1141.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
</style>
</head>
<body>
<div class="teacher_intro">
   <div id="t_search"><!-- 선생님 검색 -->
      <form action="t_intro_search.do" method="post">
         <p>선생님 찾기 
            <input size="15" type="search" name="keyvalue"
            placeholder="선생님 이름 입력" list="list" > 
            <input type="submit" value="검색">&nbsp; 
         <!--<a href="t_intro_list.do"><button id="delete">초기화</button></a> -->
         </p>
      </form>
   </div>
   
      <div id="function"><!-- 추가,다중삭제 -->
         <c:if test="${sessionScope.sessionid == '관리자'}">
            <a href="t_intro_writeform.do"><button>추가</button></a>
            <a href="#"><button id="multi" onclick="multiDelete()">다중삭제</button></a>
         </c:if>
         
      </div>

<%--<datalist  id="t_intro_list">
      <c:forEach items="${ list }" var="item">
         <option value="${ item.member_id }"> </option>
      </c:forEach>
   </datalist> --%>
   
   <table id="t_intro">
      <!-- <thead>
      <tr>
         <th>teacher_id</th>
         <td>강사 사진</td>
         <th>강사 이름</th>
         <th>강사 연혁</th>
    
      </tr>
      </thead>
     -->  

         <tr>
      <c:forEach items="${ list }" var="list" begin="0" varStatus="status">
            <td id="multi" width="230px">

						<figure class="snip1141">
							<img src="resources/${list.teacher_image}" style="width: 240px; height: 240px">
							<figcaption>
								<div class="circle">
									<i class="ion-ios-plus-empty">+ </i>
								</div>
								<h2>${ list.member_id }</h2>
							</figcaption>
							<a href="t_intro_content.do?teacher_id=${ list.teacher_id }"></a>
						</figure>
						 
            <%-- <p id="t_name"><a href="t_intro_content.do?teacher_id=${ list.teacher_id }">${list.member_id}</a> --%>
            <c:if test="${ sessionScope.sessionid == '관리자'}">
            <input type="checkbox" style="width: 30px;" name="teacher_id" value="${ list.teacher_id }" id="checkbox">
            </p>
            </c:if>         
            </td>
      <c:if test="${status.index  %3==2}">
         </tr><tr>
         </c:if>
      </c:forEach>
      </tbody>
   </table>
   
   <div>
      <c:if test="${param.page>5}">
         <a class="button btn-prev" href="t_intro_list.do?page=${startPage-1}">이전</a>
      </c:if>
      <c:forEach var="i" begin="0" end="4" varStatus="status">
      <c:if test="${countPage>=startPage+i}">
         <a class="strong" href="t_intro_list.do?page=${startPage+i}">${startPage+i}</a></li>
      </c:if>   
   </c:forEach>
      <c:if test="${countPage>=startPage+5}">
         <a class="strong" href="t_intro_list.do?page=${startPage+5}">다음</a></li>
      </c:if>
   </div>
</div>
</body>
</html>