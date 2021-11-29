<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>


<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Home</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<br><br><br><br><br><br><br>
	${ member}
	<!-- 로그인한 상태 -->
	<c:if test="${ member != null }">
		<div class="login_success_area">
			<a href="/artistar/member/logout">로그아웃</a>
			<a href="#">회원정보수정</a>
			<a href="#">회원정보탈퇴</a>
			<span>이름 : ${member.uname}</span> 
			<span>아이디 :${member.id}</span> 
			<span>비밀번호 : ${member.pw}</span>
		</div>
	</c:if>

</body>
</html>