<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/pwnew.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/pwnew.js" ></script>
<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
</head>

<body>
	<!-- main container -->
	<div class="container" style="margin-bottom: 150px; ">
		<!-- contents-mail -->
		<div id="content-mail" class="col-lg-4" style="top:90px;">
			<!-- mail panel form -->		
			<form name="form" id="pwNewForm" method="post" class="content">		
				<!-- mail panel -->
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath}/resources/image/member/pwfind/password.png" alt="" style="width: 120px; height: 100px;">
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div style="text-align: center;  font-size:17px; font-weight: bold;">
								비밀번호 변경
							</div>
							<div style="text-align: center; margin-top:10px; margin-bottom:20px; font-size:14px">
								사용할 비밀번호를 입력하세요. <br>
							</div>
							<input type="password" id="pw" name="pw" class="form-control"
								placeholder="새 비밀번호 입력" style="margin-bottom: 10px;">
								<div class="userPassword regex"></div>
							<input type="password" id="pwCheck" name="pwCheck" class="form-control"
								placeholder="새 비밀번호 확인" style="margin-bottom: 20px;">
								<div class="pwdCheck regex"></div>
							<a id="check" class="btn btn-primary input-block-level form-control">비밀번호 변경</a>
						</div>
					</div>
				</div>
						<input type="hidden" name ="email" value="${email}">
				<!-- /mail panel -->
			</form>
			<!-- /mail panel form -->

			<!-- tologin panel -->
			<div class="panel panel-default">
				<div class="panel-body" style="padding: 20px;text-align: center;">
					<p style="margin: 0;">계정이 있으신가요? <a href="${pageContext.request.contextPath}/">로그인</a></p>
				</div>
			</div>
			<!-- /tologin panel -->

			<!-- appdown panel -->
			<div class="app-download">
				<p style="margin: 20px;">앱을 다운로드 하세요.</p>
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_apple.png" alt="" height="40px;">
				<img src="${pageContext.request.contextPath}/resources/image/member/login/main_android.png" alt="" height="40px;">
			</div>
			<!-- /appdown panel -->
		</div>
		<!-- contents-mail -->
	</div>

	<!-- footer -->
	<div class="row" style="margin:80px 0 20px;">
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