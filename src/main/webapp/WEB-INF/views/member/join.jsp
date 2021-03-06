<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Artistar</title>
	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join.css">
	<!-- JS -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/join.js" ></script>
	
	<!-- icon -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
	
		
<style>
.panel-title {
	background-image:
		url(${pageContext.request.contextPath}/resources/image/index/header/logo2.png);
	background-position: 0 0;
	background-size: 200px 63px;
	background-repeat: no-repeat;
	height: 60px;
	width: 200px;
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
	<div class="container" style="margin-bottom: 20px;">
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
				<form name="form" action="" id="joinForm" method="post">
					<!-- signup panel -->
					<div class="panel panel-default text-center" style="width: 390px">
						<div class="panel-heading">
							<h3 class="panel-title"></h3>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<p class="signup-txt">???????????? ????????? ???????????? ????????? <br>???????????????.</p>

								<input type="text" class="form-control" id="id" name="id" placeholder="?????????" />
								<div class="userId regex"></div>
								<input type="text" class="form-control" id="uname" name="uname" placeholder="??????" />
								<div class="userName regex"></div>
								<input type="text" class="form-control" id="nickname" name="nickname" placeholder="?????????" />
								<div class="userNickname regex"></div>
								<input type="password" class="form-control" id="pw" name="pw" placeholder="????????????" />
								<div class="userPassword regex"></div>
								<input type="password" class="form-control" id="pwCheck" name="pwCheck"
									placeholder="???????????? ??????" />
									<div class="pwdCheck regex"></div>
								<div class="form-group-gender"> 
									<label for="mem_gender" style="float: left;  margin-top: 2px; padding-left: 10px;">?????? </label>
									<label style=" margin-right: 25px;">
										<input type="radio" name="gender" value="M" style=" margin: 5px 10px 5px;">???
									</label>/
									<label style=" margin-left: 10px;">
										<input type="radio" name="gender" value="F" style=" margin: 5px 10px 5px;">???
									</label>
								</div>
								<input type="text" class="form-control" id="email" name="email" placeholder="?????????" />
								<div class="userEmail regex"></div>
								<input type="button" class="form-control" id="emailSend" name="emailSend"  value="????????????"/>
								<div class="emailCodeBox" id="emailCodeBoxF">
								<input type="text" class="form-control" id="emailCode" name="emailCode" disabled="disabled" placeholder="?????? ??????" />
								</div>
								 <span id="emailCheckText"></span>
								<input type="text" class="form-control" id="phone" name="phone" placeholder="????????????" />
								<div class="userPhone regex"></div>
								<input type="text" class="form-control" id="address" name="address" placeholder="?????? (??????)" />
								<div class="userAddress regex"></div>
								<a class="btn btn-primary input-block-level form-control" id="joinBtn">??????</a>
							</div>
						</div>
					</div>
					<!-- /signup panel -->

					<!-- toLogin panel -->
					<div class="panel panel-default" style="width: 390px">
						<div class="panel-body" style="padding: 20px;text-align: center;">
							<p style="margin: 0;">????????? ???????????????? <a href="login">?????????</a></p>
						</div>
					</div>
					<!-- /toLogin panel -->

					<!-- toLogin panel -->
					<div class="app-download">
						<p>?????? ???????????? ?????????.</p>
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
						<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
					</div>

					<!-- /toLogin panel -->
				</form>
				<!-- /signup panel form -->
				<!-- contents-right -->
			</div>
		</div>
		</div>
		<!-- /main container -->
		
		<!-- footer -->
		<div class="row" style="margin: 180px 0 20px;">
			<div id="mainNav" class="col-lg-8 col-md-8 text-center">
				<div class="links">
					<li><a href="#">INSTAGRAM??????</a></li>
					<li><a href="#">??????</a></li>
					<li><a href="#">?????????</a></li>
					<li><a href="#">?????? ??????</a></li>
					<li><a href="#">API</a></li>
					<li><a href="#">????????????</a></li>
					<li><a href="#">????????????????????????</a></li>
					<li><a href="#">??????</a></li>
					<li><a href="#">????????????</a></li>
					<li><a href="#">??????</a></li>
				</div>
			</div>
			<div id="copyright" class="col-lg-2 col-md-3 col-md-offset-1 text-center">
				<div class="copyright">
					?? 2021 INSTAGRAM
				</div>
			</div>
		</div>
		<!-- /footer -->
		
	

</body>

</html>