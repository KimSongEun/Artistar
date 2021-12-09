<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>

<!-- css -->

<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/memberdelete.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Instagram</title>
<style>
.btn-primary {
	background-color: #3c93ef;
	height: 35px;
	border: none;
	line-height: 1.3;
	width: 150px;
	justify-content: center;
	font-size: 14px;
	margin:40px auto 0 auto;
}
</style>
</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<!-- 전체화면 -->
	<div class="container" style="background-color: #fafafa;">
		<!-- contentBox -->
		<div class="content">
			<div class="contentBox">
				<ul class="tabMenu" style="padding-left: 0px;">
					
					<li><a class="eachMenu hoverMenu" href="#">회원 탈퇴</a>
					</li>
				</ul>
				<div class="contentMain">
					<div class="profile">
						<div class="photo">
							<img class="photoImg" style="height: 100px; width: 100px;" >
						</div>
						<div class="name">
							<h1 class="userName">사용자 이름</h1>
						</div>
					</div>
					<form class="pwInputForm" method="post">
						<div class="pwArea">
							<aside class="text">비밀번호</aside>
							<div class="pwInput">
								<input id="pw" class="pw" type="password" name="pw" placeholder="비밀번호" >
							</div>
						</div>
						<input type="submit" class="btn btn-primary " value="회원탈퇴" >	
					</form>		
					<div style="text-align: center; margin-top: 35px; font-size: 15px">
						<a href="#">비밀번호를 잊으셨나요?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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