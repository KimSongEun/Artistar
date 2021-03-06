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
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<!-- datepicker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

<!-- GoogleMap -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_bY5lxulq4V8ivu9OBkpY-LogpHcQSmo"></script>

<title>Artist Detail</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<button onclick="topFunction()" id="myBtn" class="btn" title="Go to top"><img class="topbtnimg" src = "${pageContext.request.contextPath}/resources/image/index/template/TOP.png"></button>
<div class="container">
  <div class="row" style="margin-top: 20px;">
    <div class="col-3 col-xs-offset-1">
        <div id="profileImgs" class="text-center">
            <img id="one" src="${artistProfileArtist.artistImg}" onerror="this.src='resources/image/admin/artist/artist_default.png'">
            <img id="one_2" src="${artistProfileArtist.artistImg}" onerror="this.src='resources/image/admin/artist/artist_default.png'" style="display: none;">
        </div>
    </div><!--col-xs-3-->
    <div class="col-9">
      <h1 style="font-weight:lighter; display: inline-block; " >${artistProfileArtist.artistName }</h1>
      <div style="height:48px; display : inline-block" class="align-top"><img src="resources/image/artist/artistdetail/artist_check.png" width="15px"/></div>
      <div id="artistFollowImg" style="display:inline-block"></div>
      <form action="artistedit" method="POST" style="display : inline">
	      <button type="submit" class="btn btn-outline-secondary btn-sm" style="display: inline-block; margin-left: 20px; font-weight: bold; padding-left: 15px; padding-right: 15px; font-size: 15px; margin-top: -12px; " >????????? ?????? ??????</button>
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
          <div style="font-size: 17px; display: inline-block; margin-top: 15px">?????? ??? ${artistProfileArtCount }</div>
          
          <div id="three">
		    <a role="button" style="font-size: 12pt;" data-bs-toggle="modal" data-bs-target="#followerView">      
		          ????????? <span id="followerCount"> ${artistProfileFollowerCount } </span>
           </a>
          </div>
          
          <!-- ????????? ??????:TODO-->
			<div class="modal fade" id="followerView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content" id="reloadArea">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">????????? ??????</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			              <c:if test="${artistFollowerList == '[]' }">
					      	???????????? ????????????. ?????? ???????????? ?????????????????? :)
					      </c:if>
					      <c:if test="${artistFollowerList != '[]' }">
						      <c:forEach var="artistFollowerList" items="${artistFollowerList }">
						      	<img style="border-radius: 70%; width: 30px; height: 30px;" src="${artistFollowerList.member.member_img }" onerror="this.src='${pageContext.request.contextPath}/resources/image/artist/myartgallery/default_user.png'"/>
						      	<a class="link-dark" style="font-weight: bold; margin-left: 10px;" href="#???????????? ????????????">${artistFollowerList.member.uname }</a><br/><br/>
						      </c:forEach>
					      </c:if>
			      </div>
			    </div>
			  </div>
			</div>
          
          <div id="three">
          <a role="button" style="font-size: 12pt;" data-bs-toggle="modal" data-bs-target="#contributorView">      
		          ????????? ??? <span> ${artistProfileContributorCount } </span>
           </a>
          </div>
          
          <!-- ????????? ??????:TODO-->
			<div class="modal fade" id="contributorView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">????????? ??????</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			              <c:if test="${artistContributorList == '[]' }">
					      	???????????? ????????????. ?????? ????????? ????????? ?????????????????? :)
					      </c:if>
					      <c:if test="${artistContributorList != '[]' }">
						      <c:forEach var="artistContributorList" items="${artistContributorList }">
						      	<img style="border-radius: 70%; width: 30px; height: 30px;" src="${artistContributorList.member.member_img }" onerror="this.src='${pageContext.request.contextPath}/resources/image/artist/myartgallery/default_user.png'"/>
						      	<a class="link-dark" style="font-weight: bold; margin-left: 10px;" href="#???????????? ????????????">${artistContributorList.member.uname }</a><br/><br/>
						      </c:forEach>
					      </c:if>
			      </div>
			    </div>
			  </div>
			</div>          
          
          
      </div>
      <br>
      <div>${artistProfileArtist.artistIntro }</div>
  </div><!-- pro-->
  </div>
<input type="hidden" id="artistNum" value="${artistProfileArtist.artistNum}"/>

  <!-- ????????? ?????????/????????? ??? -->    
  <div class="row" id="profileInfo_2" style="display : none"> 
    <div class="col-12" style="border-bottom: 1px solid #efefef; border-top: 1px solid #efefef;">
      <div class="col-4 text-center" style="height: 60px;">
        <div style="margin-top: 10px; ">?????? ??? </div>
        <div>${artistProfileArtCount }</div>
      </div>
      <div class="col-4 text-center">
        <div style="margin-top: 10px;">????????? </div>
        <div>${artistProfileFollowerCount }</div>
      </div>
    </div>
  </div>

<!--tab-->
    <div class="row" id="profileInfo_3" style="margin-top: 50px;border-top: 1px solid #efefef"> 
        <!-- <div class="col-12" style="border-top: 1px solid #efefef"> -->
            <div class="col-3"></div> 
            
            <div class="col-2 text-center" id="post" style="height : 55px; border-top: 1px solid #000; cursor: pointer; padding: 0px; display:inline-block" >
                <div class="postFontArtist" style="margin-top: 15px; font-size: 12px;">
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
					&nbsp; <span class="artistSpan">??????</span> &nbsp;
					<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryartist.png" width="20px"/>
            	</div>
            </div>
            
            <div class="col-1"> </div>
            
            <div class="col-2 text-center" id="save" style="border-top: 1px solid #000; cursor: pointer; padding: 0px;" >
                <div class="active postFontArt" style="margin-top: 15px; font-size: 12px;">
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                	&nbsp; <span class="artistSpan">??????</span> &nbsp;
                	<img class="tabImg" src="${pageContext.request.contextPath}/resources/image/artist/artistmain/mygalleryart.png" width="20px"/>
                </div>
            </div>
            
            <div class="col-3" > </div>
        <!-- </div> -->
  </div>
  <!--tap-->
	  <!-- ?????? ????????? ?????? -->
      <div class="saveContent">
      
      
	<div class="artlist-plus">
				
		<form method="POST" action="artinsert" enctype="multipart/form-data">
				<input type="hidden" name="artist_num" value="${artistProfileArtist.artistNum }"/>
					<!-- ?????? ?????? modal -->
					<div class="modal fade" id="artPlusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
					    <div class="modal-content" >
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel"><img src="resources/image/artist/artistdetail/brush.png" width="30px"/> ?????? ????????????  <img src="resources/image/artist/artistdetail/brush.png" width="30px"/></h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="overflow-x:hidden">
					        
				  		 <br><br>
								  				<div class="row mb-3">
												   <label for="artistImg" class="col-sm-3 col-form-label"> ?????? &nbsp;<img id="ImgView" src="resources/image/artist/artistdetail/painting.png" width="30px" height="30px" style="border-radius: 50%;"></label>
												   <div class="col-sm-9" style="padding-right : 100px">
												    <input type="file" name="artistImg" class="ko_name form-control profileImageInsert" 
					                       			id="profileImageInsert" onchange="loadImg(this)" required>
												   </div>
											    </div>
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_name" class="col-sm-3 col-form-label">?????????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_name" id="name" required/>
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_year" class="col-sm-3 col-form-label">????????????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control datetimepicker-input" name="artinfo_year" id="year" data-toggle="datetimepicker" data-target="#year">
												    </div>
												  </div>
												  
						  						   <div class="row mb-3">
												    <label for="artinfo_trend" class="col-sm-3 col-form-label">??????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_trend" id="trend">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_kind" class="col-sm-3 col-form-label">??????</label>
												    <div class="col-sm-9" id="birthpick" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_kind" id="kind">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_technic" class="col-sm-3 col-form-label">??????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_technic" id="technic">
												    </div>
												  </div>
												  
												  <div class="row mb-3">
												    <label for="artinfo_size" class="col-sm-3 col-form-label">??????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <input type="text" class="form-control" name="artinfo_size" id="size">
												    </div>
												  </div> 
												  
												  <div class="row mb-3">
												    <label for="artinfo_collection" class="col-sm-3 col-form-label">?????????</label>
												    <div class="input-group mb-3" style="width : 490px;">
													  <input type="text"  class="form-control" name="artinfo_collection" id="artinfo_collection" aria-label="Recipient's username" aria-describedby="addressEnter">
													  <button class="btn btn-outline-secondary" type="button" id="addressEnter">????????????</button>							      
		<div class="input-group mb-3" id="artinfo_collection_div" style="display:none; margin-top : 10px; margin-bottom : 10px">
		  <input type="text" class="form-control" id="artinfo_collection_address" name="artinfo_collection_address" placeholder="???????????? ????????? ????????? ??????????????????" aria-label="Recipient's username" aria-describedby="address_button">
		  <button class="btn btn-outline-danger address_button" type="button" id="address_button" onclick="geoCode()">??????/?????? ??????</button>
		</div>
		<div>
			<div class="input-group mb-3" id="lad_lon_info" style="width : 470px; display:none; ">
			  <span class="input-group-text" id="latitude">??????</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lat" aria-describedby="latitude" name="artinfo_collection_address_lat">
			  &nbsp; &nbsp;
			  <span class="input-group-text" id="longitude">??????</span>
			  <input type="text" class="form-control" id="artinfo_collection_address_lon" aria-describedby="longitude" name="artinfo_collection_address_lon">
			</div>
		</div>
		<div id="lad_lon_alert" style="display : none; width : 490px">
		<div class="alert alert-danger d-flex align-items-center" role="alert">
		  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
		  <div>
		   &nbsp; ????????? ??????/????????? ????????? ??? ????????????. <br>
		 &nbsp;  ?????? ????????? ?????? ??????/????????? ?????? ??????????????????.
		  </div>
		</div>
		</div>
					 									 <div id="map" style="width:100%; height: 200px;display : none;"></div>
					 									 
												    </div>
												  </div>

												  <div class="row mb-3">
												    <label for="artinfo_hash_tag" class="col-sm-3 col-form-label">????????????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <textarea class="form-control" name="artinfo_hash_tag" id="hash_tag"  style="height : 100px" placeholder="#????????????"></textarea>
												    </div>
												  </div>	
												  
						 				   		<div class="row mb-3">
												    <label for="artinfo_detail" class="col-sm-3 col-form-label">????????????</label>
												    <div class="col-sm-9" style="padding-right : 100px">
												      <textarea class="form-control" name="artinfo_detail" id="detail"  style="height : 300px"></textarea>
												    </div>
												  </div>		
												  
												  <br><br>
										        
										      </div>
										      <div class="modal-footer">
										        <button type="submit" class="btn btn-primary">?????? ????????????</button>
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
										      </div>
										    </div>
										  </div>
										</div>
							</form>
					
					<button class="btn"  data-bs-toggle="modal" data-bs-target="#artPlusModal">
						<img src="resources/image/artist/artistmain/artistplus.png" width="30px"/>
					</button>
				</div>
				
				
      <div class="row plusArt">
      
      <c:if test="${artistProfileArtInfoList=='[]' }">
      		<div class="col" align="center">
			<h5 style="color: gray;">????????? ????????????. ??????????????????!!</h5>
		</div>
      </c:if>
      
	  <c:if test="${artistProfileArtInfoList!=null }">
	  <c:forEach items="${artistProfileArtInfoList }" var="artistProfileArtInfoList">
      <div class="col-4 insList py-3">
          <a onclick="contentView(${artistProfileArtInfoList.artinfoNum})" id="replyView" type="button" data-bs-toggle="modal" data-bs-target="#artContent">
       	 	<div class="box" style="width : 300px;height:350px; margin-top:17px">
		        <div class="likeBox">
			        <span><i class="fas fa-heart"></i></span>
			        <span id="pfont">${artistProfileArtInfoList.artLikeCount }???</span>
			       <!--  &nbsp; -->
			        <span style="margin-left:40px;"><i class="fas fa-pencil-alt"></i></span>
			        <span id="pfont">${artistProfileArtInfoList.artCommentCount }???</span>
		        </div>
        	</div>
         <img src="${artistProfileArtInfoList.artinfoImg }" width="300px" height="350px" />
         </a>
      </div>
      </c:forEach>
      </c:if>
      <!-- <div class="plusArt"></div> -->

   </div>
   <br><br><br>
   

   
 <div class="loaderArt text-center"><img src="resources/image/artist/myartgallery/loader.gif" alt="?????? ?????????" width=50px></div>
 <br><br><br>

  
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
	
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>		
	<script>
		CKEDITOR.replace("artinfo_detail", {height : 300, width : 467.9});
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