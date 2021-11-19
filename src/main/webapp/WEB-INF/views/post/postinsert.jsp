<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<div id="dropbox">
		<span id="droplabel">
			이곳에 파일을 드랍해주세요
		</span>
	</div>
	<img id="preview" alt="dropfile preview" src="">
	
	<form method="post" enctype="multipart/form-data">
		파일: <input type="file" name="file" /><br>
		<input type="submit" />
	</form>
	
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