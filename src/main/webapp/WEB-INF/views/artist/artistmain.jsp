<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistmain.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistmain.js" ></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Artist Main</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
	 	<div class="container">
			<div class="item">
				<div class="artistlist-plus">
				
		<form method="POST" action="artistinsert" enctype="multipart/form-data">
				
					<!-- 작가 등록 modal -->
					<div class="modal fade" id="artistPlusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					    <div class="modal-content" >
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel"><img src="resources/image/artist/artistdetail/brush.png" width="30px"/> 작가 신청하기  <img src="resources/image/artist/artistdetail/brush.png" width="30px"/></h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        
				  		 <br><br><br>
								  				<div class="row mb-3">
												   <label for="artistImg" class="col-sm-3 col-form-label"> 사진 &nbsp;<img id="profileImgView" src="resources/image/myartgallery/default_user.png" width="30px" height="30px" style="border-radius: 50%;"></label>
												   <div class="col-sm-9" style="padding-right : 100px">
												    <input type="file" name="artistImg" class="ko_name form-control profileImageUpdate" 
					                       			id="profileImageUpdate" onchange="loadImg(this)">
												   </div>
											    </div>
												  
						 				   		<div class="row mb-3">
												    <label for="artist_name" class="col-sm-3 col-form-label">이름</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artist_name" id="artist_name" required/>
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artist_intro" class="col-sm-3 col-form-label">소개</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artist_intro" id="artist_intro" style="height : 100px">
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artist_country" class="col-sm-3 col-form-label">국적</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artist_country" id="artist_country">
												    </div>
												  </div>
												    <fieldset class="row mb-3">
												    <legend class="col-form-label col-sm-3 pt-0">성별</legend>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <div class="form-check">
												        <input class="form-check-input" type="radio" name="artist_gender" id="gridRadios1" value="M" checked>
												        <label class="form-check-label" for="gridRadios1" style="padding-right : 530px">
												          M
												        </label>
												      </div>
												      <div class="form-check">
												        <input class="form-check-input" type="radio" name="artist_gender" id="gridRadios2" value="F">
												        <label class="form-check-label" for="gridRadios2" style="padding-right : 530px">
												          F
												        </label>
												      </div>
												    </div>
												  </fieldset>
												  
												  <div class="row mb-3">
												    <label for="artist_birth" class="col-sm-3 col-form-label">출생년도</label>
												    <div class="col-sm-9" id="birthpick" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artist_birth" id="artist_birth">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artist_dead" class="col-sm-3 col-form-label">사망년도</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artist_dead" id="artist_dead">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artist_detail" class="col-sm-3 col-form-label">기타정보</label>
												    <br>
												    <div style="padding-right : 100px; margin-left : 100px;">
												      <textarea name="artist_detail" id="artist_detail" style="height : 200px"></textarea>
												    </div>
												  </div> 
												  <br><br>
										        
										      </div>
										      <div class="modal-footer">
										        <button type="submit" class="btn btn-primary">등록 요청하기</button>
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										      </div>
										    </div>
										  </div>
										</div>
							</form>
					
					<button class="btn"  data-bs-toggle="modal" data-bs-target="#artistPlusModal">
						<img src="resources/image/artistplus.png" width="30px"/>
					</button>
				</div>
				
				<c:if test="${artistvolist!=null }">
				<c:forEach items="${artistvolist }" var="artistvolist">
				<div class = "artistlist_container">
				<div class="artistlist_item artistlist_artist">
				  <div class="user_profile">
                    <div class="profile_thumb">
                        <img src="resources${artistvolist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
                    </div>
                    <div class="detail">
                        <div class="id m_text" style="height:20px;">${artistvolist.artistName }<img class="align-top"src="resources/image/artist/artistdetail/artist_check.png" width="10px"/></div>
                        <div class="ko_name">팔로워 ${artistvolist.follower } 명</div>
                    </div>
				  </div>
                   <div class="artistlist_item detailgo">
                   	<a href="artistdetailArtist?artistNum=${artistvolist.artistNum }"><button type="button" class="btn btn-warning">Detail</button></a>
                   </div>
				</div>
				<br>
		 		<div class="artistlist_art"> 
		 		
		 		
		 		<c:choose>
		 			<c:when test="${fn:length(artistvolist.artInfo) >= 3 }">
		 			
						<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="2">
							<div class="artist_mainart">
								<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
							</div> 
 						</c:forEach>
		 			</c:when>
		 			<c:when test="${fn:length(artistvolist.artInfo) eq 2 }">
		 				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="1">
							<div class="artist_mainart">
								<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
							</div> 
						</c:forEach>			
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
							</div> 	
		 			</c:when>
		 			<c:when test="${fn:length(artistvolist.artInfo) eq 1 }">
		 				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="0">
							<div class="artist_mainart">
								<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
							</div> 
						</c:forEach>
						<c:forEach begin="1" end="2">		
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
							</div> 	
						</c:forEach>	
		 			</c:when>	
 			 		<c:when test="${empty artistvolist.artInfo}">
						<c:forEach begin="0" end="2">
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
							</div> 	
						</c:forEach>			
					</c:when>	 		
		 		</c:choose>
		 		
				</div>
				</div>
				<br><br><br>
				</c:forEach>
				</c:if>
				<div class="plus"></div>
				<br><br><br>
				<div class="loader text-center" style="display : none"><img src="resources/image/myartgallery/loader.gif" alt="로딩 이미지" width=50px><br><br><br></div> 
				
			</div>
		
			
			
			<div class="item">
				<div class="mygallery">
					<div class="artist-search">
					<form action="artistSearch" method="POST" style="display:inline">
					  <input class="form-control me-2" type="search" name="keyword" placeholder="Artist, Art, HashTag 검색" aria-label="Search" style="display:inline; width : 240px">
    				  <button class="btn btn-outline-secondary" type="submit">
    				  		<img src="${pageContext.request.contextPath}/resources/image/searchblack.png" width="20px"/>
    				  </button>
    				</form>
					</div>
					<div class="card text-center">
					  <div class="card-header">
					    <span class="mygallery_title">My Art Gallery</span>
					  </div>
					  <div class="card-body">
					  	<div>
					  		<img src="resources/image/mygalleryartist.png" width="80px"/>
					  		<span class="mygallery_count">${myArtGalleryArtistCount }명</span>
					  	</div>
					  	<div>
					  		<img src="resources/image/mygalleryart.png" width="80px"/>
					  		<span class="mygallery_count">${myArtGalleryArtCount }점</span>
					  	</div>
					  	<div class="card-body">
					    <a href="myartgallery?userId=${userId }" class="btn btn-dark">Detail</a>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
/* 	var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/common/ckUpload"
	} */
	CKEDITOR.replace("artist_detail", {height : 200, width : 570});
	</script>
</body>
</html>