<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script> 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
   textarea { 
   resize: none; 
   overflow: visible;
   }
   
   table {
	text-align: center;
	font-size: 20px;
    margin-left: auto;
    margin-right: auto;
	}
	legend {
	align-content: center;
	}
	#curri_table {
	text-align: center;
	font-size: 20px;
    margin-left: auto;
    margin-right: auto;
    width: 800px;
	}
}
</style>

<body>
	<fieldset>
	<legend>
			<h3>강좌수정</h3>
		</legend>
	<form action="update_curri.do">
		<table style="text-align: center;" id="curri_table">
			<input type="hidden" name="curri_id" value="${dto.curri_id }">
			<tr>
				<td>강좌명</td>
				<td></td>
				<td><input type="text" name="curri_subject" required="required"
					value="${dto.curri_subject}"></td>
			</tr>

			<tr>
				<td>강좌레벨</td>
				<td></td>
				<td><select name="curri_level" value="${dto.curri_level }">
						
							<option value="${dto.curri_level }" > ${dto.curri_level }</option>
						
						<option value="초급"> 초급 </option>
						<option value="중급"> 중급 </option>
						<option value="고급"> 고급 </option>
				</select></td>
			</tr>

			<tr>
				<td>강좌내용</td>
				<td></td>
				<td>
				<textarea rows=30 cols=50 id="curri_content" name="curri_content" class="curri_content" required="required"
					value="${dto.curri_content}">${dto.curri_content}
				</textarea>
				</td>
			</tr>

			<tr>
				<td colspan="3">
					<input type="button" value="취소"
						onclick="window.location.href='list_curri.do' ">
					
					<input type="submit" id="savebutton" value="수정하기">
				</td>
			</tr>


		</table>


	</form>
	</fieldset>
</body>
</html>