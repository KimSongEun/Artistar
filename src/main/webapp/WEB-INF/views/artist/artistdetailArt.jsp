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
<link rel="stylesheet" type="text/css" href="resources/css/artist/artistdetailArt.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/artist/artistdetailArt.js"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="resources/image/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

<title>Artist Detail</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="resources${artistProfileArtist.artistImg}" onerror="this.src='resources/image/myartgallery/default_user.png'">
            <img id="one_2" src="resources${artistProfileArtist.artistImg}" onerror="this.src='resources/image/myartgallery/default_user.png'" style="display: none;">
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
            
            <div class="col-2 text-center" id="post" style="border-top: 1px solid #000; cursor: pointer; padding: 0px; display:inline-block" >
                <div class="postFontArtist" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png" width="20px"/>
					&nbsp; 작가 &nbsp;
					<img src="${pageContext.request.contextPath}/resources/image/mygalleryartist.png" width="20px"/>
            	</div>
            </div>
            
            <div class="col-1"> </div>
            
            <div class="col-2 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
                <div class="active postFontArt" style="margin-top: 15px; font-size: 12px;">
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryart.png" width="20px"/>
                	&nbsp; 작품 &nbsp;
                	<img src="${pageContext.request.contextPath}/resources/image/mygalleryart.png" width="20px"/>
                </div>
            </div>
            
            <div class="col-3" > </div>
        <!-- </div> -->
  </div>
  <!--tap-->
	  <!-- 작품 리스트 출력 -->
      <div class="saveContent">
      
      
	<div class="artlist-plus">
				
		<form method="POST" action="artinsert" enctype="multipart/form-data">
				<input type="hidden" name="artist_num" value="${artistProfileArtist.artistNum }"/>
					<!-- 작가 등록 modal -->
					<div class="modal fade" id="artPlusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					    <div class="modal-content" >
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel"><img src="resources/image/artist/artistdetail/brush.png" width="30px"/> 작품 신청하기  <img src="resources/image/artist/artistdetail/brush.png" width="30px"/></h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="overflow-x:hidden">
					        
				  		 <br><br>
								  				<div class="row mb-3">
												   <label for="artistImg" class="col-sm-3 col-form-label"> 사진 &nbsp;<img id="ImgView" src="resources/image/artist/artistdetail/painting.png" width="30px" height="30px" style="border-radius: 50%;"></label>
												   <div class="col-sm-9" style="padding-right : 100px">
												    <input type="file" name="artistImg" class="ko_name form-control profileImageInsert" 
					                       			id="profileImageInsert" onchange="loadImg(this)" required>
												   </div>
											    </div>
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_name" class="col-sm-3 col-form-label">작품명</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_name" id="name" required/>
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_year" class="col-sm-3 col-form-label">제작년도</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control datetimepicker-input" name="artinfo_year" id="year" data-toggle="datetimepicker" data-target="#year">
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_trend" class="col-sm-3 col-form-label">사조</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_trend" id="trend">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_kind" class="col-sm-3 col-form-label">종류</label>
												    <div class="col-sm-9" id="birthpick" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_kind" id="kind">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_technic" class="col-sm-3 col-form-label">기법</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_technic" id="technic">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_size" class="col-sm-3 col-form-label">크기</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_size" id="size">
												    </div>
												  </div> 
												  
												  <div class="row mb-3">
												    <label for="artinfo_collection" class="col-sm-3 col-form-label">소장처</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_collection" id="collection"/>
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_hash_tag" class="col-sm-3 col-form-label">해시태그</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <textarea class="form-control" name="artinfo_hash_tag" id="hash_tag"  style="height : 100px" placeholder="#해시태그"></textarea>
												    </div>
												  </div>	
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_detail" class="col-sm-3 col-form-label">상세정보</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <textarea class="form-control" name="artinfo_detail" id="detail"  style="height : 300px"></textarea>
												    </div>
												  </div>		
												  
												  <br><br>
										        
										      </div>
										      <div class="modal-footer">
										        <button type="submit" class="btn btn-primary">등록 요청하기</button>
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										      </div>
										    </div>
										  </div>
										</div>
							</form>
					
					<button class="btn"  data-bs-toggle="modal" data-bs-target="#artPlusModal">
						<img src="resources/image/artistplus.png" width="30px"/>
					</button>
				</div>
				
				
      <div class="row plusArt">
      
	  <c:if test="${artistProfileArtInfoList!=null }">
	  <c:forEach items="${artistProfileArtInfoList }" var="artistProfileArtInfoList">
      <div class="col-4 insList">
          <a onclick="contentView(${artistProfileArtInfoList.artinfoNum})" id="replyView" type="button" data-bs-toggle="modal" data-bs-target="#artContent">
       	 	<div class="box" style="width : 300px">
		        <div class="likeBox">
			        <span><i class="fas fa-heart"></i></span>
			        <span id="pfont">${artistProfileArtInfoList.artLikeCount }개</span>
			       <!--  &nbsp; -->
			        <span style="margin-left:40px;"><i class="fas fa-pencil-alt"></i></span>
			        <span id="pfont">${artistProfileArtInfoList.artCommentCount }개</span>
		        </div>
        	</div>
         <img src="resources/${artistProfileArtInfoList.artinfoImg }" width="300px" height="350px" />
         </a>
      </div>
      </c:forEach>
      </c:if>
      <!-- <div class="plusArt"></div> -->

   </div>
   <br><br><br>
   

   
 <div class="loaderArt text-center"><img src="resources/image/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div>
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
	<script>
		CKEDITOR.replace("artinfo_detail", {height : 300, width : 467.9});
	</script>
</body>
</html>