<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#bookupdateTable {
   width: 800px;
   text-align: center;
   margin-bottom: 20px;
}
#updateform{
   width:800px;
}

#updateform hr{
	border: thin solid;
	border-color: #cccccc;
}
/*  */
#whqrp {
	padding-left:30px;
	padding-right:10px;
	width: 60px;
	font-weight: bold;
	text-align: left;
}
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
    background-color: #fff; }
.btn--green {
font-size: 1em; }
.btn--sm {
font-size: 0.6em; }
/*  */
#book_image{
	width: 300px;
}
/*  */
.form-control {
	display: block;
	margin-right: 15px;
	width: 100%;
	/* height: 34px; */
	padding: 6px 0px;
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
	/* margin-left: 15px; */
}
</style>
</head>
<body>
<div id="updateform">
    <h1>도서 수정</h1>
<hr>
</div>
<form action="book_update.do" enctype="multipart/form-data" method="post">
	<table id="bookupdateTable">
			<input type="hidden" name="book_id" value="${dto.book_id}" >
		<tr>
			<td><input type="file" name="uploadfile"  id="image"></td>
			<td id="whqrp">작성자 : </td>
			<td>${dto.member_id}</td>
		</tr>
		<tr>
				<td rowspan="4" id="book_image">
					<div id="image_preview">
						<img src="resources/ram/book_image.png"
							style="width: 300px; height: 400px" />  <br /> <a href="#">Remove</a>
					</div></td>
				<td id="whqrp">제목 : </td>
			<td><input type="text" name="book_title" value="${dto.book_title}" class="form-control"></td>
		</tr>
		<tr>
			<td id="whqrp">URL : </td>
			<td><input type="text" name="book_url" value="${dto.book_url}" class="form-control"></td>
		</tr>
		<tr>
			<td id="whqrp">저자 : </td>
			<td><input type="text" name="book_writer" value="${dto.book_writer}" class="form-control"></td>
		</tr>
		<tr>
			<td id="whqrp">가격 : </td>
			<td><input type="text" name="book_cost" value="${dto.book_cost}" class="form-control" ></td>
		</tr>
		<tr>
			<td id="whqrp">소개 : </td>
			<td><textarea rows="" cols="" name="book_contents" style="width: 100%; height:300px" class="form-control">${dto.book_contents}</textarea></td>
		</tr>

	</table>
	<div id="submit">
	<input type="submit" class="btn btn--sm btn--green" value="수정완료">
	<input class="btn btn--sm btn--green" type="reset" value="초기화" >
	</div>
</form>
	


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
</body>
</html>
<%-- ENABLED : <input type="readonly" name="member_enabled" value="${dto.member_enabled}"><br>  --%>
