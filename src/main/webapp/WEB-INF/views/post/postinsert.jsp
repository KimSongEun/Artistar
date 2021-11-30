<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistar</title>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	#dropbox {
		width: 350px;
		height: 70px;
		padding: 10px;
		border: 1px solid #aaaaaa;
	}
</style>

</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<br><br><br>
	<!-- 클릭하여 파일 넣기 -->
	<form action="${pageContext.request.contextPath}/post/postinsert" name="postImgForm" method="post" enctype="multipart/form-data">
		파일: <input type="file" name="postImg" multiple="multiple" /><br>
		내용: <input type="text" name="postContent">
		<input type="submit" />
	</form>

	<!-- dropbox 영역 -->
	<div id="dropbox">
		<span id="droplabel">
			이곳에 파일을 드랍해주세요
		</span>
	</div>
	
	<!-- dropbox 미리보기 -->
	<img id="preview" alt="dropfile preview" src="">
	
	<!-- dropbox 동작 script -->
	<script>
		function dragEnter(event) {
			event.stopPropagation();
			event.preventDefault();
		}
		function dragExit(event) {
			event.stopPropagation();
			event.preventDefault();
		}
		function dragOver(event) {
			event.stopPropagation();
			event.preventDefault();
		}
		function drop(event) {
			event.stopPropagation();
			event.preventDefault();
			
	        var files = event.dataTransfer.files;
	        var count = files.length;
         
			// 오직 한개 이상의 파일이 드랍된 경우에만 처리기를 호출한다.
			if (count > 0)
				handleFiles(files);
        }
      
		function handleFiles(files) {
			var file = files[0];
	        document.getElementById("droplabel").innerHTML = "Processing " + file.name;
	        var reader = new FileReader();

			// 파일 리더의 이벤트 핸들러 정의
			reader.onloadend = handleReaderLoadEnd;
         
			// 파일을 읽는 작업 시작
			reader.readAsDataURL(file);
			}
		
		function handleReaderLoadEnd(event) {
	        var img = document.getElementById("preview");
	        img.src = event.target.result;
	        }

		var dropbox = document.getElementById("dropbox")
       
		// 이벤트 핸들러 할당
		dropbox.addEventListener("dragenter", dragEnter, false);
		dropbox.addEventListener("dragexit", dragExit, false);
		dropbox.addEventListener("dragover", dragOver, false);
		dropbox.addEventListener("drop", drop, false);
    </script>

</body>
</html>