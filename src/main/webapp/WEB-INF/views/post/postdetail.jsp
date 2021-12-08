<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cl" uri="http://cloudinary.com/jsp/taglib"%>
<%@ page import="com.mycompany.artistar.member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<br><br><br><br><br><br><br>
	${member }
	<hr>
	
	<!-- Post -->
		<div class="post-contrainer">
			postNum: ${postdetail.postNum }<br>
			id: ${postdetail.id }<br>
			postContent: ${postdetail.postContent }<br>
			postLikeCount: ${postdetail.postLikeCount }<br>
			likeCheck: ${postdetail.likeCheck }<br>
			postDate: ${postdetail.postDate }<br>
			<!-- 이미지 영역 -->
			<c:forEach items="${postdetail.postImgList }" var="postImgList">
				<img alt="postImg" src="${postImgList.postImg }"><br>
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
			
			<!-- 댓글 영역 -->
			<div id="comment-container">
			</div>
			
			<!-- 댓글 작성 -->
			<input type="text" id="comment" placeholder="댓글 달기...">
			<input type="submit" value="게시" class="btn-comment">
		</div>
		
	<script>
	$(function() {
		var postNum = "${postdetail.postNum }";
		// 처음 댓글 로딩
		getComment();
		
		// 댓글 목록 함수 ===================================================
		function getComment() {
			var dataclist = {"postNum" : postNum}
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postcomment",
				type: "POST",
				data: dataclist,
				dataType: "json",
				success: function(data){
					console.log(data);
					// 댓글 입력창 비우기
					$("#comment").val("");
					// 댓글 값 가져오기
					var str;
					$(data).each(function(){
						str +=	"<p>" + this.postCommentNum + "</p>"
							+	"<p>" + this.postComment + "</p>"
							+	"<p>" + this.id + "</p>"
							+	"<p>" + this.postCommentDate + "</p>"
							+	'<input type="hidden" value="' + this.postCommentNum + '" class="val-commentDel">'
							+	'<input type="submit" value="삭제" class="btn-commentDel">'
							// TODO: 세션 아이디랑 댓글 아이디랑 같을 때만 삭제 버튼 보이기
					});
					$("#comment-container").html(str);
					
					// 댓글 삭제
					$(".btn-commentDel").click(function() {
						delComment()
					});

				}
			});
		}
		
		// 댓글 작성 시 =====================================================
		$(".btn-comment").click(function() {
			// 댓글 유효성 검사
			if($("#comment").val() == "") {
				alert("댓글을 입력해 주세요!");
			} else {
				var comment = $("#comment").val();
				console.log("comment: " + comment);
				// 보낼 데이터 설정
				var dataAddc = {"postComment" : comment, "postNum" : postNum};
				console.log(dataAddc);
				// ajax
				$.ajax({
					url: "${pageContext.request.contextPath}/post/postaddc",
					type: "POST",
					data: dataAddc,
					dataType: "json",
					success: function() {
						getComment();
					}
				});
			}
		});
		
		// 댓글 삭제 함수 ====================================================
		function delComment() {
			var postCommentNum = $(".val-commentDel").val();
			console.log("댓글 삭제 postCommentNum: " + postCommentNum);
			// 보낼 데이터 설정
			var dataDelc = {"postCommentNum" : postCommentNum, "postNum" : postNum};
			console.log(dataDelc);
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postdelc",
				type: "POST",
				data: dataDelc,
				dataType: "json",
				success: function() {
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
			if(checked) {
				datalike = {"likeCheck" : 1, "postNum" : postNum};
			} else {
				datalike = {"likeCheck" : 0, "postNum" : postNum};
			}
			console.log(datalike);
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postlike",
				type: "POST",
				data: datalike,
				success: changeHeart()
			});
		});
		
		// 하트 이미지 바꾸기 함수 ================================================
		function changeHeart() {
			if(checked == true) {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_full.png");
				} else {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_empty.png");
				}
			};
	});
	</script>
		
</body>
</html>