<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>signin</title>

</head>
<body>
<section id="content">
 <form role="form" method="post" autocomplete="off">
  <div class="input_area">
   <label for="id">아이디</label>
   <input type="text" id="id" name="id" required="required" />      
  </div>
  
  <div class="input_area">
   <label for="pw">패스워드</label>
   <input type="password" id="pw" name="pw" required="required" />      
  </div>
       
  <button type="submit" id="signin_btn" name="signin_btn">로그인</button>
  
    <c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
            
          
  <c:if test="${msg == false}">
   <p style="color:#f00;">로그인에 실패했습니다.</p>
  </c:if>
  
 </form>   
</section>
</body>
</html>