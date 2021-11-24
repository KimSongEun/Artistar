<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/artist/myartgallery.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/artist/myartgallery.js"></script>
<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>My Art Gallery</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-xs-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="${pageContext.request.contextPath}/resources/image/${myArtGalleryProfileImg}" class="rounded" onerror="this.src='${pageContext.request.contextPath}/resources/image/myartgallery/default_user.png'">
            <img id="one_2" src="${pageContext.request.contextPath}/resources/image/${myArtGalleryProfileImg}" class="rounded" onerror="this.src='${pageContext.request.contextPath}/resources/image/myartgallery/default_user.png'" style="display: none;">
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
  <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">저장한 작가는 회원님만 볼 수 있습니다.</p>
    <div class="row">
    <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2663개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3563개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">56개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5563개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">201개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
   </div>
   <br/>
   <br/>
   
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">4285개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">321개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5863개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">76개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2853개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">45개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
   </div>
   <br/>
   <br/>
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5667개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6657개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">267개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2508개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">67개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
   </div>
   <br/>
   <br/>
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2885개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">62개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">1699개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">37개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3886개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">157개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png"/></a>

      </div>
   </div>
   <br/>
   <br/>
   <div class="Hidden">  <!--Hidden-->
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2730개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">46개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryart.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5656개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">197개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryart.png"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5371개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">257개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/mygalleryart.png"/></a>

      </div>
   </div>

   <br/>
   <br/>

   <div class="row">
    <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3127개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span></div></div>
         <img class="img-responsive" src="../images/17.jpg"/></a>

      </div>
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">1682개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">37개</span></div></div>
         <img class="img-responsive" src="../images/18.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">4651개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">231개</span></div></div>
         <img class="img-responsive" src="../images/16.jpg"/></a>

      </div>
   </div>

   <br/>
   <br/>

   <div class="row">
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3021개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">62개</span></div></div>
         <img class="img-responsive" src="../images/20.jpg"/></a>

      </div>
 <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">1658개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">51개</span></div></div>
         <img class="img-responsive" src="../images/21.jpg"/></a>

      </div>
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2337개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">52개</span></div></div>
         <img class="img-responsive" src="../images/22.jpg"/></a>

      </div>
   </div>
   
   <br/>
   <br/>
   
   <div class="row">
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">1693개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">32개</span></div></div>
         <img class="img-responsive" src="../images/23.jpg"/></a>

      </div>
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3257개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">118개</span></div></div>
         <img class="img-responsive" src="../images/24.jpg"/></a>

      </div>
       <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3886개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">157개</span></div></div>
         <img class="img-responsive" src="../images/25.jpg"/></a>

      </div>
    </div>
   </div><!-- Hidden-->

   <div class="Hidden1">  <!-- HIdden1-->
   <br/>
   <br/>
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">4453개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">90개</span></div></div>
         <img class="img-responsive" src="../images/28.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">9623개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">116개</span></div></div>
         <img class="img-responsive" src="../images/29.jpg"/></a>

      </div>
     <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5847개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">106개</span></div></div>
         <img class="img-responsive" src="../images/30.jpg"/></a>

      </div>
   </div>

   <br/>
   <br/>

   <div class="row">
     <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">8543개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">156개</span></div></div>
         <img class="img-responsive" src="../images/31.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">4853개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">256개</span></div></div>
         <img class="img-responsive" src="../images/32.jpg"/></a>

      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6524개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">76개</span></div></div>
         <img class="img-responsive" src="../images/33.jpg"/></a>

      </div>
   </div>

   <br/>
   <br/>

   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">5574개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">102개</span></div></div>
         <img class="img-responsive" src="../images/34.jpg"/></a>

      </div>
     <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">4485개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">96개</span></div></div>
         <img class="img-responsive" src="../images/35.jpg"/></a>

      </div>
    <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">3755개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">48개</span></div></div>
         <img class="img-responsive" src="../images/36.jpg"/></a>

      </div>
   </div>
   
   <br/>
   <br/>
   
   <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">2285개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">43개</span></div></div>
         <img class="img-responsive" src="../images/37.jpg"/></a>

      </div>
   <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">1864개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">35개</span></div></div>
         <img class="img-responsive" src="../images/38.jpg"/></a>

      </div>
	<div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">824개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">16개</span></div></div>
         <img class="img-responsive" src="../images/39.jpg"/></a>

      </div>
    </div>
   </div><!-- Hidden1-->
</div><!--Blocl-->

   

      <div class="saveContent" style="display: none;">
      <p style="margin-top: 32px; color: #999; font-size: 12px; font-weight: 400; margin-bottom: 16px; margin-left: 5px; ">저장한 작품은 회원님만 볼 수 있습니다.</p>
      <div class="row">
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">8449개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">58개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/myartgallery/loader.gif""/></a>
      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6851개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/myartgallery/loader.gif""/></a>
      </div>
      <div class="col-xs-4 insList">
        <a href="#"><div class="box"><div class="likeBox"><span class="glyphicon glyphicon-heart"></span><span id="pfont">6851개</span><span class="glyphicon glyphicon-pencil"></span><span id="pfont">126개</span></div></div>
         <img class="img-responsive" src="${pageContext.request.contextPath}/resources/image/myartgallery/loader.gif""/></a>
      </div>
   </div>
 </div>

  <div class="loader"><img src="${pageContext.request.contextPath}/resources/image/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div> 
  
</div>
</section>
</body>
</html>