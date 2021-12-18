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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminArtInsert.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/adminArtInsert.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css"/>

<!-- GoogleMap -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_bY5lxulq4V8ivu9OBkpY-LogpHcQSmo&callback=initMap"></script>


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
					        <button class="btn btn-toggle align-items-center rounded collapsed checkcheck" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
					          Art Request
					        </button>
					        <div class="collapse show" id="dashboard-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				           		 <li><a href="artInsertRequest" class="link-dark rounded position-relative checkThis">등록 요청
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
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
					          Information
					        </button>
					        <div class="collapse" id="orders-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					            <li><a href="artistAdminInsert" class="link-dark rounded">Artist</a></li>
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
				  		 <input type="hidden" name="insert_num" <c:if test="${artInsertInfoDetail.insert_num != 0 }">value="${artInsertInfoDetail.insert_num }"</c:if>/>
				  		 <input type="hidden" name="artinfoImg" id="artinfo_img" <c:if test="${artInsertInfoDetail.artinfo_img != null }">value="${artInsertInfoDetail.artinfo_img }"</c:if>/>
				  		 <input type="hidden" id="result" name="result" value="${result }"/>
				  		 <input type="hidden" id="userId" name="id" value="${artInsertInfoDetail.id }"/>
				  		 <input type="hidden" id="artistNum" name="artistNum" value="${artInsertInfoDetail.artist_num }"/>
				  		 
							<div class="row mb-3">
								  	<div class="col-sm-2 col-form-label">
					                       <img src="${artInsertInfoDetail.artinfo_img}" width="120px" height="150px" id="profileImgView" class="rounded" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'">
					                   </div>
					                   <div class="col-sm-10" style="padding-top:115px;">
					                       <button type="button" class="btn ko_name btn btn-outline-secondary profileImageUpdateBtn" id="profileImageUpdateBtn" style=" margin-right : 530px;">
					                       		<c:if test="${artInsertInfoDetail.artinfo_img == null }">작품 사진 등록</c:if>
					                       		<c:if test="${artInsertInfoDetail.artinfo_img != null }">작품 사진 변경</c:if>
					                       	</button>
					                       <input type="file" name="artNewImg" class="form-control profileImageUpdate" 
					                       			id="profileImageUpdate" style="display:none"  onchange="loadImg(this)">
					                   </div>
							</div>				  		 
				  		 
	 				   		  <div class="row mb-3">
							    <label for="artinfo_name" class="col-sm-2 col-form-label">작품명</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfoName" id="artinfo_name" <c:if test="${artInsertInfoDetail.artinfo_name != null }">value="${artInsertInfoDetail.artinfo_name }"</c:if> required>
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artinfo_year" class="col-sm-2 col-form-label">제작년도</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control datetimepicker-input" name="artinfoYear" id="artinfo_year" <c:if test="${artInsertInfoDetail.artinfo_year != null }">value="${artInsertInfoDetail.artinfo_year }"</c:if> data-toggle="datetimepicker" data-target="#artinfo_year">
							    </div>
							  </div>
							  
	  						   <div class="row mb-3">
							    <label for="artinfo_trend" class="col-sm-2 col-form-label">사조</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfoTrend" id="artinfo_trend" <c:if test="${artInsertInfoDetail.artinfo_trend != null }">value="${artInsertInfoDetail.artinfo_trend }"</c:if>>
							    </div>
							  </div>
							  <div class="row mb-3">
							    <label for="artinfo_kind" class="col-sm-2 col-form-label">종류</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfoKind" id="artinfo_kind" <c:if test="${artInsertInfoDetail.artinfo_kind != null }">value="${artInsertInfoDetail.artinfo_kind }"</c:if>>
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_technic" class="col-sm-2 col-form-label">기법</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfoTechnic" id="artinfo_technic" <c:if test="${artInsertInfoDetail.artinfo_technic != null }">value="${artInsertInfoDetail.artinfo_technic }"</c:if>>
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_size" class="col-sm-2 col-form-label">크기</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="artinfoSize" id="artinfo_size" <c:if test="${artInsertInfoDetail.artinfo_size != null }">value="${artInsertInfoDetail.artinfo_size }"</c:if>>
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_collection" class="col-sm-2 col-form-label">소장처</label>
							    <div class="input-group col-sm-10" style="width : 703.33px;">
								  <input type="text"  class="form-control" name="artinfoCollection" id="artinfo_collection" <c:if test="${artInsertInfoDetail.artinfo_collection != null }">value="${artInsertInfoDetail.artinfo_collection }"</c:if> aria-label="Recipient's username" aria-describedby="button-addon2">
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
		  <input type="text" class="form-control" id="artinfo_collection_address" name="artinfoCollectionAddress" <c:if test="${artInsertInfoDetail.artinfo_collection_address != null }">value="${artInsertInfoDetail.artinfo_collection_address }"</c:if> placeholder="소장처의 정확한 주소를 입력해주세요" aria-label="Recipient's username" aria-describedby="address_button">
		  <button class="btn btn-outline-danger address_button" type="button" id="address_button" onclick="geoCode()">위도/경도 계산</button>
		</div>
		<div>
			<div class="input-group mb-3" id="lad_lon_info" style="width : 470px; display:none; ">
			  <span class="input-group-text" id="latitude">위도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lat" aria-describedby="latitude" <c:if test="${artInsertInfoDetail.artinfo_collection_address_lat != null }">value="${artInsertInfoDetail.artinfo_collection_address_lat }"</c:if> name="artinfoCollectionAddressLat">
			  &nbsp; &nbsp;
			  <span class="input-group-text" id="longitude">경도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lon" aria-describedby="longitude" <c:if test="${artInsertInfoDetail.artinfo_collection_address_lon != null }">value="${artInsertInfoDetail.artinfo_collection_address_lon }"</c:if> name="artinfoCollectionAddressLon">
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
							      <textarea class="form-control" name="artinfoHashTag" id="artinfo_hash_tag" style="height : 100px"><c:if test="${artInsertInfoDetail.artinfo_hash_tag != null }">${artInsertInfoDetail.artinfo_hash_tag }</c:if></textarea>
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="artinfo_detail" class="col-sm-2 col-form-label">기타정보</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="artinfoDetail" id="artinfo_detail" style="height : 200px"><c:if test="${artInsertInfoDetail.artinfo_detail != null }">${artInsertInfoDetail.artinfo_detail }</c:if></textarea>
							    </div>
							  </div> 
							  
							  
							  <br><br>
							  <div class="text-center">
							  <c:if test="${result == 0 }">
								  <button type="submit" class="btn btn-primary" onclick="javascript: form.action='artInsertDo'">등록</button> &nbsp;
								  <button type="submit" class="btn btn-danger" onclick="javascript: form.action='artInsertRejectDo'">반려</button> &nbsp;
								  <button type="button" class="btn btn-secondary goOut">나가기</button>
							  </c:if>
							  <c:if test="${result == 1 }">
								  <button type="submit" class="btn btn-primary" onclick="javascript: form.action='artInsertDo'" disabled>등록</button> &nbsp;
								  <button type="submit" class="btn btn-danger" onclick="javascript: form.action='artInsertRejectDo'" disabled>반려</button> &nbsp;
								  <button type="button" class="btn btn-secondary goOut">나가기</button>
									<br><br>
							  		<div class="alert alert-danger" style="width:300px; margin : 0 auto" role="alert">
									  이미 처리가 완료되었습니다!
									</div>
							  </c:if>
							  <c:if test="${result == 2 }">
								  <button type="submit" class="btn btn-primary" onclick="javascript: form.action='artInsertDo'" disabled>등록</button> &nbsp;
								  <button type="submit" class="btn btn-danger" onclick="javascript: form.action='artInsertRejectDo'" disabled>반려</button> &nbsp;
								  <button type="button" class="btn btn-secondary goOut">나가기</button>
								  	<br><br>
							  		<div class="alert alert-primary" style="width:300px; margin : 0 auto" role="alert">
									  반려된 요청입니다!
									</div>
							  </c:if>
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
		CKEDITOR.replace("artinfo_detail", {height : 300, width : 679});
	</script>
</body>
</html>