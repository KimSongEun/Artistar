<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Instagram</title>

<!-- css -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/pwfind.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="resources/js/member/pwfind.js"></script>

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

</head>

<body>
	<!-- main container -->
	<div class="container" style="margin-bottom: 50px; ">

		<!-- contents-mail -->
		<div id="content-mail" class="col-lg-4" style="top:90px;">
			<!-- mail panel form -->
			<form name="form" class = "content" id="pwFindForm" method="post">
				<!-- mail panel -->
				<div class="panel panel-default text-center" style="margin-bottom: 15px;">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath}/resources/image/member/pwfind/pwfind.PNG" alt="" style="width: 96px; height: 96px;">
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div style="text-align: center; margin-bottom:20px; font-size:18px; font-weight: bold;">
								비밀번호 찾기
							</div>
							<div style="text-align: center; margin-top:15px; margin-bottom:25px; font-size:13px">
								이름, 아이디, 이메일을 입력해주세요. <br>작성된 이메일로 인증 코드를 보내드립니다. <br>
							</div>
							<input type="text" id="uname" name="uname" class="form-control" placeholder="이름" style="margin-bottom:15px;" />
							<input type="text" id="id" name="id"  class="form-control" placeholder="아이디" style="margin-bottom:15px;" />
							<input type="text" id="email" name="email" class="form-control" placeholder="이메일" style="margin-bottom:15px;" />
							<a id="check" class="btn btn-primary input-block-level form-control">다음</a>
							<div style="text-align: center; margin-top:15px; font-size:13px">
								<a href="#">돌아가기</a>
							</div>
							<div class="hr-sect">
								<div style="margin: 0 10px;"">또는</div>
							</div>
							<a href=" #">새 계정 만들기</a>

								</div>
							</div>
						</div>
						<!-- /mail panel -->
					</form>
					<!-- /mail panel form -->
						<!-- tologin panel -->
						<div class="panel panel-default" style="margin: 0 0 20px;">
							<div class="panel-body" style="padding: 20px;text-align: center;">
								<p style="margin: 0;">계정이 있으신가요? <a href="javascript:fn_changeSection('login')">로그인</a>
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
		<!-- contents-mail -->
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
$(function(){
  var responseMessage = "<c:out value="${message}" />";
   if (responseMessage != ""){
       alert(responseMessage)
   }
})
</script>

</body>

</html>