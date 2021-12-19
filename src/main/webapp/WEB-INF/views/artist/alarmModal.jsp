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
					<c:if test="${alarmList.alarm_kind == 0 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						<a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a>
						작가님의 정보가 등록되었습니다 😚  Artistar 발전에 힘 써주셔서 감사합니다 🤗
						</span>
						<img src="${alarmList.artist_img}" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 1 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 등록 요청 승인이 거부되었습니다. 다시 시도해주세요 😥 		
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 3 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						<a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a>
						작가님의 정보가 수정되었습니다 😚  작가 정보에 기여해주셔서 감사합니다 🤗			
						</span>
						<img src="${alarmList.artist_img}" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 4 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 수정 요청 승인이 거부되었습니다. 다시 시도해주세요 😥	
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>					
					<c:if test="${alarmList.alarm_kind == 5 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 정보가 삭제되었습니다. 더 좋은 정보와 함께하는 Artistar가 되겠습니다 😁		
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>					
					<c:if test="${alarmList.alarm_kind == 6 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 삭체 요청 승인이 거부되었습니다. 다시 시도해주세요 😥		
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>		
					<c:if test="${alarmList.alarm_kind == 7 }">
					<div>
						<img src="${alarmList.artist_img}" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 <a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a> 작가님의 작품 <a href="${pageContext.request.contextPath}/artistdetailArt?artistNum=${alarmList.artist_num}">${alarmList.artinfo_num }</a>  정보가 등록되었습니다 😚  Artistar 발전에 힘 써주셔서 감사합니다 🤗
						</span>
						<img src="${alarmList.artinfo_img }" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 8 }">
					<div>
						<img src="${alarmList.artist_img}" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 <a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a> 작가님의 작품  정보 등록 요청이 거부되었습니다. 다시 시도해주세요. 😥	
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 9 }">
					<div>
						<img src="${alarmList.artist_img}" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 <a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a> 작가님의 작품 <a href="${pageContext.request.contextPath}/artistdetailArt?artistNum=${alarmList.artist_num}">${alarmList.artinfo_name }</a> 정보가 수정되었습니다 😚  Artistar 발전에 힘 써주셔서 감사합니다 🤗
						</span>
						<img src="${alarmList.artinfo_img }" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'"/>
					</div>
					</c:if>
					<c:if test="${alarmList.alarm_kind == 10 }">
					<div>
						<img src="${alarmList.artist_img}" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/artist_default.png'"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 <a href="${pageContext.request.contextPath}/artistdetailArtist?artistNum=${alarmList.artist_num}">${alarmList.artist_name }</a> 작가님의 작품  정보 수정 요청이 거부되었습니다. 다시 시도해주세요. 😥	
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>			
					<c:if test="${alarmList.alarm_kind == 11 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 작품 정보가 삭제되었습니다. 더 좋은 정보와 함께하는 Artistar가 되겠습니다 😁	
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>				
					<c:if test="${alarmList.alarm_kind == 12 }">
					<div>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/artist_check1.png" style=" border-radius: 70%; width: 30px; height: 30px; border-radius: 70%; overflow: hidden; margin-right:10px;"/>
						<span style="max-width:380px; display:inline-block">
						요청하신 작가님의 작품 정보 삭체 요청 승인이 거부되었습니다. 다시 시도해주세요 😥		
						</span>
						<img src="${pageContext.request.contextPath}/resources/image/alarm/rejection.png" style="width: 30px; height: 30px; overflow: hidden; border-radius : 5px;"/>
					</div>
					</c:if>				
						<hr>
				</c:forEach>
				
				
				
				
			</c:if>
      </div>
</body>
</html>