<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
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

<!-- icon -->

<!-- icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico"
	type="image/x-icon" sizes="16x16">
<title>스토리 디테일</title>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px">
	<div style = "float:center;">
		<c:forEach var="vo" items="${detail }">
			<c:if test="${!empty vo.story_num}">
				<div style="border: 1px solid green; width: 23%; margin:1rem 1rem 1rem 1rem; text-align:center;">
					<input class="id" name="id" value="${vo.id }" style="border:none;">
					<img src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.story_img}" style="max-width:20rem; height:30rem; display:block; float:center;">
				</div>
			</c:if>
		</c:forEach>
	</div>
	</section>
</body>
</html>