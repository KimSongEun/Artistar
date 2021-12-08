$(function(){
		console.log("?????실행됨");
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
			console.log("followCheck"+data.result);
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
			
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}
/*
function reply_depth(feed_num, user_id, reply_num, current, reply_id, reply_level) {
		
		console.log(reply_id);
		var html = '<input id="reply1" type="text" style="width: 70%;" placeholder="댓글입력"/>';
		html += '<a role="button" onclick="test('+feed_num +',\'' +user_id +'\','+ reply_num + ',\''+ reply_id +'\','+reply_level+','+current+');"><i style="font-size: 30px;" class="far fa-comment-dots"></i></a>';
			if($('#depth' + current).is(':empty')) {
				
				$('#depth' + current).append(html);
			}else{
				$('#depth' + current).empty();
			}
	}
	
	function test(feed_num, user_id,reply_num,reply_id,reply_level, current) {
			
		if(reply_level == 0) {
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
			
			
		
		}
	
	
	function followProcess(user_from, user_to, followCh) {
		var ajaxJson = new Object();
		ajaxJson.user_from = user_from;
		ajaxJson.user_to = user_to;
		ajaxJson.followCh = followCh;
		
		var jsonString = JSON.stringify(ajaxJson);
		
		console.log(jsonString);
		$.ajax({
		    url : '/cdd/feeds/followProcess.cdd',
		    contentType: 'application/json; charset=UTF-8', // 보내는 데이터 json 일때 필수 옵션
		    method : 'POST', // 전달방식이 controller와 일치해야함
		    data : jsonString, // 전달하는 데이터
		    success: function(data){
		        
		    	var json = JSON.parse(data);
		    	console.log(json);
		    	$("#follow").empty();
		       	
		    	 if(json.followCh == 0) {
			        	var html = '<div style="display: inline-block" id="follow"><a role="button" onclick="followProcess(\''+json.user_from+'\', \''+json.user_to+'\', '+json.followCh+')"><i style="font-size: 20px; margin-left: 10px; color: black;" class="fas fa-user-plus"></i></a></div>';
			        	
			        }else if(json.followCh == 1) {
			        	
			        	
				        	var html = '<div style="display: inline-block" id="follow"><a role="button" onclick="followProcess(\''+json.user_from+'\', \''+json.user_to+'\', '+json.followCh+')"><i style="font-size: 20px; margin-left: 10px; color: #3178EA;" class="fas fa-user-check"></i></a></div>';
			        }
			        	
			        		
			        	
			        	
		        	
		    	 $('#follow').append(html);
				
		       }
		       


		}) 
	}
*/