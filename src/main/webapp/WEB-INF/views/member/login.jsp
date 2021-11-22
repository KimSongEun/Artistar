<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Instagram</title>
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/login.css">
	<!-- icon -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
	<style>
		.panel-title {
			background-image:
				url(${pageContext.request.contextPath}/resources/image/member/login/main_02.png);
			background-position: 0 0;
			background-size: 395px 371px;
			background-repeat: no-repeat;
			height: 51px;
			width: 175px;
			margin: 0 auto;
		}
		
		.mainImgWrapper-1 {
			width: 454px;
			height: 660px;
			margin-left: 55px;
			background:
				url(${pageContext.request.contextPath}/resources/image/member/login/main_01.png);
			background-size: 454px 618px;
			background-repeat: no-repeat;
		}
</style>
</head>

<body>
	<!-- main container -->
	<div class="container" style="margin-bottom: 50px;">
		<div class="row">
			<!-- contents-left -->
			<div id="content-left" class="col-lg-5 col-sm-offset-1 hidden-sm hidden-xs" style="top:130px;">
				<div class="mainImgWrapper-1">
					<img src="${pageContext.request.contextPath}/resources/image/member/login/main_inappImage1.jpg" alt="image1" />
					<img src="${pageContext.request.contextPath}/resources/image/member/login/main_inappImage2.jpg" alt="image2" />
					<img src="${pageContext.request.contextPath}/resources/image/member/login/main_inappImage3.jpg" alt="image3" />
				</div>
			</div>
			<!-- /contents-left -->

			<!-- contents-right -->
			<div id="content-right" class="col-lg-4" style="top:90px;">



				<!-- logion panel form -->
				<form action="" id="loginForm" method="post">
					<!-- signup panel -->
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control" id="id" name="id" placeholder="아이디" />
								<input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호" />
								<input type="button" class="login_button" value="로그인">
								
								<div style="text-align: center; margin-top:15px; font-size:13px">
									<a href="#">비밀번호를 잊으셨나요?</a>
								</div>
							</div>

							<c:if test="${result == 0 }">
								<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>


						</div>
					</div>
					<!-- /signup panel -->

					<!-- toSignup panel -->
					<div class="panel panel-default">
						<div class="panel-body" style="padding: 20px;text-align: center;">
							<p style="margin: 0;">계정이 없으신가요? <a href="javascript:fn_changeSection('signup')">가입하기</a>
							</p>
						</div>
					</div>
					<!-- /toSignup panel -->


					<!-- appdown panel -->
					<div class="app-download">
						<p>앱을 다운로드 하세요.</p>
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
					</div>

					<!-- /appdown panel -->
				</form>
				<!-- /login panel form -->
			</div>
			<!-- contents-right -->
		</div>

		<!-- footer -->
		<div class="row" style="margin-top:200px;">
			<div id="mainNav" class="col-lg-8 col-md-8 text-center">
				<div class="links">
					<li><a href="#">INSTAGRAM정보</a></li>
					<li><a href="#">지원</a></li>
					<li><a href="#">블로그</a></li>
					<li><a href="#">홍보 센터</a></li>
					<li><a href="#">API</a></li>
					<li><a href="#">채용정보</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">약관</a></li>
					<li><a href="#">디렉터리</a></li>
					<li><a href="#">언어</a></li>
				</div>
			</div>
			<div id="copyright" class="col-lg-2 col-md-3 col-md-offset-1 text-center">
				<div class="copyright">
					© 2021 INSTAGRAM
				</div>
			</div>
		</div>
		<!-- /footer -->
	</div>
	<!-- /main container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		window.onload = function () {
			fn_resizeContents();
		};

		//Resize Event
		window.onresize = function () {
			fn_resizeContents();
		};

		var imgs = $(".mainImgWrapper-1 img");
		var imgId = 1;
		setInterval(function () {
			$(".mainImgWrapper-1 img").fadeOut(3000);
			$(imgs[imgId - 1]).fadeIn(3000);
			if (imgId == 3) imgId = 1;
			else imgId++
		}, 6000);

		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function(){
			
			//alert("로그인 버튼 작동");
			
			/* 로그인 메서드 서버 요청 */
			$("#loginForm").attr("action", "/artistar/member/login");
			$("#loginForm").submit();
			
		});


		//Resize Contents Function
		var fn_resizeContents = function () {

			var width = document.body.offsetWidth;

			//Init Contents Section
			$("#content-right").attr("style", "top:" + chnHeight);

			if (width >= 1200) {
				//Contents Section
				$("#content-left").attr("class", "col-lg-5 col-sm-offset-1 hidden-sm hidden-xs");
				$("#content-right").attr("class", "col-lg-4");
			}

			if (width >= 992 && width < 1200) {
				//Contents Section
				$("#content-left").attr("class", "col-md-6 hidden-sm hidden-xs");
				$("#content-right").attr("class", "col-md-5");
			}

			if (width < 992 && width >= 768) {
				//Contents Section
				$("#content-right").attr("class", "col-sm-6 col-sm-offset-3");
			}

			if (width >= 735 && width < 768) {
				//Contents Section
				$("#content-right").attr("style", "width:50%;margin-left:25%;top:90px;");
			}

			if (width < 735) {
				//Contents Section
				$("#content-right").attr("class", "col-xs-12");
				$("#content-right").attr("style", "top: 0;");
			}
		}
	</script>

</body>

</html>