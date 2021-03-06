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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/myartgallery.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/myartgallery.js"></script>
<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>My Art Gallery</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<button onclick="topFunction()" id="myBtn" class="btn" title="Go to top"><img class="topbtnimg" src = "${pageContext.request.contextPath}/resources/image/index/template/TOP.png"></button>
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="${myArtGalleryProfileImg}" onerror="this.src='resources/image/artist/myartgallery/default_user.png'">
            <img id="one_2" src="${myArtGalleryProfileImg}" onerror="this.src='resources/image/artist/myartgallery/default_user.png'" style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-8 text-center">
      <h1 style="font-weight:lighter; display: inline-block; padding-top : 25px" >${userId } ?????? Gallery</h1>
      <br/>
      <div id="profileInfo"> 
      
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">?????? ?????? ??? ${myArtGalleryArtistCount }???</div>
          <div id="three">?????? ?????? ??? ${myArtGalleryArtCount }???</div>
          
      </div>
  </div><!-- pro-->

  <!-- ????????? ?????????/????????? ??? -->    
  <div class="row" id="profileInfo_2"> 
    <div class="col-12" style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
      <div class="col-4 text-center" style="height: 60px;">
        <div style="margin-top: 10px; ">?????? ?????? ???</div>
        <div>${myArtGalleryArtistCount }</div>
      </div>
      <div class="col-4 text-center">
        <div style="margin-top: 10px;">?????? ?????? ???</div>
        <div>${myArtGalleryArtCount }</div>
      </div>
    </div>
  </div>

<!--tab-->
    <div class="row" id="profileInfo_3" style="margin-top: 50px;"> 
        <!-- <div class="col-16" style="border-top: 1px solid #efefef"> -->
            <div class="col-3" style="height: 52px;" >
            </div> 
            <div class="col-2 text-center" id="post" style="height : 55px; border-top: 1px solid #000; cursor: pointer; padding: 0px; display:inline-block"  >
            
                <div class="active postFontArtist" style="margin-top: 15px; font-size: 12px;">
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
					&nbsp; ?????? ?????? &nbsp;
					<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
            </div>
            </div>
            <div class="col-1"> </div>
            <div class="col-2 text-center" id="save" style="height : 55px; border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
           
                <div class="postFontArt" style="margin-top: 15px; font-size: 12px;">
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                	&nbsp; ?????? ?????? &nbsp;
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                </div>
            </div>
            <div class="col-3"> </div>
        <!-- </div> -->
  </div>
  <!--tap-->

  <div class="row" id="profileInfo_4">
    <div class="col-12" style="border-top: 1px solid #efefef"> 
        <div class="col-6 text-center" style="height: 44px; cursor: pointer;" id="post2">
        <span class="glyphicon glyphicon-th glyColorArtist" style="margin-top: 15px;"></span>
        </div>
         <div class="col-6 text-center" id="save2">
        <span class="glyphicon glyphicon-bookmark glyColorArt" style="margin-top: 15px; cursor: pointer;"></span>
        </div>
        </div>
   </div>


  <div class="postContent">
  <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">
  		????????? ????????? ???????????? ??? ??? ????????????.
  </p>
    <div class="row">
    <div class="col-4 insList">
    <div class="container">
    <div class="item">
			<!-- ?????? ????????? ?????? -->
			<c:if test="${myGalleryArtistList=='[]' }">
				      		<div class="col" align="center">
			<h5 style="color: gray;">????????? ????????? ????????????. ??????????????????!!</h5>
		</div>
			</c:if>
				<c:if test="${myGalleryArtistList!='[]' }">
				<c:forEach items="${myGalleryArtistList }" var="myGalleryArtistList">
				<div class = "artistlist_container">
				<div class="artistlist_item artistlist_artist">
				  <div class="user_profile">
                    <div class="profile_thumb">
                        <img src="${myGalleryArtistList.artistImg}" class="rounded" onerror="this.src='resources/image/artist/myartgallery/default_user.png'">
                    </div>
                    <div class="detail">
                        <div class="id m_text" style="height:20px;">${myGalleryArtistList.artistName }<img class="align-top"src="resources/image/artist/artistdetail/artist_check.png" width="10px"/></div>
                        <div class="ko_name">????????? ${myGalleryArtistList.follower } ???</div>
                    </div>
				  </div>
                   <div class="artistlist_item detailgo">
                   	<a href="artistdetailArtist?artistNum=${myGalleryArtistList.artistNum }"><button type="button" class="btn btn-warning">Detail</button></a>
                   </div>
				</div>
				<br>
		 		<div class="artistlist_art"> 
		 		
		 		
		 		<c:choose>
		 			<c:when test="${fn:length(myGalleryArtistList.artInfo) >= 3 }">
		 			
						<c:forEach items="${myGalleryArtistList.artInfo }" var="artInfo" begin="0" end="2">
							<div class="artist_mainart">
								<img class="mainart" src="${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artist/artistart/default_art.png'"/>
							</div> 
 						</c:forEach>
		 			</c:when>
		 			<c:when test="${fn:length(myGalleryArtistList.artInfo) eq 2 }">
		 				<c:forEach items="${myGalleryArtistList.artInfo }" var="artInfo" begin="0" end="1">
							<div class="artist_mainart">
								<img class="mainart" src="${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artist/artistart/default_art.png'"/>
							</div> 
						</c:forEach>			
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artist/artistart/default_art.png" height="250px"/>
							</div> 	
		 			</c:when>
		 			<c:when test="${fn:length(myGalleryArtistList.artInfo) eq 1 }">
		 				<c:forEach items="${myGalleryArtistList.artInfo }" var="artInfo" begin="0" end="0">
							<div class="artist_mainart">
								<img class="mainart" src="${artInfo.artinfoImg }" height="250px" onerror="this.src='resources/image/artist/artistart/default_art.png'"/>
							</div> 
						</c:forEach>
						<c:forEach begin="1" end="2">		
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artist/artistart/default_art.png" height="250px"/>
							</div> 	
						</c:forEach>	
		 			</c:when>	
 			 		<c:when test="${empty myGalleryArtistList.artInfo}">
						<c:forEach begin="0" end="2">
							<div class="artist_mainart">
								<img class="mainart" src="resources/image/artist/artistart/default_art.png" height="250px"/>
							</div> 	
						</c:forEach>			
					</c:when>	 		
		 		</c:choose>
				</div>
				</div>
				<br><br><br>
				</c:forEach>
				</c:if>		
				<div class="plus"></div>	
				  <div class="loaderArtist text-center"><img src="resources/image/artist/myartgallery/loader.gif" alt="?????? ?????????" width=50px></div> 
			</div>
			</div>
			<br><br><br>
      </div>
   </div>
   <br/>
   <br/>
 <!-- Hidden-->
<!-- HIdden1-->
   <div class="Hidden1">  
   <br/>
   <br/>
   <div class="row">
      <div class="col-4 insList">
			??????
      </div>
   </div>

   <br/>
   <br/>

   </div>
   <!-- Hidden1-->
   
</div><!--Blocl-->

	  <!-- ?????? ????????? ?????? -->
      <div class="saveContent" style="display: none;">
      <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">????????? ????????? ???????????? ??? ??? ????????????.</p>
      <div class="row">
      		<c:if test="${myGalleryArtList=='[]' }">
		<div class="col" align="center">
			<h5 style="color: gray;">????????? ????????? ????????????. ??????????????????!!</h5>
		</div>
			</c:if>
	  <c:if test="${myGalleryArtList!='[]' }">
	  <c:forEach items="${myGalleryArtList }" var="myGalleryArtList">
      <div class="col-4 insList py-3">
              <a onclick="contentView(${myGalleryArtList.artinfoNum})" id="replyView" type="button" data-bs-toggle="modal" data-bs-target="#artContent">
       	 	<div class="box" style="width : 300px; height:350px; margin-top:17px">
		        <div class="likeBox">
			        <span><i class="fas fa-heart"></i></span>
			        <span id="pfont">${myGalleryArtList.artLikeCount }???</span>
			        <span style="margin-left:40px;"><i class="fas fa-pencil-alt"></i></span>
			        <span id="pfont">${myGalleryArtList.artCommentCount }???</span>
		        </div>
        	</div>
         <%-- <img class="img-responsive" src="resources/${myGalleryArtList.artinfoImg }" /> --%>
         <img src="${myGalleryArtList.artinfoImg }" width="300px" height="350px" />
         </a>
      </div>
      </c:forEach>
      </c:if>

   </div>
       <div class="row plusArt" style="padding:0px"></div>
   <br><br><br>
 <div class="loaderArt text-center"><img src="resources/image/artist/myartgallery/loader.gif" alt="?????? ?????????" width=50px></div>
 <br><br><br>
 </div>

</div>
</div>
</section>
   	<div id="artContent" class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content art_content">
				<!-- modal ??????  -->
			
			</div>
		</div>
	</div>
	<script>
    var mybutton = document.getElementById("myBtn");
    $(function(){
     window.onscroll = function() {scrollFunction()};
    });
    function topFunction() {
       window.scrollTo({top:0, behavior:'smooth'});
     }
  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }

	</script>
</body>
</html>