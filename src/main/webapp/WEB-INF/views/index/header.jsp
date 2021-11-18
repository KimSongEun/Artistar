<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	      <button class="btn btn-sm btn-outline-secondary" type="submit"><img src="${pageContext.request.contextPath}/resources/image/searchblack.png" width="25px"/></button>
	    </form>
	 </div>
	 <div class="d-flex nav-menu" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="javascript:fn_movePage('#');"><img src="${pageContext.request.contextPath}/resources/image/headerhome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/plushome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/chathome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/arthome.png" width="25px"/></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/image/alarmhome.png" width="25px"/></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="${pageContext.request.contextPath}/resources/image/userhome.png" width="25px"/>
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#"><i class="far fa-user-circle" style="width: 30px;"></i>내 프로필</a></li>
            <li><a class="dropdown-item" href="#"><i class="fas fa-key" style="width: 30px;"></i>비밀번호 변경</a></li>
            <li><a class="dropdown-item" href="#"><i class="fas fa-cogs" style="width: 30px;"></i>설정</a></li>
            <div class="dropdown-divider"></div>
            <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt" style="width: 30px;"></i>로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div>
</div>
</nav>
</div>
</div>

</body>
</html>