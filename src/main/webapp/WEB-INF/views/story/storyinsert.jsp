<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/story.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>게시글 등록</title>

</head>
<body>
<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px">
	</section>
<section id="container">
	<div id="main_container">
		<div class="post_form_container">
			<form action="bInsert" class="post_form" method="post" enctype="multipart/form-data">
				<div class="title">NEW STORY</div>
				<div class="preview">
					<div class="upload">
						<div class="post_btn">
							<div class="plus_icon">
								<span></span> <span></span>
							</div>
							<p>스토리 이미지 추가</p>
							<canvas id="imageCanvas"></canvas>
						</div>
					</div>
				</div>
				<p>
					<input type="file" name="storyimg" id="id_photo" required="required">
				</p>
				<input type="hidden" value="test" name="id"> <!-- 후에 수정 해야함 -->
				<input class="submit_btn" type="submit" value="저장">
			</form>

		</div>

	</div>

	
</section>

<script>
       var fileInput  = document.querySelector( "#id_photo" ),
           button     = document.querySelector( ".input-file-trigger" ),
           the_return = document.querySelector(".file-return");

       // Show image
       fileInput.addEventListener('change', handleImage, false);
       var canvas = document.getElementById('imageCanvas');
       var ctx = canvas.getContext('2d');


        function handleImage(e){
           var reader = new FileReader();
           reader.onload = function(event){
               var img = new Image();
               // var imgWidth =
               img.onload = function(){
                   canvas.width = 300;
                   canvas.height = 300;
                   ctx.drawImage(img,0,0,300,300);
               };
               img.src = event.target.result;
               // img.width = img.width*0.5
               // canvas.height = img.height;
           };
           reader.readAsDataURL(e.target.files[0]);
       }


</script>
</body>
</html>