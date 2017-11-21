<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/ram/jquery-ui.js"></script>
<link href="css/ram/jquery-ui3.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

<script type="text/javascript">
   
   $(function() {
      $("#writeDIV").hide();
      $("#updateDIV").hide();
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
         
         reviewList();
      });
   });
   function reviewWrite() {
      $("#reviewList").hide();
      $("#writeDIV").show();
   }
   
   function reviewWriteCancle() {
      $("#reviewList").show();
      $("#writeDIV").hide();
      $("#r_headline").val("");
      $("#r_content").val("");
   }
   
   function reviewAdd() {
      $.ajax({
       url:"review_write.do?teacher_id=${dto.teacher_id}&r_headline="
             +document.getElementById("r_headline").value+"&r_content=" +document.getElementById("r_content").value,
        success:function(){
           $("#writeDIV").hide();
            $("#reviewList").show();
            $("#r_headline").val("");
            $("#r_content").val("");
            reviewList();
        }
      });
   }
   
   function reviewUpdate(ev) {
      
      var name = ev.target.name.split("_");
      $("#update_teacher_id").val(name[0]);
      $("#update_review_id").val(ev.target.id);
      $("#update_r_headline").val(name[1]);
      $("#update_r_content").val(name[2]);
         $("#reviewList").hide();
         $("#contentDIV").hide();
         $("#updateDIV").show();
      }
   
   function reviewChange(aa){
    var teacher_id = document.getElementById("update_teacher_id").value;
    var review_id = document.getElementById("update_review_id").value;
    var r_headline = document.getElementById("update_r_headline").value;
    var r_content = document.getElementById("update_r_content").value;
      $.ajax({
            url:"review_update.do?teacher_id="+teacher_id+"&review_id="+review_id+"&r_headline="
                  +r_headline+"&r_content=" +r_content,
            success:function(){
                    $("#updateDIV").hide();
                     $("#reviewList").show();
                     $("#update_r_headline").val("");
                     $("#update_r_content").val("");
                     reviewList();
            }
         });
      }
   function reviewDelete(ev) {
      var review_id = ev.target.id;
         alert("해당내용이 삭제됩니다");
         $.ajax({
             url:"review_delete.do?teacher_id=${dto.teacher_id}&review_id="+review_id,
              success:function(){
                 reviewList();
              }
            });
      }
   /* --------------------------------- */
   function reviewDetail(ev){
      var sessionid = "${sessionScope.sessionid}";
      var review_id = ev.target.id;
      $.ajax({
            url:"review_content.do?review_id="+review_id,
            dataType:"json",
            success:function(msg){
               var data = JSON.parse(msg.dto);
               $("#reviewList").hide();
               $("#contentDIV").remove();
                     
                var strTag = "<div id=\"contentDIV\">"
                         + "<div id=\"font\">회원아이디 </div>: "+data.member_id+" <br> <div id=\"font\">제목</div> : "+data.r_headline+" <br>"
                         + "<br><div id=\"font\">내용</div> <br> <br>"+data.r_content+"<br>"
                         +"<hr>"
                         +"<input type=\"button\" value=\"목록보기\""
                         + "onclick=\"reviewList() \" class=\"btn2 btn-info\">";
                         if(sessionid == data.member_id || sessionid == '관리자') {
                                strTag = strTag 
                                +"<input type=\"button\" id=\""+data.review_id+"\""
                                +"name=\""+data.teacher_id
                                +"_" + data.r_headline
                                +"_" + data.r_content
                                +"\" onclick=\"reviewUpdate(event)\" value=\"수정\" class=\"btn2 btn-info\"/>"
                                +"            <button id=\""+data.review_id+"\"" +"onclick=\"reviewDelete(event)\" class=\"btn2 btn-info\">삭 제</button>";
                             }
                strTag = strTag + "<br></div>";
                $("#detail").append(strTag);
            }
         });
      }
   function reviewList() {
      $("#reviewTable").remove();
       $("#contentDIV").remove();
       $("#reviewList").show();
      $.ajax({
         url:"review_list.do?teacher_id=${dto.teacher_id}",
         dataType:"json",
         success:function(msg){
            var sessionid = "${sessionScope.sessionid}";
            
            var data = JSON.parse(msg.list);
            var dto = JSON.parse(msg.dto);
            var dataLength = data.length;
           
            var strTag = "<div id=\"reviewTable\"><table id=\"review_table\">"
            +"<tr>"
            +"<th>번호</th>"
            +"<th>제목</th>"
            +"<th>등록자</th>";
         /*    if(sessionid == '관리자') {
               strTag = strTag + "   <th><a href=\"#\"><button id=\"multi\""
               +"onclick=\"multiDelete()\">다중삭제</button></a></th>";
            } */
            strTag = strTag + "</tr>";
            for(var i=0; i<dataLength; i++) {
               strTag = strTag + "   <tr>"
               /* +"   <td><a"
               +"      href=\"review_content.do?review_id="+data[i].review_id+"&teacher_id="+data[i].teacher_id
               +"\">"+data[i].r_headline+"</a></td>" */
               +"<td id=\"num\">"+data[i].review_id+"</td>"
               +"<td id=\"head\"><a href=\"#\"><div id=\""+data[i].review_id+"\""
               +"name=\""+dto.teacher_id
               +"_" + data[i].r_headline
               +"_" + data[i].r_content
               +"\" onclick=\"reviewDetail(event)\">"
               +data[i].r_headline+"</div></a></td>" 
               +"   <td id=\"member\">"+data[i].member_id+"</td>";
               +"<tr>"
               if(sessionid == data[i].member_id || sessionid == '관리자') {
                  strTag = strTag 
               /*    + "      <td>"
                  +"<input type=\"button\" id=\""+data[i].review_id+"\""
                  +"name=\""+dto.teacher_id
                  +"_" + data[i].r_headline
                  +"_" + data[i].r_content
                  +"\" onclick=\"reviewUpdate(event)\" value=\"수정\"/>"+"</td>" */
                /*   +"      <td>"
                  +"            <button id=\""+data[i].review_id+"\"" +"onclick=\"reviewDelete(event)\">삭 제</button>"
                  +"      </td>"; */
                 /*  if(sessionid == '관리자') {
                     strTag = strTag + "<td id=\"multi\"><input type=\"checkbox\" style=\"width: 30px;\""
                     +"   name=\"review_id\" value=\""+data[i].review_id+"\"></td>";
                  } */
               }
               strTag = strTag + "</tr>";
            }
            strTag = strTag +"</table>"
            
            +"<div id=\"page\">"; 
            
            if(msg.page>5) {
               if(msg.flag == 'list') {
                  strTag = strTag + "<a class=\"button btn-prev\""
                  +"      href=\"review_list.do?page="+(msg.page-1)+"&teacher_id="+dto.teacher_id+"\">이전</a>";
               } else if(msg.flag == 'search')  {
                  strTag = strTag + "   <a class=\"button btn-prev\""
                  +"      href=\"review_search.do?page="+(msg.page-1)+"&column=${column}&keyvalue=${keyvalue}&teacher_id="+dto.teacher_id+"\">이전</a>";
               }
            }
            
            for(var i=0; i<5; i++) {
               if(msg.countPage>=msg.startPage+i) {
                  if(msg.flag == 'list') {
                     strTag = strTag + "<a class=\"strong\""
                     +"   href=\"review_list.do?page="+(msg.startPage+i)+"&teacher_id="+dto.teacher_id+"\">"+(msg.startPage+i)+"</a>";
                  } else if(msg.flag == 'search') {
                     strTag = strTag + "<a class=\"strong\""
                     +"   href=\"review_search.do?page="+(msg.startPage+i)+"&column=${column}&keyvalue=${keyvalue}&teacher_id="+dto.teacher_id+"\">"+(msg.startPage+i)+"</a>";
                  }
               }
            }
            
            if(msg.countPage>=msg.startPage+5) {
               if(msg.flag == 'list') {
                  strTag = strTag + "<a class=\"strong\""
                  +"   href=\"review_list.do?page="+(msg.startPage+5)+"&teacher_id="+msg.dto.teacher_id+"\">다음</a>";
               } else if(msg.flag == 'search') {
                  strTag = strTag + "<a class=\"strong\""
                  +"   href=\"review_search.do?page="+(msg.startPage+5)+"&column=${column}&keyvalue=${keyvalue}&teacher_id="+msg.dto.teacher_id+"\">다음</a>";
               }
            }
            strTag = strTag + "</div><div id=\"review_input\">"
            +"<input type=\"button\" onclick=\"reviewWrite()\" value=\"후기작성\" class=\"btn2 btn-info\" /></div>"
            +"<form action=\"review_search.do\" method=\"post\" class=\"re_search\">"
            +"<select name=\"column\" class=\"form-control\">"
            +"<option value=\"member_id\">작성자</option>"
            +"<option value=\"r_headline\">제목</option>"
            +"</select> <input type=\"text\" name=\"keyvalue\" class=\"form-control\">" 
            +"<input type=\"image\" src=\"resources/ram/search.png\" id=\"search\">"
            +"</form></div>";
            
            $("#reviewList").append(strTag);
         }
      });
   }
   

</script>
<style type="text/css">
#font{
	font-weight: bold;
	float: left;
}
.re_search{
	margin: auto;
}
.form-control {
	/* display: block; */
	/* margin-right: 15px; */
	/*margin-left: 15px; */
	/* width: 40%;  */
	/* height: 34px; */
	padding: 6px 12px;
	font-size: 14px;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
/*  */
#search{
	margin-left: 10px;	
	 vertical-align:middle;
}
#page{
	text-align: center;
	margin-top: 10px;
}
#page a{
	text-decoration: none;
	font-weight: bold;
	font-size: 15px;
	color: #13b69d;
	margin-right: 5px;
}
#review{
	font-weight: bold;
}
hr{
	border: thin solid;
}
#review_table{
	width:100%;
	border-collapse: collapse;
	border-spacing: 0px;
}
#review_table th{
	border-bottom: 2px solid;
	padding-bottom: 5px;
}
/*  #review_table td{
	width: 100%;
}  */
#num{
	width:10%;
	text-align: center;
}
#head{
	width:80%;
	text-align: center;
}
#member{
	width:10%;
	text-align: center;
}

.content {
   width: 100%;
}
#top_banner{
	width: 100%;
	background-color: #e5d235;
	margin: auto;
}
.content_t {
   width: 600px;
}

#teacher_img td {
   padding-right: 20px;
   width: 250px;
}

#teacher_name {
   font-size: 20px;
   font-weight: bold;
}
#teacher_name td{
	width: auto;
}
#teacher_name a{
	text-decoration: none;
}
#reviewTable{
   width: 100%;
}
#profile {
   color:#000;
   font-weight: bold;
}
#profile td{
	padding-top: 20px;
}
#introduce{
	font-size: 13px;
	color:#676767;
}
/*  */

.btn {
       display: inline-block;
    border: none;
    border-radius: .3em;
    -webkit-box-shadow: inset 0 0 0 1px #323232, inset 0 -0.25em 0 #9f9e9e, 0 0.25em 0.25em #666666;
    /* box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05); */
    color: #000;
    cursor: pointer;
    font-family: 'Raleway', sans-serif;
    font-weight: bold;
    line-height: 1.5;
    letter-spacing: 1px;
    padding: .5em 1.5em .75em;
    position: relative;
    text-decoration: none;
    text-shadow: 0 1px 1px #c4c4c4;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    /* margin-left: 10px; */
}
.btn:active {
-webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
margin-top: .25em;
padding-bottom: .5em; }
.btn:active, .btn:focus {
outline: none; }
.btn--green {
    background-color: #fff; 
    }
.btn--green {
font-size: 1em; }
.btn--sm {
font-size: 0.5em; }

/* 글쓰기 */
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
	padding: 6px 12px;
	margin-bottom: 12px;
	margin-top:12px;
	margin-left:5px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
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
#submit{
	text-align: center;
}
#review_input{
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
   <div class="content">
   	<!-- top banner -->
   	<div id="top_banner">
   		<div id="banner">
   		<img src="resources/ram/top_banner_intro.png">
   		</div>
   	</div>
    <!-- top banner end -->
      <input type="hidden" value="${dto.teacher_id}"> <br>
      <table class="content_t">
         <tr id="teacher_img">
            <td rowspan="5"><img src="resources/ram/${dto.teacher_image}"
               style="width: 240px; height: 240px"></td>
         </tr>
         <tr id="teacher_name">
            <td>${dto.member_id}</td>
            <td>
            <c:if test="${sessionScope.sessionid == dto.member_id or sessionScope.sessionid == '관리자'}">
         <a href="t_intro_updateform.do?teacher_id=${dto.teacher_id}">
            <button id="edit" class="btn btn--sm btn--green">수 정</button>
            <!-- <button class="btn btn--sm btn--green">추가</button> -->
         </a>
			
         <a href="t_intro_delete.do?teacher_id=${ dto.teacher_id }">
            <button id="delete" onclick="hide()" class="btn btn--sm btn--green">삭 제</button>
         </a>
         </td>
     	 </c:if>
         </tr>
         <tr id="profile">
            <td colspan="3">＜약력＞</td>
         </tr>
         <tr id="introduce">
            <td colspan="3">${dto.teacher_introduce}</td>
         </tr>
         <tr>
         	<td><a id="modalButton">강사후기</a></td>
         </tr>
      </table>
      <!-- <input type="button" value="목록보기" onclick="window.location.href='t_intro_list.do' "> -->
<%-- 
      <table>
         
         <c:forEach items="${list}" var="list">
            <ul>
               <li><a
                  href="review_content.do?review_id=${ list.review_id }&teacher_id=${dto.teacher_id}">${list.r_headline}</a></li>
            </ul>
         </c:forEach>
      </table> --%>

      <div id="moreReview">
         <div id="review">
         	수강후기
         <hr>
         </div>
         <div id="reviewList"></div>
         
         
            <div id="writeDIV">
         <form action="review_write.do">
            <table id="review_table">
              

               <tr>
                  <td style="font-weight: bold">제목</td>
                  <td><input type="text" class="form-control" name="r_headline" id="r_headline"/></td>
               </tr>
               <tr>
                  <td style="font-weight: bold">내용</td>
                  <!-- <td><input type="text" class="write_input" id="r_content"/></td> -->
                  <td><textarea rows="7" cols="50" id="r_content" class="form-control"></textarea></td>
               </tr>
               <tr>
                  <td colspan="2"><hr></td>
               </tr>
               
               <tr>
                <td colspan="2" id="submit"><input type="button" onclick="reviewWriteCancle()" value="취소" class="btn2 btn-info"/>
                <input onclick="reviewAdd()" type="button" value="추가" class="btn2 btn-info"/></td> 
               </tr>
            </table>
         </form>
      </div>

         <!-- update -->
         <div id="updateDIV">
            <form action="review_update.do">
						<input type="hidden" readonly="readonly" name="teacher_id"
							id="update_teacher_id">
						<input readonly="readonly" type="hidden" name="review_id"
							id="update_review_id">
            <table>
						<tr>
							<td style="font-weight: bold">제목</td>
							<td><input type="text" name="r_headline"
								id="update_r_headline"></td>
						</tr>
						<tr>
							<td style="font-weight: bold">내용</td>
							<!-- <td><input type="text" name="r_content"
								id="update_r_content"></td> -->
							<td><textarea rows="7" cols="50" name="r_content"
								id="update_r_content" class="form-control"></textarea></td>	
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
						<tr>
							<td colspan="2"><input onclick="reviewChange()"
								type="button" value="수정" class="btn2 btn-info"/></td>
						</tr>
					</table>
            </form>
         </div>
         <!-- update end -->


         <!-- content -->
         <div id="detail"></div>
         <!-- content end -->

      </div>
   </div>
   
</body>
</html>