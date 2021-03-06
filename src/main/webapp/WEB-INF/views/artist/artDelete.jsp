<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/artDelete.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artDelete.js"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Art Edit</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
	<button onclick="topFunction()" id="myBtn" class="btn" title="Go to top"><img class="topbtnimg" src = "${pageContext.request.contextPath}/resources/image/index/template/TOP.png"></button>
 		<div class="container" style="width:1000px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<div class="d-flex align-items-start">
				  <div class="nav flex-column nav-pills me-3 menu" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="height:600px;">
				  	<div class="artist_profile text-center">
				  		 <img id="one" src="${artInfoDetail.artinfoImg}" onerror="this.src='resources/image/artist/artUpdate/default_art_img.png'">
				  		 <br><br>
				  		 <div class="artist_profile_name text-center">${artInfoDetail.artinfoName }</div>
				  	</div>
				  	<br>
				    <button class="nav-link menu_button update navlink" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">?????? ?????? ?????? ??????</button>
				    <br>
				    <button class="nav-link menu_button delete active navlink" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">?????? ?????? ?????? ??????</button>
				    <br>
				  </div>
				  <div class="tab-content cont" id="v-pills-tabContent">
				    <div class="tab-pane fade show active deletecont" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
				    	<div style="width : 650px;">
					    <form method="POST" action="artEditDelete">
					   		 <input type="hidden" name="artistNum" id="artistNum" value="${artInfoDetail.artistNum }"/>
					   		 <input type="hidden" name="artinfo_num" id="artinfo_num" value="${artInfoDetail.artinfoNum }"/>
	 				   		  <div class="row mb-3">
							    <label for="reason" class="col-sm-2 col-form-label">????????????</label>
							    <div class="col-sm-10">
							      <textarea name="reason" class="form-control" id="reason" style="height : 200px"></textarea>
							    </div>
							  </div>
							  
							  <br><br>
							  <div class="text-center">
							  <button type="submit" class="btn btn-primary">????????????</button> &nbsp;
							  <button type="reset" class="btn btn-secondary">??????</button>
							  </div>
							</form>
				    </div>
				    </div>
				  </div>
				</div>
			
			</div>
		</div>
		</div>
		<br>
		<br>
	</section>
	<script>
		CKEDITOR.replace("artinfo_detail", {height : 200, width : 537.66});
	      var mybutton = document.getElementById("myBtn");
	        $(function(){
	         window.onscroll = function() {scrollFunction()};
	        });
	        function topFunction() {
	           window.scrollTo({top:0, behavior:'smooth'});
	         }
	      function scrollFunction() {
	        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	          mybutton.style.display = "block";
	        } else {
	          mybutton.style.display = "none";
	        }
	      }

	</script>
</body>
</html>