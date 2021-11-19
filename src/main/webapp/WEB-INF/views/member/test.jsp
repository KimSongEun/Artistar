<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<ul>
<c:if test="${member == null}">
 <li>
  <a href="/artistar/signin">로그인</a>
 </li>
 <li>
  <a href="/member/signup">회원가입</a>
 </li>
</c:if>
<c:if test="${member != null}">
 <li>
  ${member.id}
  ${member.pw}
  ${member.uname}
  ${member.nickname}
 </li>
 <li>
  <a href="/artistar02/signout">로그아웃</a>
 </li>
</c:if>
</ul>
</body>
</html>
