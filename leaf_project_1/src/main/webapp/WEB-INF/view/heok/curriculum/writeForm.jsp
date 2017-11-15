
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
​ 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>this is writeform</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
 
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
</style>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#savebutton").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#writeForm").submit();
        });
    });
</script>

<body>
	<fieldset>
		<legend>
			<h3>강좌추가</h3>
		</legend>
		<form action="write_curri.do" method="post" id="writeForm" enctype = "multipart/form-data">
			<table style="text-align: center;">
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
							<textarea  rows=30 cols=50 id="curri_content" name="curri_content" class="curri_content" 
								required="required"	></textarea>
							
					
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




