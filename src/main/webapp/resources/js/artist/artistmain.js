$(function(){
	console.log("들어옴");
	$.ajax({
		url : 'artistmain.ajax',
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			var html="";
			console.log(data);
			for(var i=0; i<data.length;i++){
/*				console.log(data[i]);
				for(var j=0; j<data[i].artInfo.length;j++){
				console.log(data[i].artInfo[j]);
				console.log(data[i].artInfo[j].artinfoImg);
				}*/
/*				var arr=new Array();
				arr=data[i].artistInfo;
				console.log("배열" + arr);*/
				html += "<div class = 'artistlist_container'>";
				html += "<div class='artistlist_item artistlist_artist'>";
				html += "<div class='user_profile'>";
                html += "<div class='profile_thumb'>";
                html += "<img src='resources"+data[i].artistImg+"' class='rounded' onerror='this.src='resources/image/myartgallery/default_user.png''>";
                html += "</div>";
                html += "<div class='detail'>";
                html += "<div class='id m_text'>"+data[i].artistName+"</div>";
                html += "<div class='ko_name'>팔로워" +data[i].follower+"명</div>";
                html += "</div>";
				html += "</div>"
                html += "<div class='artistlist_item detailgo'>";
                html += "<button type='button' class='btn btn-warning'>Detail</button>"
                html += "</div>";
				html += "</div>";
				html += "<br>";
					html += "<div class='artistlist_art'> ";
					if(data[i].artInfo.length===0){
					for(var j=0; j<3;j++){
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/image/artistart/default_art.png' height='200px'/>"
						html += "</div>"
					}
					} else {
						for(var j=0; j<data[i].artInfo.length;j++){
							console.log("ㅋㅋ" + data[i].artInfo[j].artinfoImg);
							html += "<div class='artist_mainart'>";
							html += "<img class='mainart' src='resources/"+data[i].artInfo[j].artinfoImg+"' height='200px' onerror='this.src='resources/image/myartgallery/default_user.png''/>"
							html += "</div>"
						}
					}
					html += "</div></div><br><br><br>"
			}
			$(".plus").html(html);
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
});