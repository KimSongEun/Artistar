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
	
	<!-- JS -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	
	
	<!-- icon -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
	
		
		<style>
			/*customizing righ-section*/
		.container {
			display: flex;
			justify-content: center;
		}


		.panel-default {
			border-radius: 0;
			margin-top: 10px;
			width: 350px;

		}

		.panel-default>.panel-heading {
			border-color: #fff;
			background-color: #fff;
			margin: 30px auto 20px;
		}


		.panel-body {
			padding: 0 40px 10px 40px;
		}



		.btn-primary {
			background-color: #3c93ef;
			border: none;
			height: 32px;
			line-height: 1.3;
			font-size: 14px;
		}


		.app-download {
			text-align: center;
		}

		/*footer links*/
		.links {
			font-size: 12px;
			font-weight: 600;
			margin: 0;
			padding: 0;
			list-style-type: none;
		}

		.links li {
			margin-right: 8px;
			display: inline-block;

		}

		.links a {
			color: #023369;
		}

		.copyright {
			color: #999;
			font-size: 12px;
			font-weight: 600;
			letter-spacing: 0.7px;
		}
</style>
</head>

<body>
	<!-- main container -->
	<div class="container">

		<!-- contents-agree -->
		<div id="content-agree" class="col-lg-4" style="top:90px;">

			<!-- agree panel -->
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<div style="text-align: center; margin-bottom:5px; font-size:18px">
						이용 약관에 동의
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div style=" text-align: center; margin-bottom:10px; font-size:16px">
							Artistar는 회원님의 개인 정보를
							안전하게 보호합니다.<br>
							새 계정을 만들려면 모든 약관에
							동의해주세요.
						</div>
						<div class="checkbox_group">
							<div style=" text-align: left;">
								<label for=" agreeAll" style=" margin-right: 90px; font-size:13px">이용약관
									3개에 모두 동의</label>
								<input type="checkbox" id="agreeAll" style="zoom:2.0;  position: relative;
								top: 2.5px;">
							</div>

							<hr style="margin: 0 auto; height:3px;border:none;background-color:lightgrey">

							<div style=" text-align: left;">
								<label for=" agree1" style=" margin-right: 60px; font-size:13px">이용 약관(필수)</label>
								<a id="agreeMore1" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree1" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
							<div style=" text-align: left;">
								<label for=" agree2" style="  margin-right: 47px;   font-size:13px">데이터
									정책(필수)</label>
								<a id="agreeMore2" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree2" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
							<div style=" text-align: left;">
								<label for=" agree3" style=" margin-right: 31px; font-size:13px">위치 기반
									기능(필수)</label>
								<a id="agreeMore3" class="moreBtn" style="margin-right: 20px; font-size:12px">더 알아보기</a>
								<input type="checkbox" id="agree3" class="agree" style="zoom:2.0;  position: relative;
								top: 2.8px;">
							</div>
						</div>
						<a id="nextBtn" class="btn btn-primary input-block-level form-control"
							style="  margin-top:25px; padding: 6px 0;">다음</a>
						<div style=" text-align: center; margin-top:15px; font-size:14px">
							<a href="login">돌아가기</a>
						</div>

					</div>
				</div>
			</div>
			<!-- /agree panel -->

			<!-- tologin panel -->
			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-body" style="padding: 20px;text-align: center;">
					<p style="margin: 0;">계정이 있으신가요? <a href="login">로그인</a>
					</p>
				</div>
			</div>
			<!-- /tologin panel -->


			<!-- appdown panel -->
			<div class="app-download">
				<p>앱을 다운로드 하세요.</p>
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
			</div>
			<!-- /appdown panel -->

		</div>
		<!-- contents-agree -->
	</div>

	<!-- footer -->
	<div class="row" style="margin: 180px 0 20px;">
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
	<script>
		// 체크박스 전체 선택
		$(".checkbox_group").on("click", "#agreeAll", function () {
			$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
		});

		// 체크박스 개별 선택
		$(".checkbox_group").on("click", ".agree", function () {
			var is_checked = true;

			$(".checkbox_group .agree").each(function () {
				is_checked = is_checked && $(this).is(":checked");
			});

			$("#agreeAll").prop("checked", is_checked);
		});

		$("#nextBtn").click(function () {
			var checkBox = document.getElementById("agreeAll");
			if (checkBox.checked == true) {
				location.href = "join";
			} else {
				alert('이용약관에 모두 동의해주세요');
			}
		});
	</script>

</body>

</html>