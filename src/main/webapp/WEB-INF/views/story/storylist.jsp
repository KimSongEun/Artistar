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
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico"
	type="image/x-icon" sizes="16x16">

<title>Story inquire</title>
<script>
	
</script>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px">
		<%-- 	${volist } --%>
	</section>
	<script>
	$(function(){
        var responseMessage = "<c:out value="${result}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
	</script>
		<div style = "float:center;">
			<c:forEach var="vo" items="${volist }">
			<div style="border: 1px solid green; float: left; width: 23%; margin:1rem 1rem 1rem 1rem; text-align:center;">
				<div>${vo.story_num }</div>
				<div>${vo.id }</div>
				<%-- <div >${vo.story_img }</div> --%>
				<c:if test="${empty vo.story_img}"> 
 						<h1>사진 없음.</h1>
 				</c:if>
				<c:if test="${!empty vo.story_img}">
					<%-- <a href="${pageContext.request.contextPath}/resources/uploadFiles/${vo.story_img}"download>
					${vo.story_img}</a> --%>
					<center>
					<img src="${vo.story_img}" alt="" style="max-width:20rem; height:30rem; display:block; float:center;">
					</center>
				</c:if>
				<div>${vo.story_date }</div>
				 <form action="storydelete" method="get">
				<input type="hidden" value="${vo.story_num }" name="storynum">
				<input type="hidden" value="1" name="deletere">
				<input type="submit" value="삭제" id="delete_btn">
				</form> 
				<%-- <button value="${vo.story_num }" class="delete_btn">삭제</button> --%>
				</div>
			</c:forEach>
		</div>
		<script>
		/* $(document).ready(function(){
			let result = '<c:out value="${result }"/>';
			checkAlert(result);
			console.log(result);
			function checkAlert(result){
			if(result=""){
				return;
			}
				
			if(result === "delete success"){
		            alert("삭제가 완료되었습니다.");
		        }
				
			}
		}) */
		 /* $("#delete_btn").on("click", function(e){
		        form.attr("action", "storydelete");
		        form.attr("method", "post");
		        form.submit();
		    }); */
		</script>
</body>
</html>