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
body {
	background-color: white;
}

.mainDm {
	position: relative;
	width: 100%;
	height: 76rem;
	
}

.DmColor {
	position: relative;
	background-color: white;
	width: 100%;
	height: 100px;
}

.Dm {
	background-color: white;
	margin: auto;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	border: 3px solid balck;
	width: 50%;
	height: auto;
	position: absolute;
	display: flex;
	flex-direction: row;
	border-top-left-radius: 2em;
    border-bottom-left-radius: 2em;
    border-top-right-radius: 2em;
	/* align-content: stretch; */
}

#idDm {
	border-top: 3px solid black;
	border-left: 3px solid black;
	border-bottom: 3px solid black;
	/* justify-content : center; */
	/* border: 1px solid black; */
	width: 35%;
	overflow: scroll;
	overflow-x: hidden;
	border-top-left-radius: 2em;
    border-bottom-left-radius: 2em;
}

#messageDM {
	border-left: 1px solid black;
	border-top: 3px solid black;
	border-right: 3px solid black;
	border-bottom: 3px solid black;
	width: 65%;
	
	position: relative;
	height: 100%;
	border-top-right-radius: 2em;
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

#messageBox {
	text-align: center;
	display: flex;
	width: 100%;
	background-color: white;
	border: 2px solid black;
	padding: 0.5rem;
	line-height: 1rem;
	border-radius: 0.5rem;
}

 .modal_wrapper {
     display: none; 
     position: center;
    /*  z-index: 1;
     right: 0;
     bottom: 0; */
     width: 400px;
     height: 350px;
     overflow: hidden;
   }
   .modal_content {
     background-color: #fefefe;
     padding: 20px 10px 50px 30px;
     border: 1px solid #888;
     width: 100%;
     height: 100%;
     box-sizing: border-box;
   }
   .modal_content > a{
      float:center;
   }
   .modal_content > form > label{
      font-size: 1rem;
      border-color: #DEE0E1;
      display: block;
      width: 300px;
      margin-bottom: 1rem;
      margin-top: 1rem;
   }
 #btn_send{
      margin-top: 1rem;
      padding: 10px;
      display: block;
      width: 300px;
      background-color: #A4A4A4;
      border: none;
      text-align: center;
   }
   #btn_send:hover{
      cursor: pointer;
   }

</style>
</head>
<body>
	<%@ include file="../index/header.jsp"%>
	<section style="margin-top: 100px"></section>




	<div class="mainDm">
		<div class="DmColor"></div>
		<div class="Dm">
			<div id="idDm">
				<div style="border-bottom: 1px solid black; height: 41px; ">
					<p>${sessionid }
						<button id="sendBtn" style="background-color:transparent; border: none;">
							<img src="${pageContext.request.contextPath}/resources/image/member/login/send.png" alt="send" style="width: 20px; height: 20px; ">
						</button>
					</p>

					<div id="modal_wrapper" class="modal_wrapper">
						<!-- Modal content -->
						<div class="modal-content">
						<button type="button" id="btn-close" class="btn-close" aria-label="Close" style="float:right;" ></button>
							<p style="text-align: center;">
								<span style="font-size: 14pt;"><b> <span
										style="font-size: 24pt;">새로운 메세지</span>
								</b> </span>
							</p>

							<p style="text-align: center; line-height: 1.5;">
								<br /> <label>받는 사람 : </label> <input type="text"
									id="findUserModal" placeholder="아이디 입력" /> </br> </br> <label>보낼
									내용 : </label> <input type="text" id="sendMessageModal"
									placeholder="내용 입력" />
							</p>
							<p>
								<br />
							</p>
							<div style="display: flex;">
								<!-- <div
									style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px; width: 50%;  border: 1px solid black;"
									onClick="close_pop();">
									<span class="pop_bt" style="font-size: 13pt;"> 닫기 </span>
								</div> -->
								  <div style="width: 100%"><center><button id="btn_send" class="btn_send">발신</button></center></div>
							</div>
						</div>

					</div>


				</div>
				<c:forEach var="vo" items="${volist }">
					<%-- <c:out value="${a['test12'] }"></c:out> --%>
					<%-- <c:out value="${vo.dm_room}"></c:out> --%>

					<a id="myId" href="dmChat?dm_room=${vo.dm_room} "
						style="text-decoration: none;"> 
						<c:if test="${vo.id != sessionid}">
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
				<c:forEach var="dmchatcontent" items="${dmchatcontent }" begin="0" end="0">
					<c:if test="${dmchatcontent.id != sessionid}">

						<div id="chat">
							<p>${dmchatcontent.id}작가님</p>
							<input type="hidden" id="Uname" value="${dmchatcontent.id}" />
						</div>
					</c:if>

					<c:if test="${dmchatcontent.id == sessionid}">
						<div id="chat">
							<p>${dmchatcontent.dm_target_id}작가님</p>
							<input type="hidden" id="Uname"
								value="${dmchatcontent.dm_target_id}" />
						</div>
					</c:if>
				</c:forEach>

				
				<div id="dmScroll" style="overflow: scroll; overflow-x: hidden; height: 90%;">
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
							<div id="dmchatcontent">
								<p
									style="width: 200px; background-color: white; border: 2px solid black; padding: 0.5rem; line-height: 1rem; border-radius: 0.5rem;">${dmchatcontent.dm_chat }</p>
							</div>
						</div>
					</c:if>
				</c:forEach>
				</div>

				<!-- style="position:absolute; bottom:0px;" -->
				<div style="position: absolute; bottom: 0px; width: 100%;">
				<div id="messageBox" style="padding-top: 10px;" >
					<div style="width: 100%; " >
						<textarea id="output" placeholder="메시지 입력..."
							style="width: 90%; border-color: white; resize: none;"></textarea>

					</div>
					<div style="width: 10%">
						<button id="sendBtn" onclick="submit()" style="background-color:transparent; border: none;">
							<img src="${pageContext.request.contextPath}/resources/image/member/login/send.png" alt="send" style="width: 30px; height: 30px; ">
						</button>
					</div>
				</div>
				</div>
				<!-- 여기까지 채팅 보내기 -->

			</div>
		</div>
	</div>

	<script type="text/javascript">
	/* setTimeout(function(){
		location.reload();
		},3000); // 3000밀리초 = 3초 */
	$('#sendBtn').on('click', function(){
		console.log("modal open");
		$('#modal_wrapper').show();
	});
	
	$('#btn-close').on('click', function(){
        $('#modal_wrapper').hide();
   });
   
	$('#btn_send').on('click', function(){
       var sendMessageModal = document.getElementById("sendMessageModal").value;
       var findUserModal = document.getElementById("findUserModal").value;
       
       makeRoom(sendMessageModal, findUserModal);
       $('#myModal').hide();
       window.location.reload();
       
  });
  
  function makeRoom(sendMessageModal, findUserModal) {
		$.post("mkroom", {
			"dm_target_id" : findUserModal,
			"dm_chat" : sendMessageModal
		}, function(jsonResult) {
			alert(jsonResult);
		}, 'json').done(function(jsonResult) {
			console.log(jsonResult);
		}).fail(function(jsonResult) {
			console.log(jsonResult);
		});
	}
  


		$('#dmScroll').scrollTop($('#dmScroll')[0].scrollHeight);
		var objDiv = document.getElementById("messageBox");
		objDiv.scrollTop = objDiv.scrollHeight;
		
		const a = window.location.href;

		var b = window.location.search;

		var getType = getParam("dm_room");
		var svalue = 0;
		// ie 호환성을위해 변경
		function getParam(name) {
			var curr_url = location.search
					.substr(location.search.indexOf("?") + 1);
			svalue = "";
			curr_url = curr_url.split("&");
			for (var i = 0; i < curr_url.length; i++) {
				temp = curr_url[i].split("=");
				if ([ temp[0] ] == name) {
					svalue = temp[1];
				}
			}
			return svalue;
		}

		function submit() {
			var text = document.getElementById("output").value;
			var roomNum = getType;
			var uname = document.getElementById("Uname").value;

			console.log(text, roomNum);
			console.log(uname);

			sendMessage(text, roomNum, uname);
			document.getElementById("output").value='';
			window.location.reload();
		}

		function sendMessage(text, roomNum, uname) {
			$.post("dmSend", {
				"dm_chat" : text,
				"dm_room" : roomNum,
				"dm_target_id" : uname
			}, function(jsonResult) {
				alert(jsonResult);
			}, 'json').done(function(jsonResult) {
				console.log(jsonResult);
			}).fail(function(jsonResult) {
				console.log(jsonResult);
			});
		}
	</script>
</body>
</html>