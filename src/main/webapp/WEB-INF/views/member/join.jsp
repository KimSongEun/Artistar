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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join.css">
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

				<!-- signup panel form -->
				<form action="" id="joinForm" method="post">
					<!-- signup panel -->
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<p class="signup-txt">친구들의 사진과 동영상을 보려면 가입하세요.</p>

								<input type="text" class="form-control" id="id" name="id" placeholder="아이디" />
								<input type="text" class="form-control" id="uname" name="uname" placeholder="성명" />
								<input type="text" class="form-control" id="nickname" name="nickname"
									placeholder="닉네임" />
								<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" />
								<input type="password" class="form-control" id="pwCheck" name="pwCheck"
									placeholder="비밀번호 확인" />
								<div class="form-group-gender"> <label for="gender">성별 </label> <input
										type="checkbox" id="gender" name="gender" value="M">남 <input type="checkbox"
										id="gender" name="gender" value="F">여 </div>
								<div class="form-group-kind"> <label for="kind">구분 </label> <input
										type="checkbox" id="kind" name="kind" value="U">사용자 <input type="checkbox"
										id="kind" name="kind" value="A">관리자</div>
								<input type="text" class="form-control" id="email" name="email" placeholder="이메일" />
								<input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호" />
								<input type="text" class="form-control" id="address" name="address" placeholder="주소" />
								<input type="text" class="form-control" id="intro" name="intro" placeholder="소개" />
								<input type="button" class="join_button" value="가입">
								<!--  <a href="#" class="btn btn-primary input-block-level form-control" id="join_button">가입</a>-->
								<div style="text-align: center;">
									<p style="padding: 20px;">가입하면 Instagram의 약관 및 개인정보 처리방침에 동의하게 됩니다.</p>
								</div>
							</div>
						</div>
					</div>
					<!-- /signup panel -->

					<!-- toLogin panel -->
					<div class="panel panel-default">
						<div class="panel-body" style="padding: 20px;text-align: center;">
							<p style="margin: 0;">계정이 있으신가요? <a href="javascript:fn_changeSection('login');">로그인</a></p>
						</div>
					</div>
					<!-- /toLogin panel -->

					<!-- toLogin panel -->
					<div class="app-download">
						<p>앱을 다운로드 하세요.</p>
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
					</div>

					<!-- /toLogin panel -->
				</form>
				<!-- /signup panel form -->
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
						© 2017 INSTAGRAM
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
			
			$(document).ready(function(){
				//회원가입 버튼(회원가입 기능 작동)
				$(".join_button").click(function(){
					$("#joinForm").attr("action", "/artistar/member/join");
					$("#joinForm").submit();
				});
			});

			var imgs = $(".mainImgWrapper-1 img");
			var imgId = 1;
			setInterval(function () {
				$(".mainImgWrapper-1 img").fadeOut(3000);
				$(imgs[imgId - 1]).fadeIn(3000);
				if (imgId == 3) imgId = 1;
				else imgId++
			}, 6000);

			//Change Section
			var chnHeight = "90px";
			var fn_changeSection = function (sectionNm) {
				var curSection = (sectionNm == "login") ? "signup" : "login";
				chnHeight = (sectionNm == "login") ? "200px" : "90px";

				$("#content-right").attr("style", "top:" + chnHeight);
				$("#" + sectionNm + "Form").show();
				$("#" + curSection + "Form").hide();
			};

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