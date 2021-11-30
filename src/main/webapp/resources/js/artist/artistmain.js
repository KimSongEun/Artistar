$(function(){
	console.log("들어옴");
	
	let currentPage=1;
	let offset=0;
	let g_lastPage = false;
	
	  $(window).on("scroll", function(){
		  //preventDefault();
		  console.log("스크롤움직");
		    var scrollTop=$(window).scrollTop();
		    var windowHeight=$(window).height();    
		    var documentHeight=$(document).height();
		    
/*		    $("#sTop").text("scrollTop:"+scrollTop);
		    $("#wHeight").text("windowHeight:"+windowHeight);
		    $("#dHeight").text("documentHeight:"+documentHeight);*/

			if(scrollTop+windowHeight >= documentHeight) {
				if(!g_lastPage){
					currentPage+=1;
					console.log("currentPage!!!!!!: "+ currentPage);
					offset+=3;
					console.log("다 내려왔슈");
					$(".loader").show();
					setTimeout(function(){
						$(".loader").show();
						$(".loader").hide();
					}, 2000); 
					loadArtist(); 
				} else {
					clearTimeout();
				}
			}

		  });
	
	function loadArtist(){ 
	$.ajax({
		url : 'artistmain.ajax',
		data : {
			currentPage : currentPage,
			offset : offset
		},
		async:false,
		type : 'POST',
		dataType : 'json',
		success: function(data) {
			var artistList = data.artistvolist;
			var maxPage = data.maxPage;
			var currentPage = data.currentPage;
			console.log("currentPage : " + data.currentPage);
			console.log("maxPage : " + data.maxPage);
			console.log("offset : " + data.offset);
			if(currentPage==maxPage) {
				g_lastPage = true;
			} 
			var html="";
			console.log(artistList);
			for(var i=0; i<artistList.length;i++){
				html += "<div class = 'artistlist_container'>";
				html += "<div class='artistlist_item artistlist_artist'>";
				html += "<div class='user_profile'>";
                html += "<div class='profile_thumb'>";
                html += "<img src='resources"+artistList[i].artistImg+"' class='rounded' onerror='this.src='resources/image/myartgallery/default_user.png''>";
                html += "</div>";
                html += "<div class='detail'>";
                html += "<div class='id m_text'>"+artistList[i].artistName+"</div>";
                html += "<div class='ko_name'>팔로워" +artistList[i].follower+"명</div>";
                html += "</div>";
				html += "</div>"
                html += "<div class='artistlist_item detailgo'>";
                html += "<a href='artistdetail?artistNum="+artistList[i].artistNum+"'><button type='button' class='btn btn-warning'>Detail</button></a>"
                html += "</div>";
				html += "</div>";
				html += "<br>";
					html += "<div class='artistlist_art'> ";
					if(artistList[i].artInfo.length===0){
					for(var j=0; j<3;j++){
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/image/artistart/default_art.png' height='250px'/>"
						html += "</div>"
					}
					} else if(artistList[i].artInfo.length===1){
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/"+artistList[i].artInfo[0].artinfoImg+"' height='250px'/>"
						html += "</div>"
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/image/artistart/default_art.png' height='250px'/>"
						html += "</div>"
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/image/artistart/default_art.png' height='250px'/>"
						html += "</div>"
					} else if(artistList[i].artInfo.length===2){
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/"+artistList[i].artInfo[0].artinfoImg+"' height='250px'/>"
						html += "</div>"
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/"+artistList[i].artInfo[1].artinfoImg+"' height='250px'/>"
						html += "</div>"
						html += "<div class='artist_mainart'>";
						html += "<img class='mainart' src='resources/image/artistart/default_art.png' height='250px'/>"
						html += "</div>"
					} else {
						for(var j=0; j<3;j++){
							console.log("ㅋㅋ" + artistList[i].artInfo[j].artinfoImg);
							html += "<div class='artist_mainart'>";
							html += "<img class='mainart' src='resources/"+artistList[i].artInfo[j].artinfoImg+"' height='250px' onerror='this.src='resources/image/myartgallery/default_user.png''/>"
							html += "</div>"
						}
					}
					html += "</div></div><br><br><br>"
			}
			/*}*/
/*			else{
				html +="<div>바이</div>";
			}*/
			$(".plus").append(html);
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	}
});