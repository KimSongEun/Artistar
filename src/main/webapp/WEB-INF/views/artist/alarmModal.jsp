<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/artist/artdetailModal.css?"> -->
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
<!-- <script type="text/javascript" src="resources/js/artist/artdetailModal.js?aa"></script> -->

<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Alarm</title>
</head>
<body>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
        <img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" style="display:inline-block" width="25px"/>
        Artistar Alarm
        <img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" style="display:inline-block" width="25px"/>
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
			<c:if test="${alarmList == '[]' }">
				<h2 align="center" style="color: lightgray;">알림이 없습니다</h2>
			</c:if>
			<c:if test="${alarmList != '[]' }">
				
			
			
			
				<c:forEach var="alarmList" items="${alarmList}">
					<c:if test="${alarmList.alarm_kind == 9 }">
						안녕안녕
					</c:if>
					<c:if test="${alarmList.alarm_kind == 0 }">
						하이하이
					</c:if>
<%-- 					<img src="${alarmList.artist_img}" style="border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden;"/>
					
						<a style="margin-left: 10px;" href="#아티스트 정보 보러가기">${alarmList.artist_name }</a>  --%>
						<hr>
				</c:forEach>
				
				
				
				
			</c:if>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
</body>
</html>