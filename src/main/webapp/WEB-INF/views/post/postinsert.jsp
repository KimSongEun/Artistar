<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- icon -->
<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/resources/image/index/template/tab-icon1.ico">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postinsert.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#dropbox {
		width: 350px;
		height: 70px;
		padding: 10px;
		border: 1px solid #aaaaaa;
	}
</style>

</head>
<body>
	<%@ include file="../index/header.jsp"%>
	
		<section style="margin-top: 100px">
	</section>
<section id="container">
	<div id="main_container">
		<div class="post_form_container">
		<form action="${pageContext.request.contextPath}/post/postinsert" class="post_form" name="postImgForm" method="post" enctype="multipart/form-data">
		<div class="title">NEW POST</div>
				<div class="preview">
					<div class="upload">
						<div class="post_btn">
							<div class="plus_icon">
								<span></span> <span></span>
							</div>
							<p>포스트 이미지 추가</p>
							<canvas id="imageCanvas"></canvas>
						</div>
					</div>
				</div>
			<p><input type="file" id="id_photo" class="form-control" name="postImg" multiple="multiple" required></p>
			<p><input type="text" class="form-control" name="postContent" placeholder="문구 입력..." required></p>
			<p><input class="submit_btn" type="submit" value="저장"></p>
		</form>
		</div>
	</div>
</section>

<script>
	$(function() {
		$(".post_btn").click(function() {
			$("#id_photo").click();
		});
	});


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