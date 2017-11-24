<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
​ <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>​

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script> 
<!-- <script src='../se/js/HuskyEZCreator.js'>
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this is write_form</title>

<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "curri_content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",  
          fCreator: "createSEditor2"
      });
      //저장버튼 클릭시 form 전송
      $("#savebutton").click(function(){
          oEditors.getById["curri_content"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#writeForm").submit();
      });   
});
function pasteHTML(filepath){
     var sHTML = '<img src="${pageContext.request.contextPath }/resources/se/upload/'+filepath+'">'; 
/* var sHTML = '<img src="C:/Users/AHN/git/StudyHaja_1/StudyHaja/WebContent/ahn/se2/upload/'+filepath+'">'; */ 
       oEditors.getById["curri_content"].exec("PASTE_HTML", [sHTML]);
   }
</script>

</head>
<style type="text/css">
/*    textarea { 
   resize: none; 
   overflow: visible;
   } */
   
   #curri_table {
	text-align: center;
	font-size: 20px;
    margin-left: auto;
    margin-right: auto;
    width: 800px;
	}
	legend {
	align-content: center;
}
</style>

<body>
	<fieldset>
		<legend>
			<h3>강좌추가</h3>
		</legend>
		<form action="write_curri.do" method="post" id="writeForm" enctype = "multipart/form-data">
			<table id="curri_table">
				<tr>
				
				<td>강사명</td>
				<td> : </td>
				<td>
					<input type="text" name="member_id" id="member_id" value="${sessionScope.sessionid}" readonly="readonly">
				</td>
				</tr>
				<tr>
				
					<td>강좌명</td>
					<td>:</td>
					<td>
						<input type="text" name="curri_subject" required="required"
						value="${curri_subject }">
					</td>
				</tr>

				<tr>
					<td>강좌레벨</td>
					<td>:</td>
					<td>
						<select name="curri_level" value="${curri_level }">
						<option value="레벨" selected="selected"> 레벨을 선택하세요 </option>
						<option value="초급" > 초급 </option>
						<option value="중급" > 중급 </option>
						<option value="고급" > 고급 </option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강좌내용</td>
					<td>:</td>
					<td colspan ='4'>
							<textarea   id="curri_content" name="curri_content" required="required"	></textarea>
						<%--  <textarea name="editor" id="editor" style="width: 700px; height: 400px;" value="${curri_content }"></textarea> --%>
					</td>
				</tr>
				<tr >
					<td colspan="3">
						<input type="button" value="취소" 
							onclick="window.location.href='list_curri.do' ">
					
						<input type="submit" id="savebutton"value="추가">
					</td>
				</tr>
			</table>
					
       
    </form>

	</fieldset>
</body>
</html>