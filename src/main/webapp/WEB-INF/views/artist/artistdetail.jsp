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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistdetail.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistdetail.js"></script>
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
            <img id="one" src="resources${artistProfileArtist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'">
            <img id="one_2" src="resources${artistProfileArtist.artistImg}" class="rounded" onerror="this.src='resources/image/myartgallery/default_user.png'" style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-xs-7">
      <h1 style="font-weight:lighter; display: inline-block; " >${artistProfileArtist.artistName }</h1>
      <button onclick="fn_movePage('profile')" class="btn btn-default btn-xs" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 15px; padding-right: 15px; font-size: 15px; margin-top: -12px; " >프로필 수정 요청</button>
      &nbsp;
      <button type="button" class="btn btn-xs btn-danger" style="margin-top: -14px; "><img src="resources/image/artist/artistdetail/delete.png" width="22px"/></button>
      <br/>
      <div id="profileInfo"> 
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">작품 수 ${artistProfileArtCount }</div>
          <div id="three">팔로워 ${artistProfileFollowerCount }</div>
          <div id="three">기여자 수 ${artistProfileContributorCount }</div>
      </div>
      <br>
      <div>${artistProfileArtist.artistIntro }</div>
  </div><!-- pro-->

  <!-- 프로필 팔로우/팔로잉 수 -->    
  <div class="row" id="profileInfo_2"> 
    <div class="col-xs-12" style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
      <div class="col-xs-4 text-center" style="height: 60px;">
        <div style="margin-top: 10px; ">작품 수 </div>
        <div>${artistProfileArtCount }</div>
      </div>
      <div class="col-xs-4 text-center">
        <div style="margin-top: 10px;">팔로워 </div>
        <div>${artistProfileFollowerCount }</div>
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
					&nbsp; 작가 &nbsp;
					<img src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png" width="20px"/>
            </div>
            </div>
            <div class="col-md-2"> </div>
            <div class="col-md-2 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
           
                <div class="postFont" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryart.png" width="20px"/>
                	&nbsp; 작품 &nbsp;
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
    <div class="row">
    <div class="col-xs-4 insList">
    <div class="container">
    <div class="item">
			<!-- 작가 정보 출력 -->
				<div class = "artistlist_container text-center">
				
				<div class="artist-item_menu">
                    <br> <span class="artist-item_menu_label"> 🎲 국적 : </span>
                    <span class="artist-item_menu_content">${artistProfileArtist.artistCountry }</span>
                </div>
				<div class="artist-item_menu">
                    <br> <span class="artist-item_menu_label"> 🎲 성별 : </span>
                    <span class="artist-item_menu_content">${artistProfileArtist.artistGender }</span>
                </div>
				<div class="artist-item_menu">
                    <br> <span class="artist-item_menu_label"> 🎲 출생년도 : </span>
                    <span class="artist-item_menu_content">${artistProfileArtist.artistBirth }</span>
                </div>
				<div class="artist-item_menu">
                    <br> <span class="artist-item_menu_label"> 🎲 사망년도 : </span>
                    <span class="artist-item_menu_content">${artistProfileArtist.artistDead }</span>
                </div>
				<div class="artist-item_menu">
                    <br> <span class="artist-item_menu_label"> 🎲 상세 정보  </span> <br>
                    <span class="artist-item_menu_content">${artistProfileArtist.artistDetail }</span>
                </div>
				<br>
				</div>
				<br><br><br>
			</div>
			</div>
			<br><br><br>
      </div>
   </div>
   <br/>
   <br/>
   
</div>
<!--Blocl-->

	  <!-- 작품 리스트 출력 -->
      <div class="saveContent" style="display: none;">
      <div class="row">
      
	  <c:if test="${artistProfileArtInfoList!=null }">
	  <c:forEach items="${artistProfileArtInfoList }" var="artistProfileArtInfoList">
      <div class="col-xs-4 insList py-3">
       	 	<div class="box" style="width : 300px">
		        <div class="likeBox">
			        <span class="glyphicon glyphicon-heart"></span>
			        <span id="pfont">${artistProfileArtInfoList.artLikeCount }개</span>
			        <span class="glyphicon glyphicon-pencil"></span>
			        <span id="pfont">${artistProfileArtInfoList.artCommentCount }개</span>
		        </div>
        	</div>
        <a href="#">
         <img src="resources/${artistProfileArtInfoList.artinfoImg }" width="300px" height="350px" />
         </a>
      </div>
      </c:forEach>
      </c:if>

   </div>
   <br><br><br><br><br><br>
 </div>

  <div class="loader"><img src="resources/image/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div> 
  
</div>
</div>
</section>
</body>
</html>