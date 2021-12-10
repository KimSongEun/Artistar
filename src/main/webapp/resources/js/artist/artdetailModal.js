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
		console.log("답글달기 눌림");
		var html = "";
		html += "<br>"
		html += "<label for='reply1' class='col-form-label'><i style='font-size: 25px;' class='far fa-comment-dots'></i></label>";
		html += "&nbsp;&nbsp;";
		html += "<input id='reply1' type='text' style='width: 70%;' placeholder='댓글입력'/>";
		html += "&nbsp;&nbsp;";
		html += "<a role='button' onclick='replyf("+art_num+","+art_comment_group+");'>달기</a>";
			if($('#depth' + current).is(':empty')) {
				
				$('#depth' + current).append(html);
			}else{
				$('#depth' + current).empty();
			}
	}
function coco_comment(art_num, art_comment_group, current) {
	console.log("답답글달기 눌림");
	var html = "";
	html += "<label for='reply1' class='col-form-label'><i style='font-size: 25px;' class='far fa-comment-dots'></i></label>";
	html += "&nbsp;&nbsp;";
	html += "<input id='reply1' type='text' style='width: 70%;' placeholder='댓글입력'/>";
	html += "&nbsp;&nbsp;";
	html += "<a role='button' onclick='replyf("+art_num+","+art_comment_group+");'>달기</a>";
		if($('#depth' + current).is(':empty')) {
			
			$('#depth' + current).append(html);
		}else{
			$('#depth' + current).empty();
		}
}
	
	
function replyf(art_num, art_comment_group) {
	
};	
		
		
		
/*		if(reply_level == 0) {
			var reply = $("#reply").val();
			var ajaxJson = new Object();
			ajaxJson.reply_content = reply;
			ajaxJson.user_id = user_id;
			ajaxJson.feed_num = feed_num;
			ajaxJson.reply_ref = reply_num;
			ajaxJson.reply_id = reply_id;
			ajaxJson.reply_level = reply_level;
			
			
			var jsonString = JSON.stringify(ajaxJson);
		
			
			
			
			
		}else {
			var reply = $("#reply1").val();
			var ajaxJson = new Object();
			ajaxJson.reply_content = reply;
			ajaxJson.user_id = user_id;
			ajaxJson.feed_num = feed_num;
			ajaxJson.reply_ref = reply_num;
			ajaxJson.reply_id = reply_id;
			ajaxJson.reply_level = reply_level;
			
			
			var jsonString = JSON.stringify(ajaxJson);
		
			
			
			
			
		}
			console.log(jsonString);
			
			$.ajax({
			    url : '/cdd/feeds/feed_reply_level0.cdd',
			    contentType: 'application/json; charset=UTF-8', // 보내는 데이터 json 일때 필수 옵션
			    method : 'POST', // 전달방식이 controller와 일치해야함
			    data : jsonString, // 전달하는 데이터
			    success: function(data){
			        var json = JSON.parse(data);
			        console.log(json);
			       	var html = "";
			        $("#reply_body").empty();
					$("#reply").val("");
					for(var i =0; i < json.length;i++) {
						if(Number(json[i].reply_level) == 0) {
							html += '<img src=\"/cdd/save/' + json[i].user_profile 
							+ '\" style=\"border-radius: 70%; width: 30px; height: 30px;\" />';
							html += "<a style=\"font-weight: bold; color: black;\" href=\"/cdd/myPage/userProfile.cdd?profileId="+json[i].user_id+ "\">"+json[i].user_id+"</a>";
							html += ' ' + json[i].reply_content;
							html += "<br/>";
							html += '<a role="button" onclick="popup()"><span style="float: right; font-size: 10px;">댓글신고</span></a>';
							html += '<a role="button"><span onclick="reply_depth('+ json[i].feed_num+', \'' +user_id+ '\','+json[i].reply_ref+',' + i+', \''+json[i].user_id+'\', 1)" style="float: right; font-size: 10px;">답글달기</span></a>';
							html += '<div id=\"depth'+i+'\"></div>';
							html += '<hr>';
						}
						if(Number(json[i].reply_level) == 1) {
							html += '<img src=\"/cdd/save/' + json[i].user_profile 
							+ '\" style=\"border-radius: 70%; width: 30px; height: 30px; margin-left: 30px;\" />';
							html += "<a style=\"font-weight: bold; color: black;\" href=\"/cdd/myPage/userProfile.cdd?profileId="+json[i].user_id+ "\">"+json[i].user_id+"</a>";
							html += '<span style="color: #929E9E; display: inline-block">'+ json[i].reply_id+'</span>'
							html += ' ' + json[i].reply_content;
							html += "<br/>";
							html += '<a role="button" onclick="popup()"><span style="float: right; font-size: 10px;">댓글신고</span></a>';
							html += '<a role="button"><span onclick="reply_depth('+ json[i].feed_num+', \'' +user_id+ '\','+json[i].reply_ref+',' + i+', \''+json[i].user_id+'\', 1)" style="float: right; font-size: 10px;">답글달기</span></a>';
							html += '<div id=\"depth'+i+'\"></div>';
							html += '<hr>';
						}
					}
						
					$('#reply_body').append(html);	
					
			       }
			       


			}) 
			
			
		
		}*/
