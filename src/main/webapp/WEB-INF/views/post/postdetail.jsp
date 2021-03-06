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
<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/resources/image/index/template/tab-icon1.ico">

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
		<!-- comment?????? -->
		<div id="comment-wrap" class="d-inline-block">
			<div id="userprofile-wrap" class="d-inline-block">
				<span class="profile-span"><a href="${pageContext.request.contextPath}/mypost/${postdetail.id }">
				<img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" class="pic" alt="user profile image" width="30px"></a></span>
				<span><a href="${pageContext.request.contextPath}/mypost/${postdetail.id }" class="sub-span"><b>${postdetail.id }</b></a></span>
				<span>???</span>
				<!-- TODO: ??????????????? -->
				<span><a href="#" class="sub-span">?????????</a></span>
				<span style="padding-left: 100px;"><a href="#"><img src="${pageContext.request.contextPath}/resources/image/post/more.png" id="modal-more" alt="more"></a></span>
			</div>
			<div id="artistar-comment" class="d-inline-block">
				<!-- ??? ?????? -->
				<p>
					<span class="profile-span"><a href="${pageContext.request.contextPath}/mypost/${postdetail.id }">
					<img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" class="pic" alt="user profile image" width="30px">
					</a></span>
					<span><a href="#" class="sub-span"><b>${postdetail.id }</b></a></span>
					<span>${postdetail.postContent }</span>
				</p>
				<!-- ?????? -->
				<div id="comment-container" class="d-inline-block"></div>
			</div>
			<div class="artistar-icons">
            	<div class="icons-left">
                    <!-- ????????? -->
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
                    <!-- TODO: ??????/?????? ?????? -->
                    <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/speech.png" alt="chatting"></a>
                    <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/paperplane.png" alt="DM"></a>
                </div>
                <!-- TODO: ????????? ?????? -->
                <a href="#"><img class="icon-react" src="${pageContext.request.contextPath}/resources/image/post/bookmark_full.png" alt="bookmark"></a>
            </div>
            <!-- ??????????????? ?????? -->
            <div class="reaction">
                <div class="liked-people">
                    <b>????????? ${postdetail.postLikeCount }???</b>
                </div>
                <div class="time-log">
                    <span>${postdetail.postDate }</span>
                </div>
            </div>
            <!-- ?????? ?????? -->
			<div>
				<input id="input-comment" class="input-comment" type="text" placeholder="?????? ??????...">
				<button type="button" class="submit-comment">??????</button>
				<!-- TODO: ?????? ????????? ????????? disabled ???????????? -->
				<!-- 
					<input type="text" id="comment" placeholder="?????? ??????...">
					<input type="submit" value="??????" class="btn-comment">	
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
						<input type="submit" value="??????" class="btn-delete">
					</form>
	        	</p></div></a>
		       	<a href="#"><div id="modal-close">
		      	 	<p>??????</p>
		       	</div></a>
	        </div>
    	</div>
    	</c:when>

    	<c:otherwise>
   		<div class="modal-postdetail">
	        <div class="content-postdetail">
	        	<a href="#"><div class="modal-div" style="color: red">
	        		<p>??????</p>
	        	</div></a>
	        	<!-- TODO: ????????? ????????? ?????? ??????/??????????????? -->
	        	<a href="#"><div class="modal-div" style="color: red">
	        		<p>????????? ??????</p>
	        	</div></a>
		       	<a href="#"><div id="modal-close">
		      	 	<p>??????</p>
		       	</div></a>
	        </div>
    	</div>
    	</c:otherwise>
    </c:choose>

    
    <script>
	// ?????? ??? ????????????
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

	<script>
		$(function() {
			let postNum = "${postdetail.postNum }";
			// ?????? ?????? ??????
			getComment();
			// ?????? ???????????? ?????? disable
			$(".submit-comment").click(insertComment);
			$(".submit-comment").prop("disabled", true);
			// ?????? ??????????????? ????????? ?????? disable/enable
			$("#input-comment").on("input", function(){
				if($("#input-comment").val() != ""){
					$(".submit-comment").prop("disabled", false);
				}else {
					$(".submit-comment").prop("disabled", true);
				}
			});

			// ?????? ?????? ?????? ===================================================
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
						// ?????? ????????? ?????????
						$("#input-comment").val("");
						// ?????? ??? ????????????
						var str;
						$(data).each(function() {
							str += '<p>'
								+ '<span class="profile-span">'
								+ '<a href="${pageContext.request.contextPath}/mypost/' + this.id + '">'
								+ '<img src="'+ this.member_img +'" class="pic" alt="user profile image">'
								+ '</a>'
								+ '</span>'
								+ '<span>'
								+ '<a href="${pageContext.request.contextPath}/mypost/' + this.id + '" class="sub-span">'
								+ '<b>' + this.id + '</b>'
								+ '</a>'
								+ '</span>'
								+ '<span>'
								+ this.postComment
								+ '</span>'
						if(this.id == "${member.id}") {
							str	+= '<input type="hidden" value="' + this.postCommentNum + '" class="val-commentDel">'
								+ '<input type="submit" value="??????" class="btn-commentDel btn btn-light" style="border: white; background-color: white; color: gray; font-size: 12px; padding-left: 10px;">'
						}
								+ '</p>';
								$("#comment-container").html(str);
							});	// each
	                     // ?????? ??????
	                     $(".btn-commentDel").click(delComment);
					} // success
				
				}); // ajax
				
				}// getComment

			// ?????? ?????? ?????? ====================================================
			function delComment() {
					
				var postCommentNum = $(".val-commentDel").val();
				console.log("?????? ?????? postCommentNum: " + postCommentNum);
				// ?????? ????????? ??????
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
				}); // ajax
			} // delComment
			
			// ?????? ?????? ??? =====================================================
			function insertComment() {
				// ?????? ????????? ??????
				if ($("#input-comment").val() == "") {
					alert("????????? ????????? ?????????!");
				} else {
					var comment = $("#input-comment").val();
					console.log("input-comment: " + comment);
					// ?????? ????????? ??????
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



			// ????????? ==========================================================
			let checked;

			// ?????? ?????? ??? =======================================================
			$("#id-check-like").click(function() {
				// ????????? ???????????? ?????? ??????
				checked = $("#id-check-like").is(":checked");
				console.log(checked);
				// ?????? ????????? ??????
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

			// ?????? ????????? ????????? ?????? ================================================
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