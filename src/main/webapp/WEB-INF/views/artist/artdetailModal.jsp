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
	<div class="modal-header">
		<h5 class="modal-title">Feed</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body" style="height: 600px; positon: fixed;">

		<div class="container">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-8 ml-auto">
						<img src="resources/image/artist/artistdetail/brush.png" class="d-block w-100" style="width: 100%; height: 570px; object-fit: cover;" alt="...">
					</div>

					<div style="text-align: left;" class="col-md-4 ml-auto">
						<img src="resources/image/artist/artistdetail/brush.png" style="border-radius: 70%; width: 30px; height: 30px;" /> <a style="font-weight: bold; color: black;" href="#작가 detail로 go">작가명</a>
<%-- 팔로우 안했으면						<c:if test="${user_id != feed.user_id}">
							<c:if test="${followCh == 0}"> --%>
								<div style="display: inline-block" id="follow">
									<a role="button" onclick="followProcess('${user_id}', '${feed.user_id}', ${followCh})"> <i style="font-size: 20px; margin-left: 10px; color: black;" class="fas fa-user-plus"></i>
									</a>
								</div>
<%-- 							</c:if> --%>
<%-- 팔로우 했으면							<c:if test="${followCh == 1}"> --%>
								<div style="display: inline-block" id="follow">
									<a role="button" onclick="followProcess('${user_id}', '${feed.user_id}', ${followCh})"> <i style="font-size: 20px; margin-left: 10px; color: #3178EA;" class="fas fa-user-check"></i>
									</a>
								</div>
<%-- 							</c:if>
						</c:if> --%>
						<a role="button" onclick="popup()"><i style="float: right; font-size:30px; color: black;" class="fas fa-exclamation-circle"></i></a>

						<hr>
						<div style="overflow: auto; height: 350px;">

							작품 정보 내용 쭉
						
							<br/>
							
							해시태그
<%-- 해쉬태그							<c:set var="hash_split" value="${fn:split(feed.feed_hash, '#') }"/>
							<c:forEach var="hash" items="${hash_split}" varStatus="status">
								<a href="/cdd/searchResult.cdd?search=${hash}">#${hash}</a>
							</c:forEach> --%>
							
							<hr>
							<div id="reply_body">
 								<c:set var="test10" value="0" />
	<%--							<c:forEach var="reply" items="${replies}" varStatus="status">

									<c:if test="${reply.reply_level == 0}"> 원본 댓글 --%>
										<img src="resources/image/artist/artistdetail/brush.png" style="border-radius: 70%; width: 30px; height: 30px;" />
										<a style="font-weight: bold; color: black;" href="#사용자정보보기">댓글글쓴이</a>
											댓글내용<br/>
											<a role="button" onclick="popup()"><span style="float: right; font-size: 10px">댓글신고</span></a>
										<a role="button" onclick="reply_depth(${feed.feed_num},'${user_id}', ${reply.reply_num}, ${test10}, '${reply.user_id}', 1);"><span style="float: right; font-size: 10px; margin-right: 10px;">답글달기</span></a>
										<div id="depth${test10}"></div>


										<hr>



<%-- 									</c:if> --%>
<%-- 		답글일때							<c:if test="${reply.reply_level == 1}"> --%>
										
										<img src="resources/image/artist/artistdetail/brush.png" style="margin-left: 30px; border-radius: 70%; width: 30px; height: 30px; margin-left: 30px;" />
										<a style="font-weight: bold; color: black;" href="#사용자정보상세보기">답글단사용자아이디</a>
										<p style="color: #929E9E; display: inline-block">원본글 사용자 아이디</p>
											댓글내용<br/>
											<a role="button" onclick="popup()"><span style="float: right; font-size: 10px">댓글신고</span></a>
										<a role="button" onclick="reply_depth(${feed.feed_num},'${user_id}', ${reply.reply_num}, ${test10}, '${reply.user_id}', 1);"><span style="float: right; font-size: 10px; margin-right: 10px;">답글달기</span></a>
										<div id="depth${test10}"></div>
										<hr>
									<%-- </c:if> --%>
									<c:set var="test10" value="${test10 + 1}" />
							<%-- 	</c:forEach> --%>
							</div>
						</div>
<%-- 						<c:if test="${likeCh == 0}">
							<div id="content_heart" style="display: inline-block;">
								<a role="button" onclick="heartProcess(${feed.feed_num},'${user_id}',${likeCh},'${feed.user_id}',${index2});"> <i style="font-size: 30px;" class="far fa-heart"></i>
								</a>
							</div>
						</c:if>
						<c:if test="${likeCh == 1}">
							<div id="content_heart" style="display: inline-block;">
								<a role="button" onclick="heartProcess(${feed.feed_num}, '${user_id}',${likeCh},'${feed.user_id}',${index2})"> <i style="color: red; font-size: 30px;" class="fas fa-heart"></i>
								</a>
							</div>
						</c:if> --%>
							<div id="content_heart" style="display: inline-block;">
								<a role="button" onclick="heartProcess(${feed.feed_num},'${user_id}',${likeCh},'${feed.user_id}',${index2});"> <i style="font-size: 30px;" class="far fa-heart"></i>
								</a>
							</div>
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
							ㄴ<div id="content_bookmark" style="display: inline-block; float: right">
								<a role="button" onclick="bookmarkProcess(${feed.feed_num}, '${user_id}', ${bookCh}, ${index2})"> <i style="font-size: 30px;" class="far fa-bookmark"></i>
								</a>
							</div>
						<br /> <br /> 1명이 좋아합니다.
						<hr>
						<input style="width: 80%;" type="text" id="reply" placeholder="댓글 달기..." />
						<a role="button" onclick="test(${feed.feed_num},'${user_id}',0,null, 0,null);"><i style="float: right; font-size: 30px;" class="far fa-comment-dots"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>