<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="cl" uri="http://cloudinary.com/jsp/taglib"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../index/header.jsp"%>

	${postlist }
	<hr>
	<c:forEach items="${postlist }" var="postlist">
		<div class="post-contrainer">
		<a href="${pageContext.request.contextPath}/post/postdetail?postNum=${postlist.postNum }">postNum: ${postlist.postNum }</a><br>
		id: ${postlist.id }<br>
		postContent: ${postlist.postContent }<br>
		<c:forEach items="${postlist.postImgList }" var="postImgList">
		<img alt="postImg" src="${postImgList.postImg }"><br>
		</c:forEach>
		<input type="submit" value="삭제" class="btn-delete">
		<hr>
		</div>
	</c:forEach>
	 
</body>
</html>