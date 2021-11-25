<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/myartgallery.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/myartgallery.js"></script>
<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>My Art Gallery</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-xs-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="resources/image/${myArtGalleryProfileImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
            <img id="one_2" src="resources/image/${myArtGalleryProfileImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'" style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-xs-7 text-center">
      <h1 style="font-weight:lighter; display: inline-block; padding-top : 25px" >${userId } 님의 Gallery</h1>
      <br/>
      <div id="profileInfo"> 
      
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">저장 작가 수 ${myArtGalleryArtistCount }명</div>
          <div id="three">저장 작품 수 ${myArtGalleryArtCount }점</div>
          
      </div>
  </div><!-- pro-->

  <!-- 프로필 팔로우/팔로잉 수 -->    
  <div class="row" id="profileInfo_2"> 
    <div class="col-xs-12" style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
      <div class="col-xs-4 text-center" style="height: 60px;">
        <div style="margin-top: 10px; ">저장 작가 수</div>
        <div>${myArtGalleryArtistCount }</div>
      </div>
      <div class="col-xs-4 text-center">
        <div style="margin-top: 10px;">저장 작품 수</div>
        <div>${myArtGalleryArtCount }</div>
      </div>
    </div>
  </div>

<!--tab-->
    <div class="row" id="profileInfo_3" style="margin-top: 50px;"> 
        <div class="col-xs-16" style="border-top: 1px solid #efefef">
            <div class="col-xs-3" style="height: 52px;" >
            </div> 
            <div class="col-xs-2 text-center" id="post" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;"  >
            
                <div class="active postFont" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png" width="20px"/>
					&nbsp; 나의 작가 &nbsp;
					<img src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png" width="20px"/>
            </div>
            </div>
            <div class="col-md-2"> </div>
            <div class="col-md-2 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
           
                <div class="postFont" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryart.png" width="20px"/>
                	&nbsp; 나의 작품 &nbsp;
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryart.png" width="20px"/>
                </div>
            </div>
            <div class="col-xs-1"> </div>
            <div class="col-xs-4" >
            </div>
        </div>
  </div>
  <!--tap-->

  <div class="row" id="profileInfo_4">
    <div class="col-xs-12" style="border-top: 1px solid #efefef"> 
        <div class="col-xs-6 text-center" style="height: 44px; cursor: pointer;" id="post2">
        <span class="glyphicon glyphicon-th glyColor" style="margin-top: 15px;"></span>
        </div>
         <div class="col-xs-6 text-center" id="save2">
        <span class="glyphicon glyphicon-bookmark glyColor" style="margin-top: 15px; cursor: pointer;"></span>
        </div>
        </div>
   </div>


  <div class="postContent">
  <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">
  		저장한 작가는 회원님만 볼 수 있습니다.
  </p>
    <div class="row">
    <div class="col-xs-4 insList">
    <div class="container">
    <div class="item">
			<!-- 작가 리스트 출력 -->
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
		 		
		 		
		 		<c:choose>
		 			<c:when test="${fn:length(artistvolist.artInfo) >= 3 }">
		 			
						<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="2">
							<div class="artist_mainart">
								<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
							</div> 
 						</c:forEach>
		 			</c:when>
		 			<c:when test="${fn:length(artistvolist.artInfo) eq 2 }">
		 				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="1">
							<div class="artist_mainart">
								<img class="mainart" src="resources/${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artistart/default_art.png'"/>
							</div> 
						</c:forEach>			
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artistart/default_art.png" height="250px"/>
							</div> 	
		 			</c:when>
		 			<c:when test="${fn:length(artistvolist.artInfo) eq 1 }">
		 				<c:forEach items="${artistvolist.artInfo }" var="artInfo" begin="0" end="0">
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
 			 		<c:when test="${empty artistvolist.artInfo}">
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
			<br><br><br>
      </div>
   </div>
   <br/>
   <br/>
 <!-- Hidden-->

   <div class="Hidden1">  <!-- HIdden1-->
   <br/>
   <br/>
   <div class="row">
      <div class="col-xs-4 insList">
			안녕
      </div>
   </div>

   <br/>
   <br/>

   </div><!-- Hidden1-->
</div><!--Blocl-->


      <div class="saveContent" style="display: none;">
      <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">저장한 작품은 회원님만 볼 수 있습니다.</p>
      <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">8449개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">58개</span></div></div>
         <img class="img-responsive" src="resources/image/myartgallery/loader.gif""/></a>
      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6851개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span></div></div>
         <img class="img-responsive" src="resources/image/myartgallery/loader.gif""/></a>
      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6851개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span></div></div>
         <img class="img-responsive" src="resources/image/myartgallery/loader.gif""/></a>
      </div>
   </div>
 </div>

  <div class="loader"><img src="resources/image/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div> 
  
</div>
</section>
</body>
</html>