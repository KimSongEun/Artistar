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

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/post/post.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
							src="${pageContext.request.contextPath}/resources/image/userhome.png"
							alt="user profile image"> <span
							class="userID main-id point-span">${postlist.id }</span>
					</div>
					<a href="#"><img class="icon-react icon-more"
						src="${pageContext.request.contextPath}/resources/image/post/more.png"
						alt="more"></a>
				</header>
				<div class="main-image">
					<img
						src="${pageContext.request.contextPath}/resources/image/post/image9.png"
						class="mainPic" height="500px" alt="post image">
					<!-- TODO: 세로 크기 잘라서 post image 넣기-->
				</div>
				<div class="icons-react">
					<div class="icons-left">
						<img class="icon-react"
							src="${pageContext.request.contextPath}/resources/image/post/heart_full.png"
							alt="heart">
						<!-- TODO: 좋아요 기능 -->
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
							<b>좋아요 [like count]개</b>
						</p>

					</div>
					<div class="description">
						<p>
							<span class="point-span userID"><b>[writerId]</b></span>
							[postContent]앞에 띄어쓰기
						</p>
					</div>
					<div class="comment-section">
						<div class="comments">
							<!-- TODO: 댓글 3개 이상이면 더 보기 나오게. 상세페이지로 링크 -->
							<a href="#" style="text-decoration: none; color: black;">
								<p style="margin-bottom: 1px;">댓글 더 보기</p>
							</a>
							<p style="margin-bottom: 1px;">
								<img class="pic"
									src="${pageContext.request.contextPath}/resources/image/userhome.png"
									alt="user profile image" width="20px;">
								<!-- TODO: 사진 잘라서 넣고 null 구분 -->
								<span class="point-span userID"><b>[userId]</b></span>
								<span>[comment]내용내용내용 언제끝낭</span>
							</p>
							<p>
								<img class="pic"
									src="${pageContext.request.contextPath}/resources/image/userhome.png"
									alt="user profile image" width="20px;"> <span
									class="point-span userID"><b>[userId]</b></span>
									<span>[comment]코멘트 딱 두개까지만</span>
							</p>
							<!-- input 값 여기에 추가 -->
						</div>
						<div class="time-log">
							<span>[time]아 모르겠당</span>
						</div>
					</div>
				</div>
				<div class="hl"></div>
				<div class="comment">
					<input id="input-comment" class="input-comment" type="text"
						placeholder="댓글 달기...">
					<button type="submit" class="submit-comment" disabled>게시</button>
					<!-- TODO: 글자 하나도 적히면 disabled 사라지게 -->
				</div>
			</article>
			</c:forEach>

		</div>
		<!-- main-right -->
		<div class="main-right">
			<div class="myProfile">
				<img class="pic"
					src="${pageContext.request.contextPath}/resources/image/userhome.png"
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
								src="${pageContext.request.contextPath}/resources/image/userhome.png"
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

	<c:forEach items="${postlist }" var="postlist">
		<div class="post-contrainer">
			<a
				href="${pageContext.request.contextPath}/post/postdetail?postNum=${postlist.postNum }">
				postNum: ${postlist.postNum }</a><br> id: ${postlist.id }<br>
			postContent: ${postlist.postContent }<br> postLikeCount:
			${postlist.postLikeCount }<br> likeCheck: ${postlist.likeCheck }<br>
			<!-- 이미지 영역 -->
			<c:forEach items="${postlist.postImgList }" var="postImgList">
				<img alt="postImg" src="${postImgList.postImg }">
				<br>
			</c:forEach>
			<!-- 삭제 -->
			<form action="${pageContext.request.contextPath}/post/postdelete"
				method="post">
				<input type="hidden" value="${postdetail.postNum }" name="postNum">
				<input type="hidden" value="${postdetail.id }" name="id"> <input
					type="submit" value="삭제" class="btn-delete">
			</form>
			<hr>
		</div>
	</c:forEach>

	<script>
	 </script>
</body>
</html>