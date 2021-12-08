<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/story.css">
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
<title>DM</title>
<style>
.mainDm {
	position: relative;
	background-color: #f3efef;
	width: 100%;
	height: 76rem;
}
.DmColor{
position: relative;
background-color: #f3efef;
width: 100%;
height: 100px;
}
.Dm {
	background-color: white;;
	margin: auto; position : absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border: 1px solid balck;
	width: 50%;
	height: auto;
	position: absolute;
	display : flex;
	flex-direction: row;
	/* align-content: stretch; */
}

#idDm {
	border-top:1px solid black;
	border-left:1px solid black;
	border-bottom:1px solid black;
	/* justify-content : center; */
	/* border: 1px solid black; */
	width: 35%;
}

#messageDM {
	border: 1px solid black;
	width: 65%;
}

#myId {
	border-bottom:1px solid black;
	width : 100%;
}

#chat {
	border-bottom:1px solid black;
	width : 100%;
}

p {
	text-align: center;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 78px"></section>
	<div class="mainDm">
	<div class="DmColor">
	</div>
		<div class="Dm">
			<div id="idDm" >
				<div id="myId">
					<p>testID</p>
				</div>
				
			</div>
			<div id="messageDM" >
				<div id="chat">
					<p>testChat</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>