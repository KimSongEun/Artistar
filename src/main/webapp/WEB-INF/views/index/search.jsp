<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 검색</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/storytest.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
#userInfo {
	display: flex;
	justify-content: center;
}

#userImage {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}
ul{
    list-style: none;
    margin-bottom: 20px;
    }
</style>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 200px"></section>
	<center>
	<h3>${msg} </h3>
	</center>
	<c:forEach var="vo" items="${memberlist}">
		<div id="userInfo" style=" margin: 0px 0px 100px 0px;">
			<div id="userImage" style="margin: 0px 100px 0px 0px;">
				<input type="image" id="userImage" src="${vo.member_img}" alt="프로필사진" style="">
			</div>
			<section id="userDetail">
				<div id="firstArea" style="display: flex; margin: 0px 0px 50px 0px;">
					<h2 style=" margin: 0px 50px 0px 0px;">${vo.nickname }</h2>
					<span style="display: flex">
						<button onclick="location.href='http://localhost:8090/artistar/mypost?id=${vo.id}'"style="background-color: #0095f6; color:white; border: none; border-radius: 2rem;" >상세보기</button>
					</span>
				</div>

				<div id="thirdArea">
					<h1 style="display: inline; font-weight: 600;">${vo.uname }</h1>
					</br> 
					<span>${vo.intro }</span>

				</div>
			</section>
		</div>
	</c:forEach>
</body>
</html>