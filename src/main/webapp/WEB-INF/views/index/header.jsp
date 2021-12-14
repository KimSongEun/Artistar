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
	    <a class="navbar-brand" href="#">artistar logo</a>
	 <div class="nav-search">
	    <form class="d-flex collapse">
	      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-sm btn-outline-secondary" type="submit"><img src="${pageContext.request.contextPath}/resources/image/index/header/searchblack.png" width="25px"/></button>
	    </form>
	 </div>
	 <div class="d-flex nav-menu" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="javascript:fn_movePage('#');"><img src="${pageContext.request.contextPath}/resources/image/index/header/headerhome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/index/header/plushome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/index/header/chathome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="artistmain"><img src="${pageContext.request.contextPath}/resources/image/index/header/arthome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/index/header/alarmhome.png" width="25px"/></a>
        </li>
      	<li class="nav-item dropdown">
         	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="${pageContext.request.contextPath}/resources/image/index/header/userhome.png" width="25px"/>
          	</a>
          <c:if test="${fn:contains(member.kind, 'M')}">
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="admin/adminmain"><i class="fas fa-cogs" style="width: 30px;"></i>관리자 페이지</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
			<c:if test="${fn:contains(member.kind, 'U')}">
				 <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="#"><i class="far fa-user-circle" style="width: 30px;"></i>내 프로필</a></li>
	            <li><a class="dropdown-item" href="#"><i class="fas fa-key" style="width: 30px;"></i>비밀번호 변경</a></li>
	            <li><a class="dropdown-item" href="#"><i class="fas fa-cogs" style="width: 30px;"></i>설정</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
          	<c:if test="${fn:contains(member.kind, 'A')}">
				 <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <li><a class="dropdown-item" href="#"><i class="far fa-user-circle" style="width: 30px;"></i>내 프로필</a></li>
	            <li><a class="dropdown-item" href="#"><i class="fas fa-key" style="width: 30px;"></i>비밀번호 변경</a></li>
	            <li><a class="dropdown-item" href="#"><i class="fas fa-cogs" style="width: 30px;"></i>설정</a></li>
	            <div class="dropdown-divider"></div>
	            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
	          </ul>
			</c:if>
        </li>
      </ul>
    </div>
</div>
</nav>
</div>
</div>

</body>
</html>