<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<style type="text/css">
#bookwriteTable {
   width: 800px;
   text-align: center;
}
#bookwriteTable td {
   border: 1px solid;
}
#whqrp {
	width: 200px;
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
font-size: 0.5em; }
</style>
</head>
<body>
   <form action="book_write.do" enctype="multipart/form-data" method="post">
   <table id="bookwriteTable">
      <%-- <tr>
         <td>NO</td>
         <td>:</td>
         <td><input type="text" name="book_id" required="required" value="${ book_id }"></td>value="${ book_id }"
      </tr> 
      
      <tr>
         <td>member_id</td>
         <td>:</td>
         <td><input type="text" name="member_id" required="required" ></td>
      </tr> --%>
      
      <tr>
         <td id="whqrp">제목 : </td>
         <td><input type="text" name="book_title" style="width: 100%;"></td>
      </tr>      
      <tr>
         <td id="whqrp">저자 : </td>
         <td><input type="text" name="book_writer" style="width: 100%;"></td>
      </tr>      
      <tr>
         <td id="whqrp">가격 : </td>
         <td><input type="text" name="book_cost" style="width: 100%;"></td>
      </tr> 
      <tr>
         <td id="whqrp">소개 : </td>
         <td><textarea rows="" cols="" name="book_contents" style="width: 100%; height:300px"></textarea></td>
      </tr>     
      <tr>
      	<td colspan="2"> <input type="file" name="uploadfile" id="image" > </td> 
      </tr>
      <tr>
         <td colspan="2"> 
         	<input type="button" value="취소" onclick="window.location.href='book_list.do'" class="btn btn--sm btn--green">  
         	<input type="reset" value="초기화" class="btn btn--sm btn--green"> 
         	<input type="submit" value="추가" class="btn btn--sm btn--green"> 
         </td>
      </tr>
   </table>
   </form>
      
   <div id="image_preview">
        <img src="#" />
        <br />
        <a href="#">Remove</a>
   </div>


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