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
      $("#writeDIV").hide();
      $("#reviewList").show();
      $("#reviewList").removeChild();
      reviewList();
   }
   
   function reviewList() {
      $.ajax({
         url:"review_list.do?teacher_id=${dto.teacher_id}",
         dataType:"json",
         success:function(msg){
            var sessionid = "${sessionScope.sessionid}";
            
            var data = JSON.parse(msg.list);
            var dataLength = data.length;
            var strTag = "<table>"
            +"<tr>"
            +"<th>제목</th>"
            +"<th>등록자</th>";
            if(sessionid == '관리자') {
               strTag = strTag + "   <th><a href=\"#\"><button id=\"multi\""
               +"onclick=\"multiDelete()\">다중삭제</button></a></th>";
            }
            strTag = strTag + "</tr>";
            for(var i=0; i<dataLength; i++) {
               strTag = strTag + "   <tr>"
               +"   <td><a"
               +"      href=\"review_content.do?review_id="+data[i].review_id+"&teacher_id="+data[i].teacher_id+"\">"+data[i].r_headline+"</a></td>"
               +"   <td>"+data[i].member_id+"</td>";
               if(sessionid == data[i].member_id || sessionid == '관리자') {
                  strTag = strTag + "      <td><a"
                  +"         href=\"review_updateform.do?review_id="+data[i].r_headline+"\">수정</a></td>"
                  +"      <td><a"
                  +"         href=\"review_delete.do?review_id="+data[i].r_headline+"&teacher_id="+${param.teacher_id}+"\">"
                  +"            <button id=\"delete\" onclick=\"hide()\">삭 제</button>"
                  +"      </a></td>";
                  if(sessionid == '관리자') {
                     strTag = strTag + "<td id=\"multi\"><input type=\"checkbox\" style=\"width: 30px;\""
                     +"   name=\"review_id\" value=\""+data[i].review_id+"\"></td>";
                  }
               }
               strTag = strTag + "</tr>";
            }
            strTag = strTag +"</table>"
            +"<input type=\"button\" onclick=\"reviewWrite()\" value=\"글쓰기\"/>"

            +"<div>"; 
            
            if(msg.page>5) {
               if(msg.flag == 'list') {
                  strTag = strTag + "<a class=\"button btn-prev\""
                  +"      href=\"review_list.do?page="+(msg.page-1)+"&teacher_id="+msg.dto.teacher_id+"\">이전</a>";
               } else if(msg.flag == 'search')  {
                  strTag = strTag + "   <a class=\"button btn-prev\""
                  +"      href=\"review_search.do?page="+(msg.page-1)+"&column=${column}&keyvalue=${keyvalue}&teacher_id="+msg.dto.teacher_id+"\">이전</a>";
               }
            }
            
            for(var i=0; i<5; i++) {
               if(msg.countPage>=msg.startPage+i) {
                  if(msg.flag == 'list') {
                     strTag = strTag + "<a class=\"strong\""
                     +"   href=\"review_list.do?page="+(msg.startPage+i)+"&teacher_id="+msg.dto.teacher_id+"\">"+(msg.startPage+i)+"</a>";
                  } else if(msg.flag == 'search') {
                     strTag = strTag + "<a class=\"strong\""
                     +"   href=\"review_search.do?page="+(msg.startPage+i)+"&column=${column}&keyvalue=${keyvalue}&teacher_id="+msg.dto.teacher_id+"\">"+(msg.startPage+i)+"</a>";
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
            strTag = strTag + "</div>"
            +"<form action=\"review_search.do\" method=\"post\">"
            +"<select name=\"column\">"
            +"<option value=\"member_id\">작성자</option>"
            +"<option value=\"r_headline\">제목</option>"
            +"</select> <input type=\"text\" name=\"keyvalue\"> <input type=\"submit\""
            +"value=\"검색\">"
            +"</form>";
            
            
            $("#reviewList").append(strTag);
         }
      });
   }
   
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
         <div id="reviewList"></div>
         
         
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
                <td><input type="button" onclick="reviewWriteCancle()" value="취소"/></td>
                  <td><input onclick="reviewAdd()" type="button" value="add"/></td> 
               </tr>
            </table>
         </form>
      </div>
      </div>

      
   </div>
   
</body>
</html>