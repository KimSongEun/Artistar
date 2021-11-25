<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/artist/artistlist.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/artist/artistmain.js" ></script>
<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>artist 목록</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
	 	<div class="container">
			<div class="item">
				<div class="artistlist-plus">
					<button class="btn">
						<img src="resources/image/artistplus.png" width="30px"/>
					</button>
				</div>
				<c:if test="${artistvolist!=null }">
				<c:forEach items="${artistvolist }" var="artistvolist">
				<div class = "artistlist_container">
				<div class="artistlist_item artistlist_artist">
				  <div class="user_profile">
                    <div class="profile_thumb">
                        <img src="resources${artistvolist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
                    </div>
                    <div class="detail">
                        <div class="id m_text">${artistvolist.artistName }</div>
                        <div class="ko_name">팔로워 ${artistvolist.follower } 명</div>
                    </div>
				  </div>
                   <div class="artistlist_item detailgo">
                   	<button type="button" class="btn btn-warning">Detail</button>
                   </div>
				</div>
				<br>
		 		<div class="artistlist_art"> 
				<c:if test="${artistvolist.artInfo!=null }">
				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="2">
					<div class="artist_mainart">
						<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/myartgallery/default_user.png'"/>
					</div> 
 				</c:forEach>
				</c:if>
				<c:if test="${empty artistvolist.artInfo}">
				<c:forEach begin="0" end="2">
					<div class="artist_mainart">
						<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
					</div> 	
					</c:forEach>			
				</c:if>
<%-- 				${fn:length(artistvolist.artInfo)}
				<c:if test="${fn:length(artistvolist.artInfo) eq 2 } ">
				<c:forEach begin="0" end="1">
					<div class="artist_mainart">
						<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/myartgallery/default_user.png'"/>
					</div> 
				</c:forEach>			
					<div class="artist_mainart">
						<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
					</div> 	
				</c:if> --%>
				</div>
				</div>
				<br><br><br>
				</c:forEach>
				</c:if>
				<div class="plus"></div>
<%-- 				<c:if test="${artistvolist!=null }">
				<c:forEach items="${artistvolist }" var="artistvolist">
				<div class = "artistlist_container">
				<div class="artistlist_item artistlist_artist">
				  <div class="user_profile">
                    <div class="profile_thumb">
                        <img src="resources${artistvolist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
                    </div>
                    <div class="detail">
                        <div class="id m_text">${artistvolist.artistName }</div>
                        <div class="ko_name">팔로워 ${artistvolist.follower } 명</div>
                    </div>
				  </div>
                   <div class="artistlist_item detailgo">
                   	<button type="button" class="btn btn-warning">Detail</button>
                   </div>
				</div>
				<br>
		 		<div class="artistlist_art"> 
				<c:if test="${artistvolist.artInfo!=null }">
				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="2">
					<div class="artist_mainart">
						<img class="mainart" src="resources/${artInfo.artinfoImg }" height="200px" onerror="this.src='resources/image/myartgallery/default_user.png'"/>
					</div> 
 				</c:forEach>
				</c:if> 
				</div>
				</div>
				<br><br><br>
				</c:forEach>
				</c:if>  --%>
			</div>
		
			
			
			<div class="item">
				<div class="mygallery">
					<div class="artist-search">
					  <input class="form-control me-2" type="search" placeholder="Artist 검색" aria-label="Search" style="display:inline">
    				  <button class="btn btn-outline-secondary" type="submit" style="">
    				  		<img src="${pageContext.request.contextPath}/resources/image/searchblack.png" width="20px"/>
    				  </button>
					</div>
					<div class="card text-center">
					  <div class="card-header">
					    <span class="mygallery_title">My Art Gallery</span>
					  </div>
					  <div class="card-body">
					  	<div>
					  		<img src="resources/image/mygalleryartist.png" width="80px"/>
					  		<span class="mygallery_count">${myArtGalleryArtistCount }명</span>
					  	</div>
					  	<div>
					  		<img src="resources/image/mygalleryart.png" width="80px"/>
					  		<span class="mygallery_count">${myArtGalleryArtCount }명</span>
					  	</div>
					  	<div class="card-body">
					    <a href="myartgallery?userId=${userId }" class="btn btn-dark">Detail</a>
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>