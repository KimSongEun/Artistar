<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistSearch.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistSearch.js" ></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Artist Search</title>
</head>
<body>
	<%@ include file="../index/header.jsp" %>
	
	<section style="margin-top : 100px">
	<c:if test="${keyword == '' }">
		<script>
			alert("아이 아무것도 없잖아!");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${keyword != '' }">
	
		<div class="container" align="center">

			<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="background-color: #f4f4f4;">
				
				  <input type="radio" class="btn-check" name="btnradio" id="searchArtist" autocomplete="off">
				  <label class="btn btn-outline-secondary" for="searchArtist" style="width: 120px;">Artist</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="searchArt" autocomplete="off">
				  <label class="btn btn-outline-secondary" for="searchArt" style="width: 120px;">Art</label>
				  
				  <input type="radio" class="btn-check" name="btnradio" id="searchTags" autocomplete="off">
				  <label class="btn btn-outline-secondary" for="searchTags" style="width: 120px;"># 작품 태그</label>
				  
			</div>

			<br /> <br /> <br />
			<!-- search result -->
			<div style="width: 80%;">
				<input type="hidden" id="selectOption" value="${selectOption }">
				<h3>"${keyword}" 검색결과</h3>
				<br /> <br />
				
				<div id="artistResultView">
					<c:if test="${searchArtist == '[]' }">
						<div class="col" align="center">
							<h5 style="color: gray;">작가 검색 결과가 없습니다.</h5>
						</div>
					</c:if>
					<c:if test="${searchArtist != '[]' }">
						<c:forEach items="${searchArtist }" var="searchArtist">
						<div class = "artistlist_container">
						<div class="artistlist_item artistlist_artist">
						  <div class="user_profile">
		                    <div class="profile_thumb">
		                        <img src="resources${searchArtist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
		                    </div>
		                    <div class="detail">
		                        <div class="id m_text" style="height:20px;">${searchArtist.artistName }<img class="align-top"src="resources/image/artist/artistdetail/artist_check.png" width="10px"/></div>
		                        <div class="ko_name" style="text-align : left"><span>팔로워 ${searchArtist.follower } 명</span></div>
		                    </div>
						  </div>
		                   <div class="artistlist_item detailgo">
		                   	<a href="artistdetailArtist?artistNum=${searchArtist.artistNum }"><button type="button" class="btn btn-warning">Detail</button></a>
		                   </div>
						</div>
						<br>
				 		<div class="artistlist_art"> 
				 		
				 		
				 		<c:choose>
				 			<c:when test="${fn:length(searchArtist.artInfo) >= 3 }">
				 			
								<c:forEach items="${searchArtist.artInfo }" var="artInfo" begin="0" end="2">
									<div class="artist_mainart">
										<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
									</div> 
		 						</c:forEach>
				 			</c:when>
				 			<c:when test="${fn:length(searchArtist.artInfo) eq 2 }">
				 				<c:forEach items="${searchArtist.artInfo }" var="artInfo" begin="0" end="1">
									<div class="artist_mainart">
										<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
									</div> 
								</c:forEach>			
									<div class="artist_mainart">
										<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
									</div> 	
				 			</c:when>
				 			<c:when test="${fn:length(searchArtist.artInfo) eq 1 }">
				 				<c:forEach items="${searchArtist.artInfo }" var="artInfo" begin="0" end="0">
									<div class="artist_mainart">
										<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
									</div> 
								</c:forEach>
								<c:forEach begin="1" end="2">		
									<div class="artist_mainart">
										<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
									</div> 	
								</c:forEach>	
				 			</c:when>	
		 			 		<c:when test="${empty searchArtist.artInfo}">
								<c:forEach begin="0" end="2">
									<div class="artist_mainart">
										<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
									</div> 	
								</c:forEach>			
							</c:when>	 		
				 		</c:choose>
				 		
						</div>
						</div>
						<br><br><br>
						</c:forEach>
					</c:if>
				</div>
			</div>
			
			<div id="artResultView">
				<c:if test="${searchArt == '[]' }">
					<div class="row">
						<div class="col" align="center">
							<h5 style="color: gray;">작품 검색 결과가 없습니다.</h5>
						</div>
					</div>
				</c:if>
				<div class="row">
				<c:if test="${searchArt != '[]' }">
				  <c:forEach items="${searchArt }" var="searchArt">
			      <div class="col-4 insList">
			          <a onclick="contentView(${searchArt.artinfoNum})" id="replyView" type="button" data-bs-toggle="modal" data-bs-target="#artContent">
			         <img src="resources/${searchArt.artinfoImg }" width="350px" height="400px" style="margin-bottom : 20px;" />
			         </a>
			      </div>
			      </c:forEach>
				</c:if>
				</div>
			</div>
			
			<div id="tagsResultView">
					<div>
						<c:if test="${searchTags == '[]' }">
							<div class="col" align="center">
								<h5 style="color: gray;">작품 해시태그 검색 결과가 없습니다.</h5>
							</div>
						</c:if>
						<div class="row">
						<c:if test="${searchTags != '[]' }">
						  <c:forEach items="${searchTags }" var="searchTags">
					      <div class="col-4 insList">
					          <a onclick="contentView(${searchTags.artinfoNum})" id="replyView" type="button" data-bs-toggle="modal" data-bs-target="#artContent">
					         <img src="resources/${searchTags.artinfoImg }" width="350px" height="400px"  style="margin-bottom : 20px;" />
					         </a>
					      </div>
					      </c:forEach>
					      
							<div id="feedContent" class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog modal-dialog-centered modal-xl">
									<div class="modal-content feed_content"></div>
								</div>
							</div>
						</c:if>
						</div>
					</div>


				</div>
			<br><br><br><br>
		</div>
	</c:if>
	</section>
  	<div id="artContent" class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content art_content">
				<!-- modal 위치  -->
			
			</div>
		</div>
	</div>	
</body>
</html>