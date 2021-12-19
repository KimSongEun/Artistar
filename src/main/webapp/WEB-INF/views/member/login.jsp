<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Instagram</title>
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/login.css">
	<!-- JS -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/login.js" ></script>
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

.login_button {

	border: none;
	height: 35px;
	font-weight: bold;
	line-height: 1.8;
	margin-top: 12px;
	color: white;
	width: 260px;
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
			<div id="content-right" class="col-lg-4" style="top:90px; margin-top: 80px;">



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
								<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" />
								<input type="button" class="login_button" value="로그인" style="	background-color: #3c93ef;">
								
								<div style="text-align: center; margin-top:15px; font-size:13px">
									<a href="${pageContext.request.contextPath}/pwfind">비밀번호를 잊으셨나요?</a>
								</div>
							</div>

						</div>
					</div>
					<!-- /signup panel -->

					<!-- toSignup panel -->
					<div class="panel panel-default">
						<div class="panel-body" style="padding: 20px;text-align: center;">
							<p style="margin: 0;">계정이 없으신가요? <a href="${pageContext.request.contextPath}/joinagree">가입하기</a>
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
	<script>
		$(function() {
			var responseMessage = "<c:out value="${message}" />";
			if (responseMessage != "") {
				alert(responseMessage)
			}
		})
	</script>
</body>

</html>