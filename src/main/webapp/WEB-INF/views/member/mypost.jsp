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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypost.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/mypost.js"></script>
<!-- icon -->
<link rel="icon" href="resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">

<title>My Art Gallery</title>
<body>
<%@ include file="../index/header.jsp" %>
<section style="margin-top : 100px">
<div class="container">
  <div class="row" style="margin-top: 20px;">
   		<div class="col-3 col-xs-offset-1">
               <input type="hidden" id="id" value="${id}" /><input type="hidden"
                   value="${checkFollow}" id="checkhidden">
               <div class="photo">
                   <img class="profilePhotoImg" id="profilePhotoImg"
                       style="height: 150px;width: 150px;"
                       src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png">
               </div>
           </div>
    
      <div class="col-8 text-center">
                                    <h1
                                        style="font-weight:lighter; display: inline-block; padding-top : 25px; padding-right: 20px;">
                                        ${id}</h1>
                                    <c:if test="${id != member.id }">
                                        <span class="follow">
                                            <c:choose>
                                                <c:when test="${checkFollow eq 0 }">
                                                    <button class="followBtn" id="follow" onclick="calc();">팔로우</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="followBtn" id="unfollow"
                                                        onclick="calc();">언팔로우</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </c:if>

                                    <c:if test="${id== member.id }">
                                        <!-- 프로필편집 버튼 -->
                                        <a class="profileEdit" href="${pageContext.request.contextPath}/memberupdate"
                                            style="text-decoration: none">
                                            <button type="button" class="editBtn" style="margin-right: 20px;">프로필
                                                편집</button>
                                        </a>

                                        <!-- 설정 모달 -->
                                        <button type="button" data-toggle="modal" data-target="#setModal"
                                            class="profileOption" style="background-color: white; border: none;">
                                            <i class="fas fa-cog 2x"></i>
                                            <span class="setBtn"></span>
                                        </button>
                                    </c:if>

                                    <div class="modal fade" id="setModal">
                                        <div class="modal-dialog m-box">
                                            <div class="modal-content m-content">
                                                <div class="modal-body m-body">
                                                    <button class="modal-btn" id="pwChangeBtn" tabindex="0"
                                                        style="color: #3897f0; font-weight: 700;">비밀번호 변경</button>
                                                    <button class="modal-btn" id="logoutBtn" tabindex="0"
                                                        style="color: #ed4956; font-weight: 700;">로그아웃</button>
                                                    <button class="modal-btn" data-dismiss="modal" tabindex="0"
                                                        style="font-weight: 700;">취소</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br />
                                    <div id="profileInfo">
                                        <div style="font-size: 17px; display: inline-block; margin-top: 15px">게시물
                                            ${myPostCount }</div>
                                        <div id="three">팔로워 ${myFollowerCount}</div>                                     
                                            <div id="three">팔로우 ${myFollowCount}</div>
                                       
                                    </div>
                                </div><!-- pro-->


	  <!-- 포스트 리스트 출력 -->
      <div class="saveContent">
      <div class="row">
      <hr style="margin: 30px 0 50px">
	    <c:if test="${postlist!=null }">
                 <c:forEach items="${postlist }" var="postlist">
                     <div class="col-4 insList">
                         <a onclick="contentView(${postlist.postNum})" id="replyView"
                             type="button" data-bs-toggle="modal" data-bs-target="#postContent">

                             <c:forEach items="${postlist.postImgList }" var="postImgList"
                                 varStatus="i">
                                 <c:choose>
                                     <c:when test="${i.count == 1 }">
                                         <div class="carousel-item active">
                                             <img src="${postImgList.postImg }"
                                                 style="height:350px; width:300px; margin:10px;">
                                         </div>
                                     </c:when>
                                     <c:otherwise>
                                         <div class="carousel-item">
                                             <img src="${postImgList.postImg }"
                                                 style="height:350px; width:300px; margin:10px;">
                                         </div>
                                     </c:otherwise>
                                 </c:choose>
                             </c:forEach>

                             <div class="box" style="height: 350px; width: 300px; margin:8px;">
                                 <div class="likeBox">
                                     <span><i class="fas fa-heart"></i></span>
                                     <span id="pfont">${postlist.postLikeCount }개</span>
                                 </div>
                             </div>
                         </a>

                     </div>
                 </c:forEach>
             </c:if>
      </div>
 <div class="loaderArt text-center"><img src="${pageContext.request.contextPath}/resources/image/artist/myartgallery/loader.gif" alt="로딩 이미지" width=50px></div>
 <br><br><br>
 </div>
</div>
</div>
</section>
   
</body>
</html>