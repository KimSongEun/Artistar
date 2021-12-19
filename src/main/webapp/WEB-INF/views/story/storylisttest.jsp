<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
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

<!-- icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico"
	type="image/x-icon" sizes="16x16">

<title>Insert title here</title>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px">
		<div class="hidden_menu">
			<div class="scroll_inner">
			<c:forEach var="followid" items="${followid}">
				<c:forEach var="vo" items="${volist }">
				<c:if test="${followid==vo.id}">
					<div class="user" style="display: inline;">
						<%-- <c:if test="${empty vo.story_img}"> --%>
							<!-- 사용자 사진으로 변경해야함 -->
							<form action="storydetail" method="get">
								<center>
									<input class="thumb_img" type="image" src="${vo.member.member_img }" alt="프로필사진" style="float: center;">
								<%-- <input class="id" name="id" value="${vo.id }" style="border:none;"> --%>
									<p>${vo.member.nickname }</p>
								</center>
								<input class="hidden" name="nickname" value="${vo.member.nickname }" readonly style="border: none;">
								<input type="hidden" name="story_num" value="${vo.story_num }">
								<input type="hidden" name="id" value="${vo.id }">
							</form>
						<%-- </c:if> --%>
					</div>
					</c:if>
				</c:forEach>
				</c:forEach>
			</div>
		</div>
	</section>
	<script>
		$(".scroll_inner").on('mousewheel', function(e) {

			var wheelDelta = e.originalEvent.wheelDelta;

			if (wheelDelta > 0) {

				console.log("up");

				$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

			} else {

				console.log("down");

				$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

			}

		});
	</script>
</body>
</html>