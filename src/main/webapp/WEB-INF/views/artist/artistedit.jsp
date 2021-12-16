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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistedit.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistedit.js?"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css"/>

<title>Artist Edit</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
 		<div class="container" id="sandbox-container" style="width:1000px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<div class="d-flex align-items-start">
				  <div class="nav flex-column nav-pills me-3 menu" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="height:951px;">
				  	<div class="artist_profile text-center">
				  		 <img id="one" src="${artistProfileArtist.artistImg}" onerror="this.src='resources/image/artist/myartgallery/default_user.png'">
				  		 <br><br>
				  		 <div class="artist_profile_name text-center">${artistProfileArtist.artistName }</div>
				  	</div>
				  	<br>
				    <button class="nav-link menu_button update navlink" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">작가 프로필 수정 요청</button>
				    <br>
				    <button class="nav-link menu_button delete navlink" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">작가 프로필 삭제 요청</button>
				    <br>
				  </div>
				  <div class="tab-content cont" id="v-pills-tabContent">
				    <div class="tab-pane fade show updatecont" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
				    	<div style="width : 650px;">
					    <form method="POST" action="artisteditupdate" enctype="multipart/form-data">
				  		 <input type="hidden" name="artist_num" value="${artistProfileArtist.artistNum }"/>
				  		 <input type="hidden" name="artist_img" id="artist_img" value="${artistProfileArtist.artistImg }"/>
				  		 
			 <div class="user_profile">
			  	<div class="profile_thumb">
                       <img src="${artistProfileArtist.artistImg}" id="profileImgView" class="rounded" onerror="this.src='resources/image/artist/myartgallery/default_user.png'">
                   </div>
                   <div class="detail">
                       <div class="id">${artistProfileArtist.artistName }</div>
                         <!-- <label class="" for="profileImageUpdate" style="width:100px; font-size:10px">프로필 사진 변경 요청</label> -->
                       <button type="button" class="btn ko_name btn btn-outline-secondary profileImageUpdateBtn" id="profileImageUpdateBtn">프로필 사진 변경 요청</button>
                       <input type="file" name="artistImg" class="ko_name form-control profileImageUpdate" 
                       			id="profileImageUpdate" style="display:none" onchange="loadImg(this)">
                   </div>
			  </div>
			  <br> 
	 				   		  <div class="row mb-3">
							    <label for="artist_name" class="col-sm-2 col-form-label">이름</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artist_name" id="artist_name" value="${artistProfileArtist.artistName }" required>
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artist_intro" class="col-sm-2 col-form-label">소개</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artist_intro" id="artist_intro" style="height : 100px" value="${artistProfileArtist.artistIntro }">
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artist_country" class="col-sm-2 col-form-label">국적</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artist_country" id="artist_country" value="${artistProfileArtist.artistCountry }">
							    </div>
							  </div>
							  <div class="row mb-3">
							    <label for="artist_birth" class="col-sm-2 col-form-label">출생년도</label>
							    <div class="col-sm-10" id="birthpick">
							      <input type="text" class="form-control datetimepicker-input" name="artist_birth" id="artist_birth" value="${artistProfileArtist.artistBirth }" data-toggle="datetimepicker" data-target="#artist_birth">
							    </div>
							  </div>

							  <div class="row mb-3">
							    <label for="artist_dead" class="col-sm-2 col-form-label">사망년도</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control datetimepicker-input" name="artist_dead" id="artist_dead" value="${artistProfileArtist.artistDead }" data-toggle="datetimepicker" data-target="#artist_dead">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artist_detail" class="col-sm-2 col-form-label">기타정보</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artist_detail" id="artist_detail" style="height : 200px">${artistProfileArtist.artistDetail }</textarea>
							    </div>
							  </div> 
							  <br><br>
							  <div class="text-center">
							  <button type="submit" class="btn btn-primary">제출</button> &nbsp;
							  <button type="reset" class="btn btn-secondary">취소</button>
							  </div>
							</form>
				    </div>
				    
				    </div>
				    <div class="tab-pane fade show deletecont" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
				    	<div style="width : 650px;">
					    <form method="POST" action="artisteditdelete">
								<input type="hidden" name="artist_num" value="${artistProfileArtist.artistNum }"/>					    
	 				   		  <div class="row mb-3">
							    <label for="reason" class="col-sm-2 col-form-label">삭제이유</label>
							    <div class="col-sm-10">
							      <textarea name="reason" class="form-control" id="reason" style="height : 200px"></textarea>
							    </div>
							  </div>
							  
							  <br><br>
							  <div class="text-center">
							  <button type="submit" class="btn btn-primary">삭제요청</button> &nbsp;
							  <button type="reset" class="btn btn-secondary">취소</button>
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
		var type = "${type}";
		console.log("type : " + type);
		if(type == 'update') {
			$(".update").addClass("active");
			$(".updatecont").addClass("active");
		} 
		if(type == 'delete') {
			$(".delete").addClass("active");
			$(".deletecont").addClass("active");
		} 
		CKEDITOR.replace("artist_detail", {height : 200, width : 540});
	</script>
</body>
</html>