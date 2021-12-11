$(function(){
		console.log("실행된건가?????");
		var artistNum=$("#artistNum").val();
		console.log(artistNum);
		$.ajax({
		url : 'artContent.ajax',
		data : {
			artistNum : artistNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log("followCheck"+data.followCheck);
			var html="";
			if(data.followCheck==0){
				html += "<div style='display: inline-block' id='follow'>";
				html += "<a role='button' onclick='followProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #000000;' class='fas fa-user-plus'></i>";
				html += "</a>";
				html += "</div>";
			} else if(data.followCheck==1){
				html += "<div style='display: inline-block' id='unfollow'>";
				html += "<a role='button' onclick='unfollowProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #F5605C;' class='fas fa-user-check'></i>";
				html += "</a>";
				html += "</div>";				
			}
			$('#followImg').append(html);
			
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
		
});

function followProcess(artistNum) {
	console.log("체크체크");
	$.ajax({
		url : 'artistFollow.ajax',
		data : {
			artistNum : artistNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
				$('#followImg').empty();
				html += "<div style='display: inline-block' id='unfollow'>";
				html += "<a role='button' onclick='unfollowProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #F5605C;' class='fas fa-user-check'></i>";
				html += "</a>";
				html += "</div>";	
			}
			$('#followImg').append(html);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}
function unfollowProcess(artistNum) {
	console.log("체크체크");
	$.ajax({
		url : 'artistUnfollow.ajax',
		data : {
			artistNum : artistNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
				$('#followImg').empty();
				html += "<div style='display: inline-block' id='follow'>";
				html += "<a role='button' onclick='followProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #000000;' class='fas fa-user-plus'></i>";
				html += "</a>";
				html += "</div>";
			}
			$('#followImg').append(html);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
			
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}

function heartProcess(artinfoNum) {
	$.ajax({
		url : 'artHeart.ajax',
		data : {
			artinfoNum : artinfoNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			var likeCount="";
			if(data.result=="success") {
				$('#content_heart').empty();
				html += "<a role='button' onclick='heartCancelProcess("+artinfoNum+")'> <i style='color: red; font-size: 30px;' class='fas fa-heart'></i>";
				html += "</a>";
				likeCount=data.likeCount;
			}
			$('#content_heart').append(html);
			$('#likeCount').empty();
			$('#likeCount').append(likeCount);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}

function heartCancelProcess(artinfoNum) {
	$.ajax({
		url : 'artHeartCancel.ajax',
		data : {
			artinfoNum : artinfoNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			var likeCount="";
			if(data.result=="success") {
				$('#content_heart').empty();
				html += "<a role='button' onclick='heartProcess("+artinfoNum+")'> <i style='font-size: 30px;' class='far fa-heart'></i>";
				html += "</a>";
				likeCount=data.likeCount;
			}
			$('#content_heart').append(html);
			$('#likeCount').empty();
			$('#likeCount').append(likeCount);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}

function scrapProcess(artinfoNum) {
	$.ajax({
		url : 'artScrap.ajax',
		data : {
			artinfoNum : artinfoNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
				$('#content_scrap').empty();
				html += "<a role='button' onclick='scrapCancelProcess("+artinfoNum+")' style='outline: 0; border: 0;'> <i style='font-size: 30px;' class='fas fa-bookmark'></i>";
				html += "</a>";
			}
			$('#content_scrap').append(html);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}

function scrapCancelProcess(artinfoNum) {
	$.ajax({
		url : 'artScrapCancel.ajax',
		data : {
			artinfoNum : artinfoNum
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
				$('#content_scrap').empty();
				html += "<a role='button' onclick='scrapProcess("+artinfoNum+")'>  <i style='font-size: 30px;' class='far fa-bookmark'></i>";
				html += "</a>";
			}
			$('#content_scrap').append(html);
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}


function co_comment(art_num, art_comment_group, current) {
	console.log("art_num : " + art_num);
	console.log("답답글달기 눌림");
	console.log("art_comment_group : " + art_comment_group);
	console.log("current : " + current);
	var html = "";
	html += "<label for='reply1' class='col-form-label'><i style='font-size: 25px;' class='far fa-comment-dots'></i></label>";
	html += "&nbsp;&nbsp;";
	html += "<input id='reply1' type='text' style='width: 70%;' placeholder='댓글입력'/>";
	html += "&nbsp;&nbsp;";
	html += "<a role='button' onclick='coreplyf("+art_num+","+art_comment_group+");'>달기</a>";
		if($('#depth' + current).is(':empty')) {
			
			$('#depth' + current).append(html);
		}else{
			$('#depth' + current).empty();
		}
}
	
function replyf(art_num) {
	console.log("여기로 들어왔어??");
	var artComment = $("#reply").val();
	var sessionId = $("#sessionId").val();
	$.ajax({
		url : 'artComment.ajax',
		data : {
			artComment : artComment,
			artinfoNum : art_num
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
		        $("#reply_body").empty();
				$("#reply").val("");
				for(var i =0; i < data.artInfoComment.length;i++) {
					if(data.artInfoComment[i].art_comment_class == "0") {
						console.log("0이여~");
						html += "<img src='resources/image/"+data.artInfoComment[i].member_img+"' class='rounded' width= 30px height= 30px onerror='this.src=\"resources/image/myartgallery/default_user.png\"'/>";
						html += "&nbsp;";
						html += "<a style='font-weight: bold; color: black;' href='#사용자정보보기'>"+data.artInfoComment[i].id+"</a>";
						html += "&nbsp;";
						html += data.artInfoComment[i].art_comment+"<br/>";
						html += "<div style='margin-left : 40px;'>";
						html += "<a role='button' onclick='co_comment("+data.artInfoComment[i].art_num+","+data.artInfoComment[i].art_comment_group+","+ i+")'><span style='font-size: 10px; margin-right: 10px;'>답글달기</span></a>";
						if(data.artInfoComment[i].id=="song"){
						/*if(data[i].id == sessionId){*/
						html += "<a role='button' onclick='popup()'><span style='font-size: 10px; color : red'>댓글삭제</span></a>";
						}
						html += "</div>";
						html += "<div id='depth"+i+"' style='margin-left : 40px;'></div>";
						html += "<br>";
					}
					else if(data.artInfoComment[i].art_comment_class == "1") {
						console.log("1이여~");
						html += "<img src='resources/image/"+data.artInfoComment[i].member_img+"' class='rounded' style='margin-left: 30px;' width= 30px height= 30px onerror='this.src=\"resources/image/myartgallery/default_user.png\"' style='margin-left:30px'/>";
						html += "&nbsp;";
						html += "<a style='font-weight: bold; color: black;' href='#사용자정보보기'>"+data.artInfoComment[i].id+"</a>";
						html += "&nbsp;";
						html += "<p style='color: #929E9E; display: inline-block; margin-bottom  : 0px'>@답글달 아이디</p>";
						html += "&nbsp;";
						html += data.artInfoComment[i].art_comment;
						html += "<div style='margin-left : 70px; margin-bottom : 20px;'>";
						html += "<a role='button' onclick='co_comment("+data.artInfoComment[i].art_num+","+data.artInfoComment[i].art_comment_group+","+ i+")'><span style='font-size: 10px; margin-right: 10px;'>답글달기</span></a>";
						if(data.artInfoComment[i].id=="song"){
						/*if(data[i].id == sessionId){*/
						html += "<a role='button' onclick='popup()'><span style='font-size: 10px; color : red'>댓글삭제</span></a>";
						}
						html += "</div>";
						html += "<div id='depth"+i+"' style='margin-left : 70px;'></div>";
					}
				}
					
				$('#reply_body').append(html);	
				
		       
			}
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
};		

function coreplyf(art_num, art_comment_group) {
	console.log("여기로 들어왔어?");
	var artComment = $("#reply1").val();
	console.log("artComment : " + artComment)
	var sessionId = $("#sessionId").val();
	$.ajax({
		url : 'artCoComment.ajax',
		data : {
			artComment : artComment,
			artCommentGroup : art_comment_group,
			artinfoNum : art_num
		},
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			console.log(data);
			var html="";
			if(data.result=="success") {
		        $("#reply_body").empty();
				$("#reply1").val("");
				for(var i =0; i < data.artInfoComment.length;i++) {
					if(data.artInfoComment[i].art_comment_class == "0") {
						console.log("0이여~");
						html += "<img src='resources/image/"+data.artInfoComment[i].member_img+"' class='rounded' width= 30px height= 30px onerror='this.src=\"resources/image/myartgallery/default_user.png\"'/>";
						html += "&nbsp;";
						html += "<a style='font-weight: bold; color: black;' href='#사용자정보보기'>"+data.artInfoComment[i].id+"</a>";
						html += "&nbsp;";
						html += data.artInfoComment[i].art_comment+"<br/>";
						html += "<div style='margin-left : 40px;'>";
						html += "<a role='button' onclick='co_comment("+data.artInfoComment[i].art_num+","+data.artInfoComment[i].art_comment_group+","+ i+")'><span style='font-size: 10px; margin-right: 10px;'>답글달기</span></a>";
						if(data.artInfoComment[i].id=="song"){
						/*if(data[i].id == sessionId){*/
						html += "<a role='button' onclick='popup()'><span style='font-size: 10px; color : red'>댓글삭제</span></a>";
						}
						html += "</div>";
						html += "<div id='depth"+i+"' style='margin-left : 40px;'></div>";
						html += "<br>";
					}
					else if(data.artInfoComment[i].art_comment_class == "1") {
						console.log("1이여~");
						html += "<img src='resources/image/"+data.artInfoComment[i].member_img+"' class='rounded' style='margin-left: 30px;' width= 30px height= 30px onerror='this.src=\"resources/image/myartgallery/default_user.png\"'/>";
						html += "&nbsp;";
						html += "<a style='font-weight: bold; color: black;' href='#사용자정보보기'>"+data.artInfoComment[i].id+"</a>";
						html += "&nbsp;";
						html += "<p style='color: #929E9E; display: inline-block; margin-bottom  : 0px'>@답글달 아이디</p>";
						html += "&nbsp;";
						html += data.artInfoComment[i].art_comment;
						html += "<div style='margin-left : 70px; margin-bottom : 20px;'>";
						html += "<a role='button' onclick='co_comment("+data.artInfoComment[i].art_num+","+data.artInfoComment[i].art_comment_group+","+ i+")'><span style='font-size: 10px; margin-right: 10px;'>답글달기</span></a>";
						if(data.artInfoComment[i].id=="song"){
						/*if(data[i].id == sessionId){*/
						html += "<a role='button' onclick='popup()'><span style='font-size: 10px; color : red'>댓글삭제</span></a>";
						}
						html += "</div>";
						html += "<div id='depth"+i+"' style='margin-left : 70px;'></div>";
					}
				}
					
				$('#reply_body').append(html);	
				
		       
			}
			$('#artContent').on('hidden.bs.modal', function(){
				console.log("닫힘");
				location.reload();
			})
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
};	