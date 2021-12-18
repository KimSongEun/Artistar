<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/artistAdminInsert.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/artistAdminInsert.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css"/>

<title>Admin Page</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
 		<div class="container" style="width:1200px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 hidden-xs" style="width : 310px;">
			<div class="d-flex align-items-start menu">
				  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				    <main>

					  <div class="flex-shrink-0 p-3 bg-white align-items-center" style="width: 270px; margin : 0 auto; ">
					    <a href="#관리자 메인페이지" class="row d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom text-center">
					 	     <div style="width : 270px;">
							 <img id="one" src="${pageContext.request.contextPath}/resources/image/admin/main/admin_profile.png" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/main/admin_profile.png'"> 
							 </div>
							 <br><br>
					     	 <span class="fs-5 fw-semibold" style="display : inline-block">Artistar Admin</span>
					    </a>
					    <ul class="list-unstyled ps-0">
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed">
					          <a href="adminmain" class="link-dark rounded" style="text-decoration-line : none;">HOME</a>
					        </button>
					      </li>					    
					    <li class="border-top my-3"></li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					          Artist Request
					        </button>
					        <div class="collapse" id="home-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				           		 <li><a href="artistInsertRequest" class="link-dark rounded position-relative">등록 요청
				           		 <c:if test="${artistInsertCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistInsertCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artistUpdateRequest" class="link-dark rounded position-relative">수정 요청
				           		 <c:if test="${artistUpdateCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistUpdateCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artistDeleteRequest" class="link-dark rounded position-relative">삭제 요청
				           		 <c:if test="${artistDeleteCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistDeleteCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
					          Art Request
					        </button>
					        <div class="collapse" id="dashboard-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				           		 <li><a href="artInsertRequest" class="link-dark rounded position-relative">등록 요청
				           		 <c:if test="${artInsertCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artInsertCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artUpdateRequest" class="link-dark rounded position-relative">수정 요청
				           		 <c:if test="${artUpdateCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artUpdateCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artDeleteRequest" class="link-dark rounded position-relative">삭제 요청
				           		 <c:if test="${artDeleteCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artDeleteCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="border-top my-3"></li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed checkcheck" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="true">
					          Information
					        </button>
					        <div class="collapse show" id="orders-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					            <li><a href="artistAdminInsert" class="link-dark rounded checkThis">Artist</a></li>
					            <li><a href="artAdminInsert" class="link-dark rounded">Art</a></li>
					          </ul>
					        </div>
					      </li>
					    </ul>
					  </div>
					
					 
					</main>

				  </div>
				  
				  
				  <div class="tab-content cont align-items-center" id="v-pills-tabContent" style="padding-left : 50px">
				    <div class="tab-pane fade show active deletecont align-items-center" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" style="margin : 0 auto;">
 				    	<div style="width : 820px; " class="text-center">
 				    	
<div id="insertContents">
						    <form method="POST" enctype="multipart/form-data">
				  		 
								<div class="row mb-3">
									  	<div class="col-sm-2 col-form-label">
						                       <img src="${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png" width="120px" height="150px" id="profileImgView" class="rounded">
						                   </div>
						                   <div class="col-sm-10" style="padding-top:115px;">
						                       <button type="button" class="btn ko_name btn btn-outline-secondary profileImageUpdateBtn" id="profileImageUpdateBtn" style=" margin-right : 530px;">
						                       		프로필 사진 등록
						                       	</button>
						                       <input type="file" name="artistNewImg" class="form-control profileImageUpdate" 
						                       			id="profileImageUpdate" style="display:none"  onchange="loadImg(this)">
						                   </div>
								</div>
								
	 				   		  <div class="row mb-3">
							    <label for="artist_name" class="col-sm-2 col-form-label">이름</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artistName" id="artist_name" required>
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artist_intro" class="col-sm-2 col-form-label">소개</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artistIntro" id="artist_intro" style="height : 100px"></textarea>
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artist_country" class="col-sm-2 col-form-label">국적</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artistCountry" id="artist_country" >
							    </div>
							  </div>
							  
					  		  <fieldset class="row mb-3">
							    <legend class="col-form-label col-sm-2 pt-0">성별</legend>
							    <div class="col-sm-9" style="padding-right : 100px">
							      <div class="form-check">
							        <input class="form-check-input" type="radio" name="artistGender" id="gridRadios1" value="M" checked>
							        <label class="form-check-label" for="gridRadios1" style="padding-right : 530px">
							          M
							        </label>
							      </div>
							      <div class="form-check">
							        <input class="form-check-input" type="radio" name="artistGender" id="gridRadios2" value="F">
							        <label class="form-check-label" for="gridRadios2" style="padding-right : 530px">
							          F
							        </label>
							      </div>
							    </div>
							  </fieldset>							  
							  
							  <div class="row mb-3">
							    <label for="artist_birth" class="col-sm-2 col-form-label">출생년도</label>
							    <div class="col-sm-10" id="birthpick">
							      <input type="text" class="form-control datetimepicker-input" name="artistBirth" id="artist_birth" data-toggle="datetimepicker" data-target="#artist_birth">
							    </div>
							  </div>

							  <div class="row mb-3">
							    <label for="artist_dead" class="col-sm-2 col-form-label">사망년도</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control datetimepicker-input" name="artistDead" id="artist_dead" data-toggle="datetimepicker" data-target="#artist_dead">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artist_detail" class="col-sm-2 col-form-label">기타정보</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artistDetail" id="artist_detail" style="height : 200px"></textarea>
							    </div>
							  </div> 
							  <br><br>
							  <div class="text-center">
								  <button type="submit" class="btn btn-primary" onclick="javascript: form.action='artistAdminInsertDo'">등록</button> &nbsp;
								  <button type="reset" class="btn btn-danger">취소</button> &nbsp;
								  <button type="button" class="btn btn-secondary goOut">나가기</button>
							  </div>
							</form>
</div>


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
		CKEDITOR.replace("artist_detail", {height : 300, width : 679});
	</script>
</body>
</html>