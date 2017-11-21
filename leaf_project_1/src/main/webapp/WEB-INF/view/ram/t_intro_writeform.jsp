<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
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
.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	margin-top:12px;
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
/*  */
.form-control {
	display: block;
	margin-right: 15px;
	/* width: 100%; */
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
	margin-left: 15px;
}
#submit{
	text-align: center;
}
#file{
	text-align: center;
}
</style>
</head>
<body>
	<form action="t_intro_write.do" enctype="multipart/form-data" method="post">
		<%-- 	<form action="${path}/upload/uploadForm" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="업로드">    
    </form> --%>
    <h1>강사 추가</h1>
		<table>
		<tr>
				<td colspan="2"><hr></td>
			</tr
			<tr>
				<td colspan="2" id="file">
					<div id="image_preview">
						<img src="resources/ram/people2.png"
							style="width: 240px; height: 240px" /> <br /> <a href="#">Remove</a>
					</div> <input type="file" name="uploadfile" id="image">
				</td>
			</tr>

			<tr>
				<td style="font-weight: bold">강사 이름</td>
				<td><input type="text" name="member_id"
					required="required" class="form-control"></td>
			</tr>
			

			<tr>
				<td style="font-weight: bold">강사 연혁</td>
<!-- 				<td><input type="text" name="teacher_introduce"
					required="required" class="form-control"></td> -->
					<td><textarea rows="7" cols="40" name="teacher_introduce" class="form-control"></textarea></td>
			</tr>
			

			<tr>
				<td colspan="2"><hr></td>
			</tr>

			<tr>
				<td id="submit" colspan="2"><input type="button" value="취소"
					onclick="window.location.href='t_intro_list.do' "
					class="btn btn-info"> <input type="submit" value="추가"
					class="btn btn-info"> <input type="reset" value="초기화"
					class="btn btn-info"> </td>
			</tr>
		</table>
		
		


    <script type="text/javascript">


    /** 
    onchange event handler for the file input field.
    It emplements very basic validation using the file extension.
    If the filename passes validation it will show the image using it's blob URL  
    and will hide the input field and show a delete button to allow the user to remove the image
    */

    $('#image').on('change', function() {
        
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#image').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#image_preview img').attr('src', blobURL);
            $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });

    /**
    onclick event handler for the delete button.
    It removes the image, clears and unhides the file input field.
    */
    $('#image_preview a').bind('click', function() {
        resetFormElement($('#image')); //전달한 양식 초기화
        $('#image').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
        

    /** 
    * 폼요소 초기화 
    * Reset form element
    * 
    * @param e jQuery object
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
    </script>
	</form>
</body>
</html>