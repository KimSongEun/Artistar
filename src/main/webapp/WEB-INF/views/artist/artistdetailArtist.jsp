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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistdetailArtist.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistdetailArtist.js"></script>
<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>Artist Detail</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="resources${artistProfileArtist.artistImg}" onerror="this.src='resources/image/artist/myartgallery/default_user.png'">
            <img id="one_2" src="resources${artistProfileArtist.artistImg}" onerror="this.src='resources/image/artist/myartgallery/default_user.png'" style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-9">
      <h1 style="font-weight:lighter; display: inline-block; " >${artistProfileArtist.artistName }</h1>
      <div style="height:48px; display : inline-block" class="align-top"><img src="resources/image/artist/artistdetail/artist_check.png" width="15px"/></div>
      <div id="artistFollowImg" style="display:inline-block"></div>
      <form action="artistedit" method="POST" style="display : inline">
	      <button type="submit" class="btn btn-outline-secondary btn-sm" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 15px; padding-right: 15px; font-size: 15px; margin-top: -12px; " >프로필 수정 요청</button>
	      <input type="hidden" name="artistNum" value="${artistProfileArtist.artistNum}"/>
	      <input type="hidden" name="type" value="update"/>
      </form>
      &nbsp;
      <form action="artistedit" method="POST" style="display : inline">
	      <button type="submit" class="btn btn-sm btn-danger" style="margin-top: -14px; "><img src="resources/image/artist/artistdetail/delete.png" width="22px"/></button>
	      <input type="hidden" name="artistNum" value="${artistProfileArtist.artistNum}"/>
		  <input type="hidden" name="type" value="delete"/>
	  </form>
      <br/>
      <div id="profileInfo"> 
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">작품 수 ${artistProfileArtCount }</div>
          <div id="three">팔로워 <span id="followerCount"> ${artistProfileFollowerCount } </span></div>
          <div id="three">기여자 수<span> ${artistProfileContributorCount }</span></div>
      </div>
      <br>
      <div>${artistProfileArtist.artistIntro }</div>
  </div><!-- pro-->
  </div>
<input type="hidden" id="artistNum" value="${artistProfileArtist.artistNum}"/>

  <!-- 프로필 팔로우/팔로잉 수 -->    
  <div class="row" id="profileInfo_2" style="display : none"> 
    <div class="col-12" style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
      <div class="col-4 text-center" style="height: 60px;">
        <div style="margin-top: 10px; ">작품 수 </div>
        <div>${artistProfileArtCount }</div>
      </div>
      <div class="col-4 text-center">
        <div style="margin-top: 10px;">팔로워 </div>
        <div>${artistProfileFollowerCount }</div>
      </div>
    </div>
  </div>

<!--tab-->
    <div class="row" id="profileInfo_3" style="margin-top: 50px;border-top: 1px solid #efefef"> 
        <!-- <div class="col-12" style="border-top: 1px solid #efefef"> -->
            <div class="col-3"></div> 
            
            <div class="col-2 text-center" id="post" style="height : 55px; border-top: 1px solid #000; cursor: pointer; padding: 0px; display:inline-block" >
                <div class="active postFontArtist" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
					&nbsp; 작가 &nbsp;
					<img src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
            	</div>
            </div>
            
            <div class="col-1"> </div>
            
            <div class="col-2 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
                <div class="postFontArt" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                	&nbsp; 작품 &nbsp;
                	<img src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                </div>
            </div>
            
            <div class="col-3" > </div>
        <!-- </div> -->
  </div>
  <!--tap-->

  <div class="row" id="profileInfo_4" style="display:none">
    <div class="col-12" style="border-top: 1px solid #efefef"> 
        <div class="col-6 text-center" style="height: 44px; cursor: pointer;" id="post2">
        <span class="glyphicon glyphicon-th glyColorArtist" style="margin-top: 15px;"></span>
        </div>
         <div class="col-6 text-center" id="save2">
        <span class="glyphicon glyphicon-bookmark glyColorArt" style="margin-top: 15px; cursor: pointer;"></span>
        </div>
        </div>
   </div>

<div>
  <div class="postContent" style="margin-top:40px">
    <!-- <div class="row" > -->
    <div class="col-12"  style="margin:0 auto;">
    <div class="container">
    <div class="item">
			<!-- 작가 정보 출력 -->
				<div class = "artistlist_container row">
				<br><br>
				<div>
				<form>
				
				  <div class="form-group row">
				  	<div class="col-3"></div>
				    <label for="staticEmail" class="col-3 col-form-label" style="padding-left:70px"> <img src="resources/image/artist/artistdetail/brush.png" width="20px" />&nbsp;&nbsp; 국적 : </label>
				    <div class="col-4">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${artistProfileArtist.artistCountry }" style="width : 200px">
				    </div>
				    <div class="col-2"></div>
				  </div>
				  
				  <div class="form-group row">
				  <div class="col-3"></div>
				    <label for="staticEmail" class="col-3 col-form-label" style="padding-left:70px"><img src="resources/image/artist/artistdetail/brush.png" width="20px"  />&nbsp;&nbsp; 성별 : </label>
				    <div class="col-4">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${artistProfileArtist.artistGender }" style="width : 200px">
				    </div>
				    <div class="col-2"></div>
				  </div>
				  
				  <div class="form-group row">
				  <div class="col-3"></div>
				    <label for="staticEmail" class="col-3 col-form-label" style="padding-left:70px"><img src="resources/image/artist/artistdetail/brush.png" width="20px" />&nbsp;&nbsp; 출생년도 : </label>
				    <div class="col-4">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${artistProfileArtist.artistBirth }"  style="width : 200px">
				    </div>
				    <div class="col-2"></div>
				  </div>
				  
				  <div class="form-group row">
				  <div class="col-3"></div>
				    <label for="staticEmail" class="col-3 col-form-label" style="padding-left:70px"><img src="resources/image/artist/artistdetail/brush.png" width="20px" />&nbsp;&nbsp; 사망년도 :  </label>
				    <div class="col-4">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${artistProfileArtist.artistDead }" style="width : 200px">
				    </div>
				    <div class="col-2"></div>
				  </div>
				  
				  <div class="form-group row">
				  <div class="col-3"></div>
				    <label for="staticEmail" class="col-3 col-form-label" style="padding-left:70px"><img src="resources/image/artist/artistdetail/brush.png" width="20px" />&nbsp;&nbsp; 상세 정보 : </label>
				    <div class="col-4">
				      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${artistProfileArtist.artistDetail }" style="width : 200px">
				    </div>
				    <div class="col-2"></div>
				  </div>
				  
				</form>
				</div>
				<br>
				</div>
				<br><br><br>
			</div>
			</div>
			<br><br><br>
      </div>
   <!-- </div> -->
   <br/>
   <br/>
   
</div>
</div>

   
 <div class="loaderArt text-center"><img src="resources/image/artist/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div>
 <br><br><br>

  
</div>
</div>
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