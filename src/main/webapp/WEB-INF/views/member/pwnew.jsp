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

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
	<style>
	.container {
			display: flex;
			justify-content: center;
		}


		.panel-default {
			border-radius: 0;
			margin-bottom: 10px;
		}

		.panel-default>.panel-heading {
			border-color: #fff;
			background-color: #fff;
			margin: 25px auto 5px;
		}

		.panel-title {
			background-image: url(images/main_02.png);
			background-position: 0 0;
			background-size: 395px 371px;
			background-repeat: no-repeat;
			height: 51px;
			width: 175px;
			margin: 0 auto;
		}

		.panel-body {
			padding: 0 40px 10px 40px;
		}

		.form-group input {
			margin-bottom: 10px;
			border: 1px solid #efefef;
			background-color: #fafafa;
			border-radius: 3px;
		}

		.btn-primary {
			background-color: #3c93ef;
			border: none;
			height: 35px;
			line-height: 1.9;
			margin-top: 10px;
			font-weight: bold;
		}

		.app-download {
			text-align: center;
		}





		/*remove border of panel when small-size screen*/
		@media screen and (max-width: 735px) {
			#content-right .panel {
				border: none;
				box-shadow: none;
			}
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
	<div class="container" style="margin-bottom: 50px; ">
		<!-- contents-mail -->
		<div id="content-mail" class="col-lg-4" style="top:90px;">
			<!-- mail panel form -->
			<input type="hidden" name="num" value="${num }">
				<input type="hidden" name="vo" value="${vo}">
			<form name="form" action="pwnew" id="pwNewForm" method="post" class="content">
				
				<!-- mail panel -->
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<img src=${pageContext.request.contextPath}/resources/image/member/pwfind/password.PNG" alt="" style="width: 120px; height: 100px;">
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
								placeholder="새 비밀번호 입력" style="margin-bottom: 15px;">
								<div class="userPassword regex"></div>
							<input type="password" id="pwCheck" name="pwCheck" class="form-control"
								placeholder="새 비밀번호 확인" style="margin-bottom: 20px;">
								<div class="pwdCheck regex"></div>
							<a id="check" class="btn btn-primary input-block-level form-control">다음</a>
						</div>
					</div>
				</div>
				<!-- /mail panel -->
			</form>
			<!-- /mail panel form -->

			<!-- tologin panel -->
			<div class="panel panel-default">
				<div class="panel-body" style="padding: 20px;text-align: center;">
					<p style="margin: 0;">계정이 있으신가요? <a href="login">로그인</a></p>
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
	<div class="row" style="margin-top:180px 0 20px;">
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
       
       //비밀번호 유효성검사
       $("#pw").on("input", function () {
           var regex = /^[a-zA-Z0-9]{5,20}$/;
           var result = regex.exec($("#pw").val())

           if (result != null) {
               $(".userPassword.regex").html("");
           } else {
               $(".userPassword.regex").html("영어대소문자 및 숫자를 사용하여 5-20자리이내로 입력해주세요");
               $(".userPassword.regex").css("color", "red");
           }
       });

       //비밀번호 확인    
       $("#pwCheck").on("keyup", function () {
           if ($("#pw").val() == $("#pwCheck").val()) {
               $(".pwdCheck.regex").html("비밀번호가 일치합니다");
               $(".pwdCheck.regex").css("color", "blue");
           } else {
               $(".pwdCheck.regex").html("비밀번호가 일치하지않습니다");
               $(".pwdCheck.regex").css("color", "red");
           }
       });
   
	$("#check").click(function() {
			var pw = $("#pw").val();
			var pwregex = /^[a-zA-Z0-9]{5,20}$/;

			var pwregex = pwregex.exec(pw);
			if (pwregex == null) {
				alert("비밀번호를 다시 확인해주세요.\n비밀번호는 영문자와 숫자, 5~20자 이내로 입력가능합니다.");
				form.pw.focus();
				return false;
			}
			
			 if ($("#pw").val() != $("#pwCheck").val()) {
				 alert("입력된 새 비밀번호가 일치하지 않습니다.\n다시 확인해주세요.");
				 form.pw.focus();
					return false;
			 }
			
			 $("#pwNewForm").attr("action", "/artistar/pwnew");
			    
				$("#pwNewForm").submit();
		})
   })
</script>

</body>

</html>