<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cl" uri="http://cloudinary.com/jsp/taglib"%>
<%@ page import="com.mycompany.artistar.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- icon -->
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/image/index/template/favicon-star.png">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/post.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="../index/header.jsp"%>

	<!-- main -->
	<main>
		<div class="feeds">
			<!-- article -->
			<c:forEach items="${postlist }" var="postlist">
			<article>
				<header>
					<div class="profile-of-article">
						<img class="img-profile pic"
							src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png"
							alt="user profile image"> <span
							class="userID main-id point-span">${postlist.id }</span>
					</div>
					<img class="icon-react icon-more modal-more" src="${pageContext.request.contextPath}/resources/image/post/more.png" alt="more">
				</header>
				<div class="main-image">
				<!-- indicator -->
				<div id="carouselExampleIndicators_${postlist.postNum }" class="carousel slide d-inline-block" data-bs-ride="carousel">
					<!-- items -->
					<div class="carousel-inner d-inline-block">
						<c:forEach items="${postlist.postImgList }" var="postImgList" varStatus="i">
							<c:choose>
							<c:when test="${i.count == 1 }">
							<div class="carousel-item active">
								<img src="${postImgList.postImg }" class="w-100" height="500px" width="612px">
							</div>
							</c:when>
							<c:otherwise>
							<div class="carousel-item">
								<img src="${postImgList.postImg }" class="w-100" height="500px" width="612px">
							</div>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>

					<!-- button -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators_${postlist.postNum }" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators_${postlist.postNum }" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				</div>
				
				<div class="icons-react">
					<div class="icons-left">
					<!-- 좋아요 -->
                    <!-- TODO: hover시 마우스 포인터 바뀜 -->
					<c:set var="likeCheck" value="${postlist.likeCheck }" />
						<c:choose>
							<c:when test="${likeCheck == 1 }">
								<input type="checkbox" id="id-check-like" class="check-like" checked hidden>
								<label for="id-check-like">
								<img id="heart" class="icon-react curpoint" src="${pageContext.request.contextPath}/resources/image/post/heart_full.png">
								</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="id-check-like" class="check-like" hidden>
								<label for="id-check-like">
								<img id="heart" class="icon-react curpoint" src="${pageContext.request.contextPath}/resources/image/post/heart_empty.png">
								</label>
							</c:otherwise>
						</c:choose>
						<a href="#"><img class="icon-react"
							src="${pageContext.request.contextPath}/resources/image/post/speech.png"
							alt="chatting"></a> <a href="#"><img class="icon-react"
							src="${pageContext.request.contextPath}/resources/image/post/paperplane.png"
							alt="DM"></a>
					</div>
					<a href="#"><img class="icon-react"
						src="${pageContext.request.contextPath}/resources/image/post/bookmark_empty.png"
						alt="bookmark"></a>
					<!-- 북마크 기능 -->
				</div>
				<!-- article text data -->
				<div class="reaction">
					<div class="liked-people">
						<p>
							<b>좋아요 ${postlist.postLikeCount }개</b>
						</p>

					</div>
					<div class="description">
						<p>
							<span class="point-span userID"><b>${postlist.id }</b></span>
							<span> ${postlist.postContent }</span>
						</p>
					</div>
					<!-- 댓글 -->
					<div id="comment-container">
						<p>
							<span class="profile-span"><a href="#">
							<img src="${pageContext.request.contextPath}/resources/image/post/' + this.member_img + '" class="pic" alt="user profile image" width="30px">
							</a></span>
							<span><a href="#" class="sub-span"><b>${postlist.id }</b></a></span>
							<span>[postComment]-mapper수정필요</span>
						</p>
					</div>
						<div class="time-log">
							<span>${postlist.postDate }</span>
						</div>
				</div>
				<div class="hl"></div>
				<div class="comment">
					<input id="input-comment" class="input-comment" type="text"
						placeholder="댓글 달기...">
					<!-- submit-comment 은 항상 input-comment 다음에 두기 -->
					<button type="button" class="submit-comment" disabled>게시</button>
					<!-- hidden은 항상 submit-comment 다음에 두기 -->
					<input type="hidden" value="${postlist.postNum }">
				</div>
			</article>
			
	<!-- modal box -->
    <c:set var="id" value="${postlist.id }" />
    <c:set var="sessionId" value="${member.id }" />
    <c:choose >
    	<c:when test="${id == sessionId }">
   		<div class="modal-postlist pid_{postlist.id }">
	        <div class="content-postlist pid_{postlist.id }">
	        	<div class="modal-div curpoint"><p>
	        		<form action="${pageContext.request.contextPath}/post/postdelete" method="post">
						<input type="hidden" value="${postlist.postNum }" name="postNum">
						<input type="hidden" value="${postlist.id }" name="id">
						<input type="submit" value="삭제" class="btn-delete">
					</form>
	        	</p></div>
	        	<a href="${pageContext.request.contextPath}/post/postdetail?postNum=${postlist.postNum }" style="text-decoration: none; color: black;">
	        	<div class="modal-div">
	        		<p>게시물로 이동</p>
	        	</div></a>
		       	<div class="modal-close curpoint">
		      	 	<p>취소</p>
		       	</div>
	        </div>
    	</div>
    	</c:when>

    	<c:otherwise>
   		<div class="modal-postlist">
	        <div class="content-postlist">
	        	<div class="modal-div curpoint" style="color: red">
	        		<p>신고</p>
	        	</div>
	        	<!-- TODO: 팔로우 여부에 따라 취소/팔로우하기 -->
	        	<div class="modal-div curpoint" style="color: red">
	        		<p>팔로우 취소</p>
	        	</div>
		       	<div class="modal-close curpoint">
		      	 	<p>취소</p>
		       	</div>
	        </div>
    	</div>
    	</c:otherwise>
    </c:choose>
			</c:forEach>

		</div>
		<!-- main-right -->
		<div class="main-right">
			<div class="myProfile">
				<img class="pic"
					src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png"
					alt="user profile image">
				<div>
					<span class="userID point-span">[userId]</span> <span
						class="sub-span">[userName]</span>
				</div>
			</div>
			<!-- recommendation section -->
			<div class="section-recommend">
				<div class="menu-title">
					<span class="sub-title">회원님을 위한 추천</span> <a href="#"
						style="text-decoration: none;"><span class="find-more">모두
							보기</span></a>
				</div>
				<ul class="recommend-list" style="padding-left: 0;">
					<li>
						<div class="recommend-friend-profile">
							<a href="#"><img class="img-profile"
								src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png"
								alt="user profile image"></a>
							<div class="profile-text">
								<a href="#" style="text-decoration: none;"><span
									class="userID point-span">[popular userId]</span></a> <span
									class="sub-span">[popular userName]</span>
								<!-- TODO: 개인 마이페이지로 이동 -->
							</div>
						</div> <a href="#" style="text-decoration: none;"><span
							class="btn-follow">팔로우</span></a> <!-- TODO: 팔로우 추가 ajax --> <!-- 팔로우 하면 팔로잉으로 글자 변경. 팔로우 한 사람은 보이지 않음. -->
					</li>
					<!-- 여기까지 추천 아이디 하나 -->
					<!-- 스크롤 없이 딱 다섯개만 -->
			</div>
			<footer>
				<p class="insta-sccript">
					소개 ∙ 도움말 ∙ 홍보 센터 ∙ API ∙ 채용 정보 ∙ <br>개인정보처리방침 ∙ 약관 ∙ 위치 ∙ 인기계정
					∙ 해시태그 ∙ 언어 <br>
					<br> © 2020 INSTAGRAM FROM FACEBOOK
				</p>
			</footer>
		</div>
	</main>
    
    <script>
	// 모달 창 스크립트
	let $thisModal = "";
	
    $(".modal-more").click(function() {
    	$thisModal = $(this).parents("article").next();
    	$thisModal.show();
        // $(".modal-postlist").show();
    });
    $(".modal-close").click(function() {
    	$(this).parents(".modal-postlist").hide();
    	$thisModal = "";
        // $(".modal-postlist").hide();
    });

    $(window).click(function() {
        console.log(event.target);
        if($thisModal !="") {
            if(event.target == $thisModal.get(0)) {
            	$thisModal.hide();
            	$thisModal = "";
            }
        }

    });
    </script>





	<c:forEach items="${postlist }" var="postlist">
		<div class="post-contrainer">
			<a href="${pageContext.request.contextPath}/post/postdetail?postNum=${postlist.postNum }">
			postNum: ${postlist.postNum }</a><br>
			id: ${postlist.id }<br>
			postContent: ${postlist.postContent }<br>
			postLikeCount: ${postlist.postLikeCount }<br>
			likeCheck: ${postlist.likeCheck }<br>
			<!-- 이미지 영역 -->
			<c:forEach items="${postlist.postImgList }" var="postImgList">
				<img alt="postImg" src="${postImgList.postImg }">
				<br>
			</c:forEach>
			<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/post/postdelete"
				method="post">
				<input type="hidden" value="${postlist.postNum }" name="postNum">
				<input type="hidden" value="${postlist.id }" name="id"> <input
					type="submit" value="삭제" class="btn-delete">
			</form>
			<hr>
		</div>
	</c:forEach>

	<script>
	$(function() {		
		// 처음 로딩하면 게시 disable
		$(".submit-comment").prop("disabled", true);
		// 댓글 작성입력에 따라서 게시 disable/enable
		$(".input-comment").on("input", function(){
			if($(this).val() != ""){
				$(this).next().prop("disabled", false);
				$(this).next().click(insertComment);
			}else {
				$(this).next().prop("disabled", true);
			}
		});
		// 댓글 작성 시 =====================================================
		function insertComment() {
			// 댓글 유효성 검사
			if ($(this).prev().val() == "") {
				alert("댓글을 입력해 주세요!");
			} else {
				var postNum = $(this).next().val();
				var comment = $(this).prev().val();
				console.log("comment: " + comment);
				// 보낼 데이터 설정
				var dataAddc = {
					"postComment" : comment,
					"postNum" : postNum
				};
				console.log(dataAddc);
				// ajax
				$.ajax({
					url : "${pageContext.request.contextPath}/post/postaddc",
					type : "POST",
					data : dataAddc,
					dataType : "json",
					success : function() {
						console.log("댓글 달기 완성");
					}
				});
			}
		}
		
		// 좋아요 ==========================================================
		let checked;

		// 하트 클릭 시 =======================================================
		$("#id-check-like").click(function() {
			// 좋아요 체크박스 체크 여부
			checked = $("#id-check-like").is(":checked");
			console.log(checked);
			// 보낼 데이터 설정
			var datalike;
			if (checked) {
				datalike = {
					"likeCheck" : 1,
					"postNum" : postNum
				};
			} else {
				datalike = {
					"likeCheck" : 0,
					"postNum" : postNum
				};
			}
			console.log(datalike);
			// ajax
			$.ajax({
				url : "${pageContext.request.contextPath}/post/postlike",
				type : "POST",
				data : datalike,
				success : changeHeart()
			});
		});

		// 하트 이미지 바꾸기 함수 ================================================
		function changeHeart() {
			if (checked == true) {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_full.png");
			} else {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_empty.png");
			}
		};
	});
	</script>
</body>
</html>