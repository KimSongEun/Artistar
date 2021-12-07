<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cl" uri="http://cloudinary.com/jsp/taglib"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<br><br><br><br><br>
	${postdetail }
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
					<input type="checkbox" id="id-check-like" class="check-like" checked>
					<label for="id-check-like">
					<img id="heart" src="${pageContext.request.contextPath}/resources/image/post/heart_full.png">
					</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="id-check-like" class="check-like" >
					<label for="id-check-like">
					<img id="heart" src="${pageContext.request.contextPath}/resources/image/post/heart_empty.png">
					</label>
				</c:otherwise>
			</c:choose>
			
			<!-- 댓글 영역 -->
			<c:forEach items="${postComment }" var="postComment">
				<c:if test="${not empty postComment }">
					<p>댓글번호: ${postComment.postCommentNum } 작성자: ${postComment.id } 내용: ${postComment.postComment } 날짜: ${postComment.postCommentDate }</p>
				</c:if>
			</c:forEach>
			
			<!-- 댓글 작성 -->
			<input type="text" placeholder="댓글 달기...">
			<input type="submit" value="게시" class="btn-comment">
		</div>
	
	<script>
	// 좋아요
	$(function() {
		let checked;
		var postNum = "${postdetail.postNum }";
		// 하트 이미지 바꾸기 함수
		function changeHeart() {
		if(checked == true) {
			$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_full.png");
			} else {
			$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_empty.png");
			}
		};
		
		// 하트 클릭 시 ========================================================
		$("#id-check-like").click(function() {
			// 좋아요 체크박스 체크 여부
			checked = $("#id-check-like").is(":checked");
			console.log(checked);
			var dataForm;
			// 보낼 데이터 설정
			if(checked) {
				dataForm = {"likeCheck" : 1, "postNum" : postNum};
			} else {
			    dataForm = {"likeCheck" : 0, "postNum" : postNum};
			}
			console.log(dataForm);
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postlike",
				type: "POST",
				data: dataForm,
				success: changeHeart()
				});
		});
	});
	</script>
</body>
</html>