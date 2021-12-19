<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index/header.js"></script>
<title>Header</title>
</head>
<body>
<div id="nprogress" style="display: none;"></div>
<div align="center" class="fixed-top">
   <div> 
	<nav class="navbar navbar-expand-lg navbar-light d-flex nav-artistar" style="justify-content : space-around">
	  <div class="nav-container container-fluid nav-logo justify-content-sm-around">
	    <a class="navbar-brand" href="${pageContext.request.contextPath}/post/postlist"><img src="${pageContext.request.contextPath}/resources/image/index/header/logo2.png" width="150px" /></a>
	 <div class="nav-search">
	    <form class="d-flex collapse">
	      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-sm btn-outline-secondary" type="submit"><img src="${pageContext.request.contextPath}/resources/image/index/header/searchblack.png" width="25px"/></button>
	    </form>
	 </div>
	 <div class="d-flex nav-menu" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/post/postlist"><img src="${pageContext.request.contextPath}/resources/image/index/header/headerhome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/post/postinsert"><img src="${pageContext.request.contextPath}/resources/image/index/header/plushome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/index/header/chathome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/artistmain"><img src="${pageContext.request.contextPath}/resources/image/index/header/arthome.png" width="25px"/></a>
        </li>
        <c:if test="${alarmCount == null }"> 
	         <li class="nav-item">
	          <a class="nav-link" href="#" class="position-relative" style="display:inline-block"><img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" style="display:inline-block" width="25px"/></a>
	        </li> 
        </c:if> 
        <c:if test="${alarmCount != null || alarmCount == 0}"> 
        <button type="button" id="alarm" class="btn position-relative" style="padding:0" data-bs-toggle="modal" data-bs-target="#alarmModalView">
		<!-- 	<button type="button" id="alarm" class="btn position-relative" style="padding:0" data-bs-toggle="modal" data-target="#alarmModalView"> -->
<!-- 			<button type="button" class="btn position-relative" style="padding:0" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-content="팝오버"> -->
			  <img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" style="display:inline-block" width="25px"/>
			 <c:if test="${alarmCount > 0 }"> 
			  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="newAlarm">
			     ${alarmCount }
			    <span class="visually-hidden">unread messages</span>
			  </span>
			 </c:if> 
			</button>
	        &nbsp;
        </c:if> 
        
<%--		<c:if test="${alarmCount != null }"> 
 		<button class="btn" style="padding:0">
        <a tabindex="0" class="btn position-relative" role="button" style="padding:0" data-bs-container="body" data-bs-toggle="popover" title="Artistar Alarms" data-bs-placement="bottom" data-bs-trigger="focus" aria-describedly="alarmContent" data-bs-target="#alarmContent" data-bs-content="#alarmContent">
		  <img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" style="display:inline-block" width="25px"/>
			  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
			     ${alarmCount }
			    <span class="visually-hidden">unread messages</span>
			  </span>
		</a>
		</button>
		</c:if> 
        &nbsp; --%>
      	<li class="nav-item dropdown">
         	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" width="25px"/>
          	</a>
          <c:if test="${fn:contains(member.kind, 'M')}">
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adminmain"><i class="fas fa-cogs" style="width: 30px;"></i>관리자 페이지</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
			<c:if test="${fn:contains(member.kind, 'U')}">
				 <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypost/${member.id}"><i class="far fa-user-circle" style="width: 30px;"></i>내 프로필</a></li>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pwchange"><i class="fas fa-key" style="width: 30px;"></i>비밀번호 변경</a></li>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/memberupdate"><i class="fas fa-cogs" style="width: 30px;"></i>설정</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
          	<c:if test="${fn:contains(member.kind, 'A')}">
				 <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypost/${member.id}"><i class="far fa-user-circle" style="width: 30px;"></i>내 프로필</a></li>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pwchange"><i class="fas fa-key" style="width: 30px;"></i>비밀번호 변경</a></li>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/memberupdate"><i class="fas fa-cogs" style="width: 30px;"></i>설정</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
        </li>
      </ul>
    </div>
</div>
</nav>
</div>
</div>
	
<div class="modal fade" id="alarmModalView" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content alarmModal">
		<!-- 모달 내용 -->
    </div>
  </div>
</div>

</body>
</html>