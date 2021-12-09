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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artdetailModal.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artdetailModal.js"></script>

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

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
						<img src="resources/image/artist/artistdetail/brush.png" style="border-radius: 70%; width: 30px; height: 30px;" /> &nbsp; <div style="height:48px; display : inline-block"><a style="font-weight: bold; color: black;" href="artistdetail?artistNum=${artInfo.artistNum }">${artInfo.artist.artistName }<img class="align-top" src="resources/image/artist/artistdetail/artist_check.png" width="13px"/></a></div>
							<div id="followImg" style="display:inline-block"></div>
						<a role="button" onclick="popup()"><i style="float: right; font-size:30px; color: black;" class="fas fa-exclamation-circle"></i></a>

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
												  
												  <div class="row mb-3">
												    <label for="artinfo_collection" class="col-sm-3 col-form-label">소장처</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_collection" id="collection" readonly value="${artInfo.artinfoCollection }"/>
												    </div>
												  </div>
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_detail" class="col-sm-3 col-form-label">상세정보</label>
												    <div class="col-sm-9" style="padding-right : 50px">
												      <input type="text" class="form-control" name="artinfo_detail" id="detail"  style="height : 200px" readonly value="${artInfo.artinfoDetail }"/>
												    </div>
												  </div>												  
												  <br>						
							
							<div class="col-sm-11" id="hashtagDiv">
						      <input type="text" class="form-control-plaintext" name="hashtag" id="hashtag" readonly value="#해시태그  #해시태그 #해시태그 #해시태그">
						    </div>
<%-- 해쉬태그							<c:set var="hash_split" value="${fn:split(feed.feed_hash, '#') }"/>
							<c:forEach var="hash" items="${hash_split}" varStatus="status">
								<a href="/cdd/searchResult.cdd?search=${hash}">#${hash}</a>
							</c:forEach> --%>
							
							<hr style="width : 400px">
							<div id="reply_body" style="width : 400px;">
 								<c:set var="test10" value="0" />
	<%--							<c:forEach var="reply" items="${replies}" varStatus="status">

									<c:if test="${reply.reply_level == 0}"> 원본 댓글 --%>
										<img src="resources/image/artist/artistdetail/brush.png" style="border-radius: 70%; width: 30px; height: 30px;" />
										<a style="font-weight: bold; color: black;" href="#사용자정보보기">댓글글쓴이</a>
											댓글내용<br/>
											<a role="button" onclick="popup()"><span style="float: right; font-size: 10px">댓글신고</span></a>
										<a role="button" onclick="reply_depth(${feed.feed_num},'${user_id}', ${reply.reply_num}, ${test10}, '${reply.user_id}', 1);"><span style="float: right; font-size: 10px; margin-right: 10px;">답글달기</span></a>
										<div id="depth${test10}"></div>


										<!-- <hr> -->
										<br>



<%-- 									</c:if> --%>
<%-- 		답글일때							<c:if test="${reply.reply_level == 1}"> --%>
										
										<img src="resources/image/artist/artistdetail/brush.png" style="margin-left: 30px; border-radius: 70%; width: 30px; height: 30px; margin-left: 30px;" />
										<a style="font-weight: bold; color: black;" href="#사용자정보상세보기">답글단사용자아이디</a>
										<p style="color: #929E9E; display: inline-block">원본글 사용자 아이디</p>
											댓글내용<br/>
											<a role="button" onclick="popup()"><span style="float: right; font-size: 10px">댓글신고</span></a>
										<a role="button" onclick="reply_depth(${feed.feed_num},'${user_id}', ${reply.reply_num}, ${test10}, '${reply.user_id}', 1);"><span style="float: right; font-size: 10px; margin-right: 10px;">답글달기</span></a>
										<div id="depth${test10}"></div>
									<%-- </c:if> --%>
									<c:set var="test10" value="${test10 + 1}" />
							<%-- 	</c:forEach> --%>
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
						<%-- <c:if test="${bookCh == 0}">
							<div id="content_bookmark" style="display: inline-block; float: right">
								<a role="button" onclick="bookmarkProcess(${feed.feed_num}, '${user_id}', ${bookCh}, ${index2})"> <i style="font-size: 30px;" class="far fa-bookmark"></i>
								</a>
							</div>
						</c:if>
						<c:if test="${bookCh == 1}">
							<div id="content_bookmark" style="display: inline-block; float: right">
								<a role="button" onclick="bookmarkProcess(${feed.feed_num}, '${user_id}', ${bookCh}, ${index2})" style="outline: 0; border: 0;"> <i style="font-size: 30px;" class="fas fa-bookmark"></i>
								</a>
							</div>
						</c:if> --%>
							<div id="content_bookmark" style="display: inline-block; float: right">
								<a role="button" onclick="bookmarkProcess(${feed.feed_num}, '${user_id}', ${bookCh}, ${index2})"> <i style="font-size: 30px;" class="far fa-bookmark"></i>
								</a>
							</div>
							</div>
						 1명이 좋아합니다.
						<hr>
						<label for="reply" class="col-form-label"><i style="font-size: 25px;" class="far fa-comment-dots"></i></label>
						&nbsp;
						<input style="width: 370px;" type="text" id="reply" placeholder="댓글 달기..." />
						<a role="button" onclick="test(${feed.feed_num},'${user_id}',0,null, 0,null);">달기</a>
					</div>
				</div>
			</div>
<!-- 		</div> -->
	</div>
</body>
</html>