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

<style> /* modal */
#my_modal {
	display: none;
	width: 300px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	position: absolute;
	top: 10px;
	right: 10px;
}

.storyDetail {
	display: flex;
	flex-direction: row;
	position: absolute;
	justify-content: center;
	width: 100%;
	height: 100%;
}

#before {
	border: 3px solid black;
	width: 25%;
	height: 50%;
	margin: 1rem 1rem 1rem 1rem;
	text-align: center;
}

#storyMain {
	border: 3px solid black;
	width: 25%;
	height: 70%;
	margin: 1rem 1rem 1rem 1rem;
	text-align: center;
}

#after {
	border: 3px solid black;
	width: 25%;
	height: 50%;
	margin: 1rem 1rem 1rem 1rem;
	text-align: center;
}
a:link {
  color: black;
  text-decoration: none;
}
</style>


</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px"></section>
	<div class="storyDetail">
		<div id="storyMain" >
			<c:forEach var="vo" items="${detail }">
				<input type="image" id="userImage" src="${vo.member.member_img}"
					style="width: 56px; height: 56px; border-radius: 50%; overflow: hidden; margin-top: 5%;">
				<p>${vo.member.nickname }</p>

				<c:if test="${!empty vo.story_num}">

					<input class="id" name="id" type="hidden" value="${vo.id }"
						style="border: none; text-align: center;">

					<div id="img">
						<img src="${vo.story_img}" style="width: 90%; height: 40rem;">
					</div>
					
					<div id="my_modal" >
						<c:forEach var="vo1" items="${detail1 }" >
							<p>${vo1.id }</p>
						</c:forEach>
						<a class="modal_close_btn">닫기</a>
					</div>
					<c:if test="${sessionid == vo.id }">
					<button id="popup_open_btn" style="margin-top:5%;border: 1px solid black; background-color: rgba(0,0,0,0); color: black; padding: 5px;" >
					조회 수 : ${count }</button>
					</c:if>
					
				</c:if>
				<div class="paging">
					<c:if test="${startPage>1}">
						<a href="./storydetail?pagenum=${startPage-1}&id=${vo.id }"
							class="num">이전</a>

					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="./storydetail?pagenum=${i}&id=${vo.id } " class="num">${i}</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="./storydetail?pagenum=${endPage+1}&id=${vo.id }"
							class="num">다음</a>
					</c:if>
					
					<c:if test="${endPage == pageCount}">
						<c:if test="${sessionid != vo.id }">
							<a href="./postlist" class="num">메인</a>
						</c:if>
						<c:if test="${sessionid == vo.id }">
							<a href="http://localhost:8090/artistar/post/postlist" class="num">메인</a>
						</c:if>
					</c:if>
					
					
				</div>
			</c:forEach>
		</div>
	</div>





	<script>
		function modal(id) {
			var zIndex = 9999;
			var modal = document.getElementById(id);
			// 모달 div 뒤에 희끄무레한 레이어
			var bg = document.createElement('div');
			bg.setStyle({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			});
			document.body.append(bg);

			// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
			modal.querySelector('.modal_close_btn').addEventListener('click',
					function() {
						bg.remove();
						modal.style.display = 'none';
					});

			modal
					.setStyle({
						position : 'fixed',
						display : 'block',
						boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

						// 시꺼먼 레이어 보다 한칸 위에 보이기
						zIndex : zIndex + 1,

						// div center 정렬
						top : '50%',
						left : '50%',
						transform : 'translate(-50%, -50%)',
						msTransform : 'translate(-50%, -50%)',
						webkitTransform : 'translate(-50%, -50%)'
					});
		}

		// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
		Element.prototype.setStyle = function(styles) {
			for ( var k in styles)
				this.style[k] = styles[k];
			return this;
		};

		document.getElementById('popup_open_btn').addEventListener('click',
				function() {
					// 모달창 띄우기
					modal('my_modal');
				});
	</script>
</body>
</html>