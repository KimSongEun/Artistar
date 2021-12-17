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
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

<!-- GoogleMap -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_bY5lxulq4V8ivu9OBkpY-LogpHcQSmo&callback=initMap"></script>

<title>Art Edit</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
 		<div class="container" style="width:1000px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 hidden-xs">
			<div class="d-flex align-items-start">
				  <div class="nav flex-column nav-pills me-3 menu" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="height:1349px;">
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
				  		 <input type="hidden" name="artinfo_num" id="artinfo_num" value="${artInfoDetail.artinfoNum }"/>
				  		 <input type="hidden" name=artist_num id="artist_num" value="${artInfoDetail.artistNum }"/>
				  		 <input type="hidden" name="artinfo_img" id="artinfo_img" value="${artInfoDetail.artinfoImg }"/>
				  		 
				  		 
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
							      <input type="text" class="form-control datetimepicker-input" name="artinfo_year" id="artinfo_year" value="${artInfoDetail.artinfoYear }" data-toggle="datetimepicker" data-target="#artinfo_year">
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
							    <div class="input-group mb-3" style="width : 560px;">
								  <input type="text"  class="form-control" name="artinfo_collection" id="artinfo_collection" value="${artInfoDetail.artinfoCollection }" aria-label="Recipient's username" aria-describedby="button-addon2">
								  <button class="btn btn-outline-secondary" type="button" id="button-addon2" data-bs-toggle="modal" data-bs-target="#exampleModal">주소수정</button>							      
 									 <div id="map" style="width:100%; height: 200px; margin-top : 10px; margin-bottom : 10px;"></div>
							    </div>
							  </div>
<!-- Modal -->
<div class="modal fade addressModal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">작품 소장처 주소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="input-group mb-3">
		  <input type="text" class="form-control" id="artinfo_collection_address" name="artinfo_collection_address" value="${artInfoDetail.artinfoCollectionAddress }" placeholder="소장처의 정확한 주소를 입력해주세요" aria-label="Recipient's username" aria-describedby="address_button">
		  <button class="btn btn-outline-danger address_button" type="button" id="address_button" onclick="geoCode()">위도/경도 계산</button>
		</div>
		<div>
			<div class="input-group mb-3" id="lad_lon_info" style="width : 470px; display:none; ">
			  <span class="input-group-text" id="latitude">위도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lat" aria-describedby="latitude" value="${artInfoDetail.artinfoCollectionAddressLat }" name="artinfo_collection_address_lat">
			  &nbsp; &nbsp;
			  <span class="input-group-text" id="longitude">경도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lon" aria-describedby="longitude" value="${artInfoDetail.artinfoCollectionAddressLon }" name="artinfo_collection_address_lon">
			</div>
		</div>
		<div id="lad_lon_alert" style="display : none">
		<div class="alert alert-danger d-flex align-items-center" role="alert">
		  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		  <div>
		   &nbsp; 주소의 위도/경도를 계산할 수 없습니다. <br>
		 &nbsp;  주소 재입력 또는 위도/경도를 직접 입력해주세요.
		  </div>
		</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">주소 입력</button>
      </div>
    </div>
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
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>	
	<script>
		CKEDITOR.replace("artinfo_detail", {height : 200, width : 537.66});
	</script>
</body>
</html>