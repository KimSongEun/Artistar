<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artdetailModal.css?">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
<script type="text/javascript" src="resources/js/artist/artdetailModal.js?"></script>

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- GoogleMap -->
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_bY5lxulq4V8ivu9OBkpY-LogpHcQSmo&callback=initMap"></script>


<title>작품 상세보기 Modal</title>
</head>
<body>
<input type="hidden" id="artistNum" value="${artInfo.artistNum }"/>
	<div class="modal-header">
		<h5 class="modal-title">작품명 '${artInfo.artinfoName }'</h5>
  		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<div class="modal-body " style="padding : 0">
<!-- 		<div class="container" style="margin:20px"> -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 "  style="margin:18px">
						<img src="resources/${artInfo.artinfoImg }" class="d-block w-100" style="width: 100%; height: 550px; object-fit: cover;border-radius: 5px;" alt="..." >
					</div>

					<div class="col-md-5 "  style="margin:18px">
						<img src="resources/image/artist/artistdetail/brush.png" style="border-radius: 70%; width: 30px; height: 30px;" /> &nbsp; <div style="height:48px; display : inline-block"><a style="font-weight: bold; color: black;" href="artistdetailArtist?artistNum=${artInfo.artistNum }">${artInfo.artist.artistName }<img class="align-top" src="resources/image/artist/artistdetail/artist_check.png" width="13px"/></a></div>
							<div id="followImg" style="display:inline-block"></div>
<div class="dropdown" style="float: right;">
  <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    <i style="float: right; font-size:25px; color: black;" class="fas fa-bars"></i>
  </button>
  <ul class="dropdown-menu">
    <!-- Dropdown menu links -->
	    <li><a class="dropdown-item" href="artUpdate?artinfoNum=${artInfo.artinfoNum }">작품 수정 요청</a></li>
	    <li><a class="dropdown-item" href="artDelete?artinfoNum=${artInfo.artinfoNum }">작품 삭제 요청</a></li>
  </ul>
</div>						
						<hr>
						<div style="overflow-y: auto; overflow-x:hidden; height: 350px; width : 450px">

												  <div class="row mb-3">
												    <label for="artinfo_name" class="col-sm-3 col-form-label">작품명</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_name" id="name" required readonly value="${artInfo.artinfoName }"/>
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_year" class="col-sm-3 col-form-label">제작년도</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_year" id="year" readonly value="${artInfo.artinfoYear }">
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_trend" class="col-sm-3 col-form-label">사조</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_trend" id="trend" readonly value="${artInfo.artinfoTrend }">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_kind" class="col-sm-3 col-form-label">종류</label>
												    <div class="col-sm-9" id="birthpick" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_kind" id="kind" readonly value="${artInfo.artinfoKind }">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_technic" class="col-sm-3 col-form-label">기법</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_technic" id="technic" readonly value="${artInfo.artinfoTechnic }">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_size" class="col-sm-3 col-form-label">크기</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_size" id="size" readonly value="${artInfo.artinfoSize }">
												    </div>
												  </div> 
												  
												  <input type="hidden" id="labelVal" value="${artInfo.artinfoCollectionAddress }">
												  <input type="hidden" id="latVal" value="${artInfo.artinfoCollectionAddressLat }">
												  <input type="hidden" id="lonVal" value="${artInfo.artinfoCollectionAddressLon }">
												  <div class="row mb-3">
												    <label for="artinfo_collection" class="col-sm-3 col-form-label">소장처</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_collection" id="collection" readonly value="${artInfo.artinfoCollection }"/>
		<div class="input-group mb-3" id="artinfo_collection_div" style="margin-top : 10px; margin-bottom : 10px">
		  <input type="text" class="form-control" id="artinfo_collection_address" name="artinfo_collection_address"  readonly value="${artInfo.artinfoCollectionAddress }">
		</div>
		<div>
			<div class="input-group mb-3" id="lad_lon_info" style="width : 280px; ">
			  <span class="input-group-text" id="latitude">위도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lat" aria-describedby="latitude" name="artinfo_collection_address_lat" readonly value="${artInfo.artinfoCollectionAddressLat }">
			  &nbsp; &nbsp;
			  <span class="input-group-text" id="longitude">경도</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lon" aria-describedby="longitude" name="artinfo_collection_address_lon" readonly value="${artInfo.artinfoCollectionAddressLon }">
			</div>
		</div>
												      <div id="map1" style="width:100%; height: 200px;"></div>
												    </div>
												  </div>
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_detail" class="col-sm-3 col-form-label">상세정보</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <textarea class="form-control" name="artinfo_detail" id="detail"  style="height : 200px"  readonly >${artInfo.artinfoDetail }</textarea>
												    </div>
												  </div>												  
												  <br>						
							
							<div class="col-sm-11 text-center" id="hashtagDiv">
						      <!-- <textarea class="form-control-plaintext" name="hashtag" id="hashtag" readonly> -->
							  	<c:set var="hash_split" value="${fn:split(artInfo.artinfoHashTag, '#') }"/>
								<c:forEach var="hash" items="${hash_split}" varStatus="status">
									<a href="검색url?search=${hash}" class="link-danger">#${hash} </a> &nbsp;&nbsp;
								</c:forEach>
							 <!-- </textarea> -->
						    </div>
							
							<hr style="width : 400px">
							<%-- <input type="hidden" id="sessionId" value="${member.id }"> --%>
							<div id="reply_body" style="width : 400px;">
 								<c:set var="current" value="0" />
								<c:forEach var="artInfoComment" items="${artInfoComment}">

									<c:if test="${artInfoComment.art_comment_class == 0}">
										<img src="resources/image/${artInfoComment.member_img}" class="rounded" width= 30px height= 30px onerror="this.src='resources/image/myartgallery/default_user.png'"/>
										<a style="font-weight: bold; color: black;" href="#사용자정보보기">${artInfoComment.id }</a>
											${artInfoComment.art_comment }<br/>
											<div style="margin-left : 40px;">
										<a role="button" onclick="co_comment(${artInfoComment.art_num}, ${artInfoComment.art_comment_group}, ${current}, '${artInfoComment.id }')"><span style="font-size: 10px; margin-right: 10px;">답글달기</span></a>
											<c:if test="${artInfoComment.id eq 'song'}">
<%-- 											<c:if test="${artInfoComment.id eq member.id}"> --%>
				
												<a role="button" onclick="deleteComment(${artInfoComment.art_comment_group}, ${artInfoComment.art_num})"><span style="font-size: 10px; color : red">댓글삭제</span></a>
											</c:if>
											</div>
										<div id="depth${current}" style="margin-left : 40px;"></div>


										<!-- <hr> -->
										<br>



									</c:if> 
									<c:if test="${artInfoComment.art_comment_class == 1}"> 
										<img src="resources/image/${artInfoComment.member_img}" class="rounded" width= 30px height= 30px onerror="this.src='resources/image/myartgallery/default_user.png'" style="margin-left: 30px;" />
										<a style="font-weight: bold; color: black;" href="#사용자정보상세보기">${artInfoComment.id }</a>
										<p style="color: #929E9E; display: inline-block; margin-bottom  : 0px">@${artInfoComment.reply_to_id }</p>
											${artInfoComment.art_comment }
											<div style="margin-left : 70px; margin-bottom : 20px;">
										<a role="button" onclick="co_comment(${artInfoComment.art_num},${artInfoComment.art_comment_group}, ${current}, '${artInfoComment.id }');"><span style="font-size: 10px; margin-right: 10px;">답글달기</span></a>
											<c:if test="${artInfoComment.id eq 'song'}">
											<a role="button" onclick="deleteCoComment(${artInfoComment.art_comment_num}, ${artInfoComment.art_num})"><span style="font-size: 10px; color : red;">댓글삭제</span></a>
											</c:if>
										</div>
										<div id="depth${current}" style="margin-left : 70px;"></div>
									</c:if>
									<c:set var="current" value="${current + 1}" />
								</c:forEach> 
							</div>
						</div>
						<br>
						<hr style="width : 450px">
						<div style="width : 450px; margin-bottom:10px">
						<c:if test="${likeCheck == 0}">
							<div id="content_heart" style="display: inline-block;">
								<a role="button" onclick="heartProcess(${artInfo.artinfoNum })"> <i style="font-size: 30px;" class="far fa-heart"></i>
								</a>
							</div>
						</c:if>
						<c:if test="${likeCheck == 1}">
							<div id="content_heart" style="display: inline-block;">
								<a role="button" onclick="heartCancelProcess(${artInfo.artinfoNum })"> <i style="color: red; font-size: 30px;" class="fas fa-heart"></i>
								</a>
							</div>
						</c:if>
						<c:if test="${scrapCheck == 0}">
							<div id="content_scrap" style="display: inline-block; float: right">
								<a role="button" onclick="scrapProcess(${artInfo.artinfoNum })"> <i style="font-size: 30px;" class="far fa-bookmark"></i>
								</a>
							</div>
						</c:if>
						<c:if test="${scrapCheck == 1}">
							<div id="content_scrap" style="display: inline-block; float: right">
								<a role="button" onclick="scrapCancelProcess(${artInfo.artinfoNum })" style="outline: 0; border: 0;"> <i style="font-size: 30px;" class="fas fa-bookmark"></i>
								</a>
							</div>
						</c:if>
							</div>
						 <span id="likeCount">${likeCount }</span>명이 좋아합니다.
						<hr>
						<div>
						<div class="alert alert-warning alert-dismissible fade show comment_alert" style="margin : 0 auto; width : 350px; display : none;" role="alert">
						  <strong>댓글!</strong> 입력해주세요!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
						<label for="reply" class="col-form-label"><i style="font-size: 25px;" class="far fa-comment-dots"></i></label>
						&nbsp;
						<input class="form-control" style="width: 350px; height : 30px; display : inline-block; " type="text" id="reply" placeholder="댓글 입력" required />
						<a role="button" class="btn btn-sm btn-warning" style="height : 30px; " onclick="replyf(${artInfo.artinfoNum });">입력</a>
						</div>
					</div>
				</div>
			</div>
<!-- 		</div> -->
	</div>
</body>
</html>