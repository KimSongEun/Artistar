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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artUpdate.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artUpdate.js"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">


<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" ></script>
<title>Art Edit</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
 		<div class="container" style="width:1000px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<div class="d-flex align-items-start">
				  <div class="nav flex-column nav-pills me-3 menu" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="height:1113px;">
				  	<div class="artist_profile text-center">
				  		 <img id="one" src="resources/${artInfoDetail.artinfoImg}" onerror="this.src='resources/image/artist/artUpdate/default_art_img.png'">
				  		 <br><br>
				  		 <div class="artist_profile_name text-center">${artInfoDetail.artinfoName }</div>
				  	</div>
				  	<br>
				    <button class="nav-link menu_button update active navlink" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">작품 정보 수정 요청</button>
				    <br>
				    <button class="nav-link menu_button delete navlink" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">작품 정보 삭제 요청</button>
				    <br>
				  </div>
				  <div class="tab-content cont" id="v-pills-tabContent">
				    <div class="tab-pane fade show active updatecont" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
				    	<div style="width : 650px;">
					    <form method="POST" action="artEditUpdate" enctype="multipart/form-data">
				  		 <input type="hidden" name="artinfoNum" id="artinfoNum" value="${artInfoDetail.artinfoNum }"/>
				  		 
				  		 
			 <div class="user_profile">
			  	<div class="profile_thumb">
                       <img src="resources/${artInfoDetail.artinfoImg}" id="profileImgView" onerror="this.src='resources/image/artist/artUpdate/default_art_img.png'">
                   </div>
                   <div class="detail">
                       <div class="id">${artInfoDetail.artinfoName }</div>
                       <button type="button" class="btn ko_name btn btn-outline-secondary profileImageUpdateBtn" id="profileImageUpdateBtn">작품 사진 변경 요청</button>
                       <input type="file" name="artinfoImg" class="ko_name form-control profileImageUpdate" 
                       			id="profileImageUpdate" style="display:none" onchange="loadImg(this)">
                   </div>
			  </div>
			  <br> 
	 				   		  <div class="row mb-3">
							    <label for="artinfo_name" class="col-sm-2 col-form-label">작품명</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_name" id="artinfo_name" value="${artInfoDetail.artinfoName }" required>
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artinfo_year" class="col-sm-2 col-form-label">제작년도</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_year" id="artinfo_year" value="${artInfoDetail.artinfoYear }">
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artinfo_trend" class="col-sm-2 col-form-label">사조</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_trend" id="artinfo_trend" value="${artInfoDetail.artinfoTrend }">
							    </div>
							  </div>
							  <div class="row mb-3">
							    <label for="artinfo_kind" class="col-sm-2 col-form-label">종류</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_kind" id="artinfo_kind" value="${artInfoDetail.artinfoKind }">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_technic" class="col-sm-2 col-form-label">기법</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_technic" id="artinfo_technic" value="${artInfoDetail.artinfoTechnic }">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_size" class="col-sm-2 col-form-label">크기</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_size" id="artinfo_size" value="${artInfoDetail.artinfoSize }">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_collection" class="col-sm-2 col-form-label">소장처</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfo_collection" id="artinfo_collection" value="${artInfoDetail.artinfoCollection }">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_hash_tag" class="col-sm-2 col-form-label">해시태그</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artinfo_hash_tag" id="artinfo_hash_tag" style="height : 100px">${artInfoDetail.artinfoHashTag }</textarea>
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_detail" class="col-sm-2 col-form-label">기타정보</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artinfo_detail" id="artinfo_detail" style="height : 200px">${artInfoDetail.artinfoDetail }</textarea>
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
	</script>
</body>
</html>