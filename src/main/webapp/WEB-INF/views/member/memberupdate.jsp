<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/member/mypage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="resources/js/member/memberupdate.js" ></script>
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
	margin:40px 255px 0 ;
}
</style>
</head>
<body>
<%@ include file="../index/header.jsp" %>
	<!-- 전체화면 -->
	<div class="container" style="background-color: #fafafa;">
		<!-- contentBox -->
		<div class="content">	
			<div class="contentBoxUpdate">
				<ul class="tabMenu" style="padding-left: 0px; margin-bottom: 0px;">
					<li class="a_click">
						<a class="eachMenu select" href="memberupdate">프로필 편집</a>
					</li>
					<li>					
						<a class="eachMenu hoverMenu" href="pwchange">비밀번호 변경</a>
					</li>
					<li>
						<a class="eachMenu hoverMenu" href="memberdelete">회원 탈퇴</a>
					</li>
				</ul>
				<div class="contentMain">
					<div class="profile">
						<div class="photo">
							<img class="photoImg" style="height: 100px; width: 100px;">
						</div>
						<div class="name">
							<h1 class="userName">${member.nickname}</h1>
						</div>
					</div>
				
					<form name="form" method="post" action="memberupdate" id="updateForm" class="updateForm">
							<input class="data" id="id" name="id" type="hidden" value="${member.id}">
						<div class="pwArea">
							<aside class="text">이름</aside>
							<div class="input">
								<input class="data" id="uname" name="uname" type="text" value="${member.uname}">
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">사용자 이름</aside>
							<div class="input">
								<input type="hidden" class="data" id="nicknameHidden" name="nicknameHidden" value="${member.nickname}">
								<input type="text" class="data" id="nickname" name="nickname" value="${member.nickname}">								
							</div>
						</div>
							<div class="pwArea">
							<aside class="text"></aside>
							<div class="input">
								<div class="userNickname regex" style="width: 365px; font-size: 15px"></div>
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">성별</aside>
							<div class="input">															
									<c:if test="${fn:contains(member.gender, 'M')}">
											<input type="radio" id="gender" name="gender" value="M" checked="checked"  style=" margin: 15px 10px 5px;"><span style=" margin: 9px 20px 5px 0px;">남 </span>
											<input type="radio" id="gender" name="gender" value="F"  style=" margin: 15px 10px 5px;"><span style=" margin: 9px 20px 5px 0px;">여</span>
									</c:if>
									<c:if test="${fn:contains(member.gender, 'F')}">
											<input type="radio" id="gender" name="gender" value="M"  style=" margin: 15px 10px 5px;"><span style=" margin: 9px 20px 5px 0px;">남 </span>
											<input type="radio" id="gender" name="gender" value="F" checked="checked"  style=" margin: 15px 10px 5px;"><span style=" margin: 9px 20px 5px 0px;">여</span>
									</c:if>
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">소개</aside>
							<div class="input">
								<textarea class="data" id="intro" name="intro" style="height: 75px">${member.intro}</textarea>
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">이메일</aside>
							<div class="input">
								<input class="data"  id="email" name="email" type="text" value="${member.email}" readonly>
							</div>
						</div>					
						<div class="pwArea">
							<aside class="text">전화번호</aside>
							<div class="input">
								<input class="data" id="phone" name="phone" type="text" value="${member.phone}">
							</div>
						</div>
						<div class="pwArea">
							<aside class="text">주소</aside>
							<div class="input">
								<input class="data" id="address" name="address" type="text" value="${member.address}">
							</div>
						</div>
						<input type="button" class="btn btn-primary" id="updateBtn" value="제출" >
					</form>
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