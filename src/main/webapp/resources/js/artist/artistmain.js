$(function(){
/*	$.ajax({
		url : 'artistmain.ajax',
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			var html="";
			console.log(data);
			for(var i=0; i<data.length;i++){
				console.log(data[i].artistName);
				html += "<div class = 'artistlist_container'>";
				html += "<div class='artistlist_item artistlist_artist'>";
				html += "<div class='user_profile'>";
                html += "<div class='profile_thumb'>";
                html += "<img src='resources/image"+data[i].artistImg+"' class='rounded' onerror='this.src='resources/image/myartgallery/default_user.png''>";
                html += "</div>";
                html += "<div class='detail'>";
                html += "<div class='id m_text'>"+data[i].artistName+"</div>";
                html += 팔로워 추가
                html += "</div>";
				html += "</div>"
                html += "<div class='artistlist_item detailgo'>";
                html += "<button type='button' class='btn btn-warning'>Detail</button>"
                html += "</div>";
				html += "</div>";
				html += "<br><br><br>";
			}
			$(".artistlist_container").html(html);
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});*/
});