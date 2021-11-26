<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postlist</title>

<!-- css -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/postlist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/postlist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index/header.js"></script>

</head>
<body>
	<%@ include file="../index/header.jsp" %>

	<!-- main -->
	<div class="main">
		<div class="container">

			<!--left -->
			<div class="contents_left">
				<div class="inner">
					<ul class="feeds_list">
						<li class="feeds_list_li">
							<div class="feed_profile">
								<div class="profile">
									<img src="images/profile.png" alt="profile" class="profile_img">
									<p class="profile_id">아이디</p>
								</div>
								<div class="profile_add link_list">
									<button type="button" class="state_btn">
										<img
											src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
											alt="adf">
									</button>
								</div>
							</div>
							<div class="feed_box">
								<img
									src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-15/e35/94610049_230124178062421_322929445227861032_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&_nc_cat=1&_nc_ohc=M1ZgPJB62boAX-12VGR&oh=ec1d7c93922878ab1f30cc09075ac8dc&oe=5ECF0669
                                    "
									alt="feed_img">
							</div>
							<div class="feed_info">
								<div class="feed_state">
									<ul class="link_list">
										<li>
											<button type="button" class="state_btn">
												<img
													src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png
                                                    "
													alt="like_img">
											</button>
										</li>
										<li>
											<button type="button" class="state_btn">
												<img
													src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png"
													alt="comment_img">
											</button>
										</li>
										<li>
											<button type="button" class="state_btn">
												<img
													src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/share.png"
													alt="share_img">
											</button>
										</li>
									</ul>
									<div class="link_list">
										<button type="button" class="state_btn">
											<img
												src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/bookmark.png"
												alt="bookmark_img">
										</button>
									</div>
								</div>
								<div class="feed_comments">
									<div class="feed_likes comments_margin">
										<div class="likes_user profile">
											<img src="img/profile-img.jpg" alt="profile"
												class="profile_img">
										</div>
										<div class="comments_info">
											<p class="comments_tit">
												<span class="user_id">000</span>님 <span>외 <span
													class="likes_number">10명</span></span>이 좋아합니다.
											</p>
										</div>
									</div>
									<div class="comment_list comments_margin">
										<ul class="comments_info comment_list_ul">
											<li>
												<div class="comments_tit">
													<span class="user_id">아이디</span> <span
														class="comment_contents">쿠킹클래스</span>
												</div>
											</li>
										</ul>
										<div class="feed_time">
											<p class="time">4시30분</p>
										</div>
									</div>
								</div>
							</div> <!-- comment form -->
							<form class="comments_form">
								<div class="input_box">
									<input type="text" placeholder="댓글달기..." id="comment_input">
								</div>
								<div class="button_box">
									<button type="button" class="btn" disabled="disabled">
										<span class="">게시</span>
									</button>
								</div>
							</form> <!-- //comment form -->
						</li>

					</ul>
				</div>
			</div>
			<!-- //left -->

			<!-- right -->
			<div class="contents_right">
				<!-- aside -->
				<aside class="aside">
					<div class="feed_profile aside_profile">
						<div class="profile">
							<img src="img/profile-img.jpg" alt="profile" class="profile_img">
							<div class="pofile_info">
								<p class="profile_id">아이디</p>
								<p class="profile_intro">자기소개</p>
							</div>
						</div>
					</div>
					<div class="follow">
						<div class="follow_info follow_story">
							<div class="follow_title">
								<span class="text_tit">스토리</span> <a href="#"> <span
									class="sub_tit">모두보기</span>
								</a>
							</div>
							<div class="follow_list_wrap feed_profile">
								<ul class="profile follow_list scroll">
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">1시간 전</p>
										</div></li>
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">1시간 전</p>
										</div></li>
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">1시간 전</p>
										</div></li>
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">1시간 전</p>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="follow_info">
							<div class="follow_title">
								<span class="text_tit">회원님을 위한 추천</span> <a href="#"> <span
									class="sub_tit">모두보기</span>
								</a>
							</div>
							<div class="follow_list_wrap feed_profile">
								<ul class="profile follow_list">
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">아아디 외 2명이 팔로우</p>
										</div>
										<div class="follow_btn">
											<button type="button" class="btn">
												<span>팔로우</span>
											</button>
										</div></li>
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">ABCDEFGHIJK 외 2명이 팔로우</p>
										</div>
										<div class="follow_btn">
											<button type="button" class="btn">
												<span>팔로우</span>
											</button>
										</div></li>
									<li><img src="img/profile-img.jpg" alt="profile"
										class="profile_img">
										<div class="pofile_info">
											<p class="profile_id">아이디</p>
											<p class="profile_intro">아아디 외 2명이 팔로우</p>
										</div>
										<div class="follow_btn">
											<button type="button" class="btn">
												<span>팔로우</span>
											</button>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</aside>
				<!-- //aside -->

				<!-- footer -->
				<footer class="footer">
					<span>KH Project Artistar</span>
				</footer>
				<!-- //footer -->
			</div>
			<!-- // rigth -->
		</div>
	</div>
	<!-- //main -->
	</div>



</body>
</html>