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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/postdetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="../index/header.jsp"%>

	<!-- Post Detail -->
	<div id="post-contrainer">
		<div id="post-carousel" class="d-inline-block">
			<!-- indicator -->
			<div id="carouselExampleIndicators" class="carousel slide d-inline-block" data-bs-ride="carousel">
				<!-- items -->
				<div class="carousel-inner d-inline-block">
					<c:forEach items="${postdetail.postImgList }" var="postImgList" varStatus="i">
						<c:choose>
						<c:when test="${i.count == 1 }">
						<div class="carousel-item active">		
						<img src="${postImgList.postImg }" class="w-100" height="670px">
						</div>
						</c:when>
						<c:otherwise>
						<div class="carousel-item">		
						<img src="${postImgList.postImg }" class="w-100" height="670px">
						</div>
						</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<!-- button -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- comment영역 -->
		<div id="comment-wrap" class="d-inline-block">
			<div id="userprofile-wrap" class="d-inline-block">
				<span class="profile-span"><a href="#">
				<img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" class="pic" alt="user profile image" width="30px"></a></span>
				<span><a href="#" class="sub-span"><b>${postdetail.id }</b></a></span>
				<span>•</span>
				<!-- TODO: 팔로우기능 -->
				<span><a href="#" class="sub-span">[팔로우]</a></span>
				<span style="padding-left: 100px;"><a href="#"><img src="${pageContext.request.contextPath}/resources/image/post/more.png" id="modal-more" alt="more"></a></span>
			</div>
			<div id="artistar-comment" class="d-inline-block">
				<!-- 글 내용 -->
				<p>
					<span class="profile-span"><a href="#">
					<img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" class="pic" alt="user profile image" width="30px">
					</a></span>
					<span><a href="#" class="sub-span"><b>${postdetail.id }</b></a></span>
					<span>${postdetail.postContent }</span>
				</p>
				<!-- 댓글 -->
				<div id="comment-container"></div>
			</div>
			<div class="artistar-icons">
            	<div class="icons-left">
                    <!-- 좋아요 -->
                    <!-- TODO: hover시 마우스 포인터 바뀜 -->
					<c:set var="likeCheck" value="${postdetail.likeCheck }" />
						<c:choose>
							<c:when test="${likeCheck == 1 }">
								<input type="checkbox" id="id-check-like" class="check-like" checked hidden>
								<label for="id-check-like">
								<img id="heart" class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/heart_full.png">
								</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="id-check-like" class="check-like" hidden>
								<label for="id-check-like">
								<img id="heart" class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/heart_empty.png">
								</label>
							</c:otherwise>
						</c:choose>
                    <!-- TODO: 채팅/공유 기능 -->
                    <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/speech.png" alt="chatting"></a>
                    <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/paperplane.png" alt="DM"></a>
                </div>
                <!-- TODO: 북마크 기능 -->
                <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/bookmark_full.png" alt="bookmark"></a>
            </div>
            <!-- 좋아요갯수 날짜 -->
            <div class="reaction">
                <div class="liked-people">
                    <b>좋아요 ${postdetail.postLikeCount }개</b>
                </div>
                <div class="time-log">
                    <span>${postdetail.postDate }</span>
                </div>
            </div>
            <!-- 댓글 입력 -->
			<div>
				<input id="input-comment" class="input-comment" type="text" placeholder="댓글 달기...">
				<button type="button" class="submit-comment">게시</button>
				<!-- TODO: 글자 하나도 적히면 disabled 사라지게 -->
				<!-- 
					<input type="text" id="comment" placeholder="댓글 달기...">
					<input type="submit" value="게시" class="btn-comment">	
				 -->
			</div>
		</div>
	</div>

    <!-- modal box -->
    <c:set var="id" value="${postdetail.id }" />
    <c:set var="sessionId" value="${member.id }" />
    <c:choose >
    	<c:when test="${id == sessionId }">
   		<div class="modal-postdetail">
	        <div class="content-postdetail" style="height: 120px;">
	        	<a href="#"><div class="modal-div"><p>
	        		<form action="${pageContext.request.contextPath}/post/postdelete" method="post">
						<input type="hidden" value="${postdetail.postNum }" name="postNum">
						<input type="hidden" value="${postdetail.id }" name="id">
						<input type="submit" value="삭제" class="btn-delete">
					</form>
	        	</p></div></a>
		       	<a href="#"><div id="modal-close">
		      	 	<p>취소</p>
		       	</div></a>
	        </div>
    	</div>
    	</c:when>

    	<c:otherwise>
   		<div class="modal-postdetail">
	        <div class="content-postdetail">
	        	<a href="#"><div class="modal-div" style="color: red">
	        		<p>신고</p>
	        	</div></a>
	        	<!-- TODO: 팔로우 여부에 따라 취소/팔로우하기 -->
	        	<a href="#"><div class="modal-div" style="color: red">
	        		<p>팔로우 취소</p>
	        	</div></a>
		       	<a href="#"><div id="modal-close">
		      	 	<p>취소</p>
		       	</div></a>
	        </div>
    	</div>
    	</c:otherwise>
    </c:choose>

    
    <script>
	// 모달 창 스크립트
    $("#modal-more").click(function() {
        $(".modal-postdetail").show();
    });
    $("#modal-close").click(function() {
        $(".modal-postdetail").hide();
    });

    $(window).click(function() {
        console.log(event.target);
        if(event.target == $(".modal-postdetail").get(0)) {
            $(".modal-postdetail").hide();
        }
    });
    </script>


	<!-- Post Test용 -->
	<div class="post-contrainer">
		postNum: ${postdetail.postNum }<br>
		id: ${postdetail.id }<br>
		postContent: ${postdetail.postContent }<br>
		postLikeCount: ${postdetail.postLikeCount }<br>
		likeCheck: ${postdetail.likeCheck }<br>
		postDate: ${postdetail.postDate }<br>

		<!-- 이미지 영역 -->
		<c:forEach items="${postdetail.postImgList }" var="postImgList">
			<img alt="postImg" src="${postImgList.postImg }">
			<br>
		</c:forEach>

		<!-- 삭제 -->
		<form action="${pageContext.request.contextPath}/post/postdelete" method="post">
			<input type="hidden" value="${postdetail.postNum }" name="postNum">
			<input type="hidden" value="${postdetail.id }" name="id">
			<input type="submit" value="삭제" class="btn-delete">
		</form>

		<!-- 좋아요 -->
		<c:set var="likeCheck" value="${postdetail.likeCheck }" />
		<c:choose>
			<c:when test="${likeCheck == 1 }">
				<input type="checkbox" id="id-check-like" class="check-like" checked hidden>
				<label for="id-check-like">
				<img id="heart" src="${pageContext.request.contextPath}/resources/image/post/heart_full.png">
				</label>
			</c:when>
			<c:otherwise>
				<input type="checkbox" id="id-check-like" class="check-like" hidden>
				<label for="id-check-like">
				<img id="heart" src="${pageContext.request.contextPath}/resources/image/post/heart_empty.png">
				</label>
			</c:otherwise>
		</c:choose>
	</div>

	<script>
		$(function() {
			let postNum = "${postdetail.postNum }";
			// 처음 댓글 로딩
			getComment();
			// 처음 로딩하면 게시 disable
			$(".submit-comment").prop("disabled", true);
			// 댓글 작성입력에 따라서 게시 disable/enable
			$("#input-comment").on("input", function(){
				if($("#input-comment").val() != ""){
					$(".submit-comment").prop("disabled", false);
					$(".submit-comment").click(insertComment);
				}else {
					$(".submit-comment").prop("disabled", true);
				}
			});

			// 댓글 목록 함수 ===================================================
			function getComment() {
				var dataclist = {
					"postNum" : postNum
				}
				// ajax
				$.ajax({
					url : "${pageContext.request.contextPath}/post/postcomment",
					type : "POST",
					data : dataclist,
					dataType : "json",
					success : function(data) {
						console.log(data);
						// 댓글 입력창 비우기
						$("#input-comment").val("");
						// 댓글 값 가져오기
						var str;
						$(data).each(function() {
							str += '<p>'
								+ '<span class="profile-span">'
								+ '<a href="#">'
								+ '<img src="'+ this.member_img +'" class="pic" alt="user profile image">'
								+ '</a>'
								+ '</span>'
								+ '<span>'
								+ '<a href="#" class="sub-span">'
								+ '<b>' + this.id + '</b>'
								+ '</a>'
								+ '</span>'
								+ '<span>'
								+ this.postComment
								+ '</span>'
								+ '</p>'
								+ '<input type="hidden" value="' + this.postCommentNum + '" class="val-commentDel">'
								+ '<input type="submit" value="삭제" class="btn-commentDel">'
								// TODO: 세션 아이디랑 댓글 아이디랑 같을 때만 삭제 버튼 보이기
								$("#comment-container").html(str);
							});	
					}
				
				});
				
				// 댓글 삭제
				$(".btn-commentDel").click(function() {
					delComment()
				});
			}

			// 댓글 작성 시 =====================================================
			function insertComment() {
				// 댓글 유효성 검사
				if ($("#input-comment").val() == "") {
					alert("댓글을 입력해 주세요!");
				} else {
					var comment = $("#input-comment").val();
					console.log("input-comment: " + comment);
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
							getComment();
						}
					});
				}
			}

			// 댓글 삭제 함수 ====================================================
			function delComment() {
				var postCommentNum = $(".val-commentDel").val();
				console.log("댓글 삭제 postCommentNum: " + postCommentNum);
				// 보낼 데이터 설정
				var dataDelc = {
					"postCommentNum" : postCommentNum,
					"postNum" : postNum
				};
				console.log(dataDelc);
				// ajax
				$.ajax({
					url : "${pageContext.request.contextPath}/post/postdelc",
					type : "POST",
					data : dataDelc,
					dataType : "json",
					success : function() {
						getComment();
					}
				});
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