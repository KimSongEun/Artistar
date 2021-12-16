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
<link rel="stylesheet" type="text/css" href="resources/css/member/pwauth.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

</head>

<body>
	<!-- main container -->
	<div class="container" style="padding-bottom: 90px; ">
		<!-- contents-mail -->
		<div id="content-mail" class="col-lg-4" style="top:90px;">
			<!-- mail panel form -->
			<form name="form" action="pw_set.me" method="post" id="pwAuthForm">
				<input type="hidden" name ="num" value="${num }">
				<input type="hidden" name ="vo" value="${vo}">
				<!-- mail panel -->
				<div class="panel panel-default text-center" style="margin-bottom: 15px;">
					<div class="panel-heading">
						<img src="${pageContext.request.contextPath}/resources/image/member/pwfind/mail.PNG" alt="" style="width: 130px; height: 110px;">
					</div>
					<div class="panel-body">
						<div class="form-group">
							<div style="text-align: center; margin-bottom:20px; font-size:18px; font-weight: bold;">
								인증 코드 입력
							</div>
							<div style="text-align: center; margin-top:15px; margin-bottom:20px; font-size:14px">
								주소로 전송된 인증 코드를 입력하세요. <br>
							</div>
							<input type="text" id="email_injeung" name="email_injeung" class="form-control" placeholder="인증번호를 입력하세요">
							<a  id="check" class="btn btn-primary input-block-level form-control">다음</a>
							<div style="text-align: center; margin-top:15px; font-size:14px">
								<a href="javascript:history.back();">돌아가기</a>
							</div>
						</div>
					</div>
				</div>
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
       
       $("#check").click(function(){   
       	var email_injeung = $("#email_injeung").val();       	
       	var emailCoderegex = /^[0-9]{6}$/;
       	
       	var emailCoderegex = emailCoderegex.exec(email_injeung);
           if (emailCoderegex == null) {
               alert("인증번호를 다시 확인해주세요. 6자리 숫자만 입력가능합니다.");
               form.email_injeung.focus();
               return false;
           }
           
       	$("#pwAuthForm").attr("action", "/artistar/pwauth");         
       	$("#pwAuthForm").submit();
       })
   })
</script>

</body>

</html>