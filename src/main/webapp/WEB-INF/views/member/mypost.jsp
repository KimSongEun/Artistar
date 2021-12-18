<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>

</head>
<body>
	<div>게시물 ${myPostCount }</div></br>
	<div>팔로워 ${myFollowerCount }</div></br>
	<div>팔로우 ${myFollowCount }</div></br>
	<c:forEach items="${postlist }" var="postlist">
		<div>좋아요 개수${postlist.postLikeCount }개</div></br>


	<c:forEach items="${postlist.postImgList }" var="postImgList" varStatus="i">
							<c:choose>
							<c:when test="${i.count == 1 }">
							<div class="carousel-item active">
								<img src="${postImgList.postImg }" style="height:350px; width:300px;">
							</div>
							</c:when>
							<c:otherwise>
							<div class="carousel-item">
								<img src="${postImgList.postImg }" style="height:350px; width:300px;">
							</div>
							</c:otherwise>
							</c:choose>
						</c:forEach>

	</c:forEach>

</body>
</html>