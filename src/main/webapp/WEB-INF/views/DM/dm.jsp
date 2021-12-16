<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/index/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/story.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- JS -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- icon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/tab-icon1.ico"
	type="image/x-icon" sizes="16x16">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/storytest.css">
<title>DM</title>
<style>
.mainDm {
	position: relative;
	background-color: #f3efef;
	width: 100%;
	height: 76rem;
}

.DmColor {
	position: relative;
	background-color: #f3efef;
	width: 100%;
	height: 100px;
}

.Dm {
	background-color: white;;
	margin: auto;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border: 1px solid balck;
	width: 50%;
	height: auto;
	position: absolute;
	display: flex;
	flex-direction: row;
	/* align-content: stretch; */
}

#idDm {
	border-top: 1px solid black;
	border-left: 1px solid black;
	border-bottom: 1px solid black;
	/* justify-content : center; */
	/* border: 1px solid black; */
	width: 35%;
}

#messageDM {
	border: 1px solid black;
	width: 65%;
}

#myId {
	display: flex;
	border-bottom: 1px solid black;
	width: 100%;
	padding: 10px;
}

#profile {
	display: flex;
	flex: 1;
}

#chatMain {
	display: flex;
	flex: 1;
	flex-direction: column;
}

#check {
	display: flex;
	flex: 1;
}

#chatNickname {
	display: flex;
	flex: 1;
}

#chatContent {
	display: flex;
	flex: 1;
}

#chat {
	border-bottom: 1px solid black;
	width: 100%;
}

p {
	text-align: center;
	color: black;
}

#dmchatImg {
	
}

#dmchatcontent {
	padding: 20px;
}

#dmChat {
	width: 100%;
	display: flex;
	padding: 10px;
}

#dmChatMy {
	width: 100%;
	display: flex;
	padding: 10px;
	float: right;
	justify-content: flex-end;
}

textarea:focus, input:focus {
	outline: none;
}
</style>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 78px"></section>
	<div class="mainDm">
		<div class="DmColor"></div>
		<div class="Dm">
			<div id="idDm">
				<div style="border-bottom: 1px solid black; height: 41px;">
					<p>${sessionid }
						<button>메세지 보내기</button>
					</p>
				</div>
				<c:forEach var="vo" items="${volist }">
					<%-- <c:out value="${a['test12'] }"></c:out> --%>
					<%-- <c:out value="${vo.dm_room}"></c:out> --%>



					<a id="myId" href="dmChat?dm_room=${vo.dm_room} "
						style="text-decoration: none;"> <c:if
							test="${vo.id != sessionid}">
							<div id="profile">
								<img src="${a[vo.id]}"
									style="float: center; width: 56px; height: 56px; border-radius: 50%; overflow: hidden;">
								<%-- <input id="dmroomnum" type="text" value="${vo.dm_room}" />  --%>
							</div>
							<div id="chatMain">
								<div id="chatNickname">
									<%-- <input type="text" value="${vo.id}" readonly
										style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"> --%>
									<p>${vo.id}</p>
								</div>
								<div id="chatContent">
									<%-- <input type="text" value="${vo.dm_chat}" readonly
										style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"> --%>
									<p>${vo.dm_chat}</p>

								</div>
							</div>
							<div id="check">
								<div id="noread">
									<c:if test="${vo.dm_check == 0}">
										<div
											style="height: 8px; width: 8px; background-color: #0095f6">
										</div>
									</c:if>
								</div>
							</div>
						</c:if> <c:if test="${vo.id == sessionid}">
							<div id="profile">
								<img src="${a[vo.dm_target_id]}"
									style="float: center; width: 56px; height: 56px; border-radius: 50%; overflow: hidden;">
							</div>
							<div id="chatMain">
								<div id="chatNickname">
									<%-- <input type="text" value="${vo.dm_target_id}" readonly
										style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"> --%>
									<p>${vo.dm_target_id}</p>
								</div>
								<div id="chatContent">
									<%-- <input type="text" value="${vo.dm_chat}" readonly
										style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"> --%>
									<p>${vo.dm_chat}</p>
								</div>
							</div>
							<div id="check">
								<div id="noread">
									<c:if test="${vo.dm_check == 0}">
										<div
											style="height: 8px; width: 8px; background-color: #0095f6">
										</div>
									</c:if>
								</div>
							</div>
						</c:if>
					</a>
				</c:forEach>
			</div>

			<!-- Dm 채팅 부분 -->
			<div id="messageDM">

				<c:forEach var="dmchatcontent" items="${dmchatcontent }" begin="0"
					end="0">
					<c:if test="${dmchatcontent.id != sessionid}">

						<div id="chat">
							<p >${dmchatcontent.id}작가님</p>
							<input type="hidden" id="Uname" value="${dmchatcontent.id}"/>
						</div>
					</c:if>

					<c:if test="${dmchatcontent.id == sessionid}">
						<div id="chat">
							<p>${dmchatcontent.dm_target_id}작가님</p>
							<input type="hidden" id="Uname" value="${dmchatcontent.dm_target_id}"/>
						</div>
					</c:if>
				</c:forEach>

				<c:forEach var="dmchatcontent" items="${dmchatcontent }">
					<c:if test="${dmchatcontent.id != sessionid}">
						<div id="dmChat">
							<div id="dmchatImg">
								<img src="${a[dmchatcontent.id]}"
									style="float: center; width: 40px; height: 40px; border-radius: 50%; overflow: hidden;">

							</div>
							<div id="dmchatcontent">
								<p
									style="width: 200px; background-color: white; border: 2px solid black; padding: 0.5rem; line-height: 1rem; border-radius: 0.5rem;">${dmchatcontent.dm_chat }</p>
							</div>
						</div>
					</c:if>
					<c:if test="${dmchatcontent.id == sessionid}">
						<div id="dmChatMy">
							<div id="dmchatImg">
								<img src="${a[dmchatcontent.dm_target_id]}"
									style="float: center; width: 40px; height: 40px; border-radius: 50%; overflow: hidden;">
							</div>
							<div id="dmchatcontent">
								<p
									style="width: 200px; background-color: white; border: 2px solid black; padding: 0.5rem; line-height: 1rem; border-radius: 0.5rem;">${dmchatcontent.dm_chat }</p>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<center>
					<div
						style="text-align: center; display: flex; width: 80%; background-color: white; border: 2px solid black; padding: 0.5rem; line-height: 1rem; border-radius: 0.5rem;">
						<div style="width: 90%">
							<textarea id=output placeholder="메시지 입력..."
								style="width: 90%; border-color: white; resize: none;"></textarea>

						</div>
						<div style="width: 10%">
							<button onclick="submit()">전송</button>
						</div>
					</div>
				</center>
				<!-- 여기까지 채팅 보내기 -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
	const a = window.location.href;
	
	var b = window.location.search;
	
	var getType = getParam("dm_room");
	var svalue = 0;
    // ie 호환성을위해 변경
    function getParam(name)
    {
        var curr_url = location.search.substr(location.search.indexOf("?") + 1);
        svalue = "";
        curr_url = curr_url.split("&");
        for (var i = 0; i < curr_url.length; i++)
        {
            temp = curr_url[i].split("=");
            if ([temp[0]] == name) { svalue = temp[1]; }
        }
        return svalue;
    }
    
    
	function submit() {
		var text = document.getElementById("output").value;
		var roomNum = getType;
		var uname = document.getElementById("Uname").value;
		
		console.log(text,roomNum);
		console.log(uname);
		
		sendMessage(text, roomNum,uname);
	}
	
	function sendMessage(text, roomNum, uname){
		$.post("dmSend", 
	            {
	                "dm_chat" : text,
	                "dm_room" : roomNum,
	                "dm_target_id" : uname
	            }, 
	            function(jsonResult){
	                alert(jsonResult);
	            }, 'json')
	            .done(function(jsonResult) {
	                console.log(jsonResult);
	            })
	            .fail(function(jsonResult) {
	                console.log(jsonResult);
	            });            
		}
</script>
</body>
</html>