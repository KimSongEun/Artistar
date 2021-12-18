<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index/reset.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin/adminArtDeleteRequest.css">
<!-- JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin/adminArtDeleteRequest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 

<!-- icon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/index/template/tab-icon1.ico" type="image/x-icon" sizes="16x16">


<title>Admin Page</title>

</head>
<body>
	<%@ include file="../index/header.jsp" %>
	<section style="margin-top : 100px">
 		<div class="container" style="width:1200px;">
		<div class="row " style="border:1px solid #BDBDBD;">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 hidden-xs" style="width : 310px;">
			<div class="d-flex align-items-start menu">
				  <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				    <main>

					  <div class="flex-shrink-0 p-3 bg-white align-items-center" style="width: 270px; margin : 0 auto; ">
					    <a href="#관리자 메인페이지" class="row d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom text-center">
					 	     <div style="width : 270px;">
							 <img id="one" src="${pageContext.request.contextPath}/resources/image/admin/main/admin_profile.png" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/main/admin_profile.png'"> 
							 </div>
							 <br><br>
					     	 <span class="fs-5 fw-semibold" style="display : inline-block">Artistar Admin</span>
					    </a>
					    <ul class="list-unstyled ps-0">
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed">
					          <a href="adminmain" class="link-dark rounded" style="text-decoration-line : none;">HOME</a>
					        </button>
					      </li>					    
					    
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
					          Artist Request
					        </button>
					        <div class="collapse" id="home-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				           		 <li><a href="artistInsertRequest" class="link-dark rounded position-relative">등록 요청
				           		 <c:if test="${artistInsertCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistInsertCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artistUpdateRequest" class="link-dark rounded position-relative">수정 요청
				           		 <c:if test="${artistUpdateCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistUpdateCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artistDeleteRequest" class="link-dark rounded position-relative">삭제 요청
				           		 <c:if test="${artistDeleteCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artistDeleteCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed checkcheck" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
					          Art Request
					        </button>
					        <div class="collapse show" id="dashboard-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				           		 <li><a href="artInsertRequest" class="link-dark rounded position-relative">등록 요청
				           		 <c:if test="${artInsertCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artInsertCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artUpdateRequest" class="link-dark rounded position-relative">수정 요청
				           		 <c:if test="${artUpdateCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artUpdateCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
				           		 <li><a href="artDeleteRequest" class="link-dark rounded position-relative checkThis">삭제 요청
				           		 <c:if test="${artDeleteCount != 0 }">
					              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								    ${artDeleteCount}
								  <span class="visually-hidden">unread messages</span></span>
								  </c:if>
					            </a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="border-top my-3"></li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
					          Artist
					        </button>
					        <div class="collapse" id="orders-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					            <li><a href="artistAdminInsert" class="link-dark rounded">등록</a></li>
					            <li><a href="artistAdminEdit" class="link-dark rounded">변경</a></li>
					          </ul>
					        </div>
					      </li>
					      <li class="mb-1">
					        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
					          Art
					        </button>
					        <div class="collapse" id="account-collapse">
					          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					            <li><a href="artAdminInsert" class="link-dark rounded">등록</a></li>
					            <li><a href="artAdminEdit" class="link-dark rounded">변경</a></li>
					          </ul>
					        </div>
					      </li>
					    </ul>
					  </div>
					
					 
					</main>

				  </div>
				  
				  
				  <div class="tab-content cont align-items-center" id="v-pills-tabContent" style="padding-left : 50px">
				    <div class="tab-pane fade show active deletecont align-items-center" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" style="margin : 0 auto;">
 				    	<div style="width : 820px; " class="text-center">
 				    	
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="background-color: #f4f4f4;">
							
							  <input type="radio" class="btn-check" name="btnradio" id="all" autocomplete="off" checked>
							  <label class="btn btn-outline-secondary" for="all" style="width: 120px;">전체</label>
							  
							  <input type="radio" class="btn-check" name="btnradio" id="notYet" autocomplete="off">
							  <label class="btn btn-outline-secondary" for="notYet" style="width: 120px;">미처리</label>
							
							  <input type="radio" class="btn-check" name="btnradio" id="ok" autocomplete="off">
							  <label class="btn btn-outline-secondary" for="ok" style="width: 120px;">처리완료</label>
							  
							  <input type="radio" class="btn-check" name="btnradio" id="nope" autocomplete="off">
							  <label class="btn btn-outline-secondary" for="nope" style="width: 120px;">반려</label>
								  
							</div> 				    	
							 <br><br><br>    	
 
<div id="allResultView">
<div class="row row-cols-1 row-cols-md-3 g-4">
	<c:if test="${artDeleteAll == '[]' }">
		<div class="col" align="center">
			<h5 style="color: gray;">요청이 없습니다.</h5>
		</div>
	</c:if>
    
<c:if test="${artDeleteAll != '[]' }">
<c:forEach items="${artDeleteAll }" var="artDeleteAll">
  <div class="col">
    <div class="card h-100">
    
    <c:if test="${artDeleteAll.artInfo.artinfoImg !=null }">
      <img src="${artDeleteAll.artInfo.artinfoImg }" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    <c:if test="${artDeleteAll.artInfo.artinfoImg ==null }">
      <img src="${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    
      <div class="card-body border-top my-3">
        <h5 class="card-title">${artDeleteAll.artInfo.artinfoName }</h5>
        <br>
        <c:set var="result" value="${artDeleteAll.result }"/>
        <c:choose>
        <c:when test="${result eq '2'.charAt(0) }">
    	    <p class="card-text" style="color:blue">반려된 요청사항입니다.</p>
        </c:when>
        <c:when test="${result eq '1'.charAt(0) }">
    	    <p class="card-text">처리된 요청사항입니다.</p>
        </c:when>
        <c:when test="${result eq '0'.charAt(0) }">
    	    <p class="card-text" style="color:red">아직 처리되지 않은 <br> 요청사항입니다.</p>
        </c:when>
        </c:choose>
      </div>
      <form action="artDelete" method="post">
      <input type="hidden" name="delete_num" value="${artDeleteAll.delete_num }">
      <input type="hidden" name="result" value="${artDeleteAll.result }">
      <button class="btn artDeleteBtn" style="width : 100%; padding : 0">
     <div class="card-footer artDelete">
         <small class="text-muted">Artistar</small>
      </div>
      </button>
      </form>
    </div>
  </div> 
</c:forEach>
</c:if>
</div>
</div>

<div id="notYetResultView" style="display:none">
<div class="row row-cols-1 row-cols-md-3 g-4">
	<c:if test="${artDeleteNotYet == '[]' }">
		<div class="col" align="center">
			<h5 style="color: gray;">요청이 없습니다.</h5>
		</div>
	</c:if>
    
<c:if test="${artDeleteNotYet != '[]' }">
<c:forEach items="${artDeleteNotYet }" var="artDeleteNotYet">
  <div class="col">
    <div class="card h-100">
    
    <c:if test="${artDeleteNotYet.artInfo.artinfoImg !=null }">
      <img src="${artDeleteNotYet.artInfo.artinfoImg }" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    <c:if test="${artDeleteNotYet.artInfo.artinfoImg ==null }">
      <img src="${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    
      <div class="card-body border-top my-3">
        <h5 class="card-title">${artDeleteNotYet.artInfo.artinfoName }</h5>
        <br>
    	    <p class="card-text" style="color:red">아직 처리되지 않은 <br> 요청사항입니다.</p>
      </div>
      <form action="artDelete" method="post">
      <input type="hidden" name="delete_num" value="${artDeleteNotYet.delete_num }">
      <input type="hidden" name="result" value="${artDeleteNotYet.result }">
      <button class="btn artDeleteBtn" style="width : 100%; padding : 0">
     <div class="card-footer artDelete">
         <small class="text-muted">Artistar</small>
      </div>
      </button>
      </form>
    </div>
  </div> 
</c:forEach>
</c:if>
</div>
</div>

<div id="okResultView" style="display:none">
<div class="row row-cols-1 row-cols-md-3 g-4">
	<c:if test="${artDeleteOk == '[]' }">
		<div class="col" align="center">
			<h5 style="color: gray;">요청이 없습니다.</h5>
		</div>
	</c:if>
    
<c:if test="${artDeleteOk != '[]' }">
<c:forEach items="${artDeleteOk }" var="artDeleteOk">
  <div class="col">
    <div class="card h-100">
    
    <c:if test="${artDeleteOk.artInfo.artinfoImg !=null }">
      <img src="${artDeleteOk.artInfo.artinfoImg }" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    <c:if test="${artDeleteOk.artInfo.artinfoImg ==null }">
      <img src="${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    
      <div class="card-body border-top my-3">
        <h5 class="card-title">${artDeleteOk.artInfo.artinfoName }</h5>
        <br>
    	    <p class="card-text">처리된 요청사항입니다.</p>
      </div>
      <form action="artDelete" method="post">
      <input type="hidden" name="delete_num" value="${artDeleteOk.delete_num }">
      <input type="hidden" name="result" value="${artDeleteOk.result }">
      <button class="btn artDeleteBtn" style="width : 100%; padding : 0">
     <div class="card-footer artDelete">
         <small class="text-muted">Artistar</small>
      </div>
      </button>
      </form>
    </div>
  </div> 
</c:forEach>
</c:if>
</div>
</div>

<div id="nopeResultView" style="display:none">
<div class="row row-cols-1 row-cols-md-3 g-4">
	<c:if test="${artDeleteNope == '[]' }">
		<div class="col" align="center">
			<h5 style="color: gray;">요청이 없습니다.</h5>
		</div>
	</c:if>
    
<c:if test="${artDeleteNope != '[]' }">
<c:forEach items="${artDeleteNope }" var="artDeleteNope">
  <div class="col">
    <div class="card h-100">
    
    <c:if test="${artDeleteNope.artInfo.artinfoImg !=null }">
      <img src="${artDeleteNope.artInfo.artinfoImg }" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    <c:if test="${artDeleteNope.artInfo.artinfoImg ==null }">
      <img src="${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png" class="card-img-top" onerror="this.src='${pageContext.request.contextPath}/resources/image/admin/artist/art_default.png'" style="padding : 10px; height : 255px;">
    </c:if>
    
      <div class="card-body border-top my-3">
        <h5 class="card-title">${artDeleteNope.artInfo.artinfoName }</h5>
        <br>
    	    <p class="card-text" style="color:blue">반려된 요청사항입니다.</p>
      </div>
      <form action="artDelete" method="post">
      <input type="hidden" name="delete_num" value="${artDeleteNope.delete_num }">
      <input type="hidden" name="result" value="${artDeleteNope.result }">
      <button class="btn artDeleteBtn" style="width : 100%; padding : 0">
     <div class="card-footer artDelete">
         <small class="text-muted">Artistar</small>
      </div>
      </button>
      </form>
    </div>
  </div> 
</c:forEach>
</c:if>
</div>
</div>

				    </div> 
				    
				    </div>
				  </div>
				</div>
			
			</div>
		</div>
		</div>
		<br>
		<br>
	</section>
</body>
</html>