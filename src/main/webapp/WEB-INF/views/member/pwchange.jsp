<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>
<<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/mypage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- JS -->
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/member/pwchange.js" ></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">
<style>
ol, ul {
	list-style: none;
	padding-left: 0px;
}
a, a:visited, a:hover {
	text-decoration: none;
}
.select {
	border-left: 2.5px solid black;
	font-weight: 600;
}
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
				<ul class="tabMenu" style="padding-left: 0px; margin-bottom: 0px;">
					<li class="a_click">
						<a class="eachMenu hoverMenu" href="${pageContext.request.contextPath}/memberupdate">프로필 편집</a>
					</li>
					<li>					
						<a class="eachMenu select" href="${pageContext.request.contextPath}/pwchange">비밀번호 변경</a>
					</li>
					<li>
						<a class="eachMenu hoverMenu" href="${pageContext.request.contextPath}/memberdelete">회원 탈퇴</a>
					</li>
				</ul>
				<div class="contentMain">
					<div class="profile">
						<div class="photo">
							<img class="photoImg" style="height: 100px; width: 100px;">
						</div>
						<div class="name">
							<h1 class="userName">사용자 이름</h1>
						</div>
					</div>
				
					<form name="form" method="post" action="pwchange" id="pwNewForm" class="pwInputForm">
							<input type="hidden" name ="id" id="id" value="${member.id}">
							<input type="hidden" name ="pwOld" id="pwOld" value="${member.pw}">
						
						<div class="pwArea">
							<aside class="text">현재 비밀번호</aside>
							<div class="pwInput">
								<input id="pwNow" name="pwNow" class="pw" type="password">
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">새 비밀번호</aside>
							<div class="pwInput">
								<input id="pw" name="pw" class="pw" type="password"><br>
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">새 비밀번호 확인</aside>
							<div class="pwInput">
								<input id="pwCheck" class="pw" type="password"><br>
							</div>
						</div>
						<input type="button" class="btn btn-primary "  id="check" value="비밀번호변경">
					</form>
					<div style="text-align: center; margin-top: 35px; font-size: 15px">
						<a href="${pageContext.request.contextPath}/pwfind">비밀번호를 잊으셨나요?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
		
<script>
	$(function() {
		var responseMessage = "<c:out value="${message}" />";
		if (responseMessage != "") {
			alert(responseMessage)
		}
		
	$(".eachMenu").click(function(){			
			$(".tabMenu > li").removeClass("a_click");
			$(this)
			.parent()
			.addClass("a_click");
		});
	})
	
</script>
</body>
</html>