$(function(){
	console.log("들어옴");
	
	let currentPage=1;
	let offset=0;
	let g_lastPage = false;


	  $(window).on("load", function() {
	      resizeProImage();
	  });   


	  $(window).on("scroll", function(){
		  console.log("스크롤움직");
		    var scrollTop=$(window).scrollTop();
		    var windowHeight=$(window).height();    
		    var documentHeight=$(document).height();
		    
		   if($(".postFontArtist").hasClass("active")===true){
			if(scrollTop+windowHeight >= documentHeight) {
				if(!g_lastPage){
					currentPage+=1;
					console.log("currentPage!!!!!!: "+ currentPage);
					offset+=3;
					console.log("아티스트 다 내려왔슈");
					$(".loaderArtist").show();
					setTimeout(function(){
						$(".loaderArtist").show();
						$(".loaderArtist").hide();
					}, 2000); 
					loadArtist(); 
				} else {
					clearTimeout();
				}
			}
	  }
		   if($(".postFontArt").hasClass("active")===true){
				if(scrollTop+windowHeight >= documentHeight) {
					if(!g_lastPage){
						currentPage+=1;
						offset+=3;
						console.log("아트 다 내려왔슈");
						$(".loaderArt").show();
						setTimeout(function(){
							$(".loaderArt").show();
							$(".loaderArt").hide();
						}, 2000); 
						loadArt(); 
					} else {
						clearTimeout();
					}
				}
		  }		   
		  });

		function loadArtist(){ 
			$.ajax({
				url : 'myartgalleryartist.ajax',
				data : {
					currentPage : currentPage,
					offset : offset
				},
				async:false,
				type : 'POST',
				dataType : 'json',
				success: function(data) {
					var myGalleryArtistList = data.myGalleryArtistList;
					var maxPageArtist = data.maxPageArtist;
					var currentPage = data.currentPage;
					console.log("currentPage : " + data.currentPage);
					console.log("maxPageArtist : " + data.maxPageArtist);
					console.log("offset : " + data.offset);
					if(currentPage==maxPageArtist) {
						g_lastPage = true;
					} 
					var html="";
					console.log(myGalleryArtistList);
					for(var i=0; i<myGalleryArtistList.length;i++){
						html += "<div class = 'artistlist_container'>";
						html += "<div class='artistlist_item artistlist_artist'>";
						html += "<div class='user_profile'>";
		                html += "<div class='profile_thumb'>";
		                html += "<img src='"+myGalleryArtistList[i].artistImg+"' class='rounded' onerror='this.src=\"resources/image/artist/myartgallery/default_user.png\"'>";
		                html += "</div>";
		                html += "<div class='detail'>";
		                html += "<div class='id m_text' style='height:20px;'>"+myGalleryArtistList[i].artistName+"<img class='align-top'src='resources/image/artist/artistdetail/artist_check.png' width='10px'/></div>";
		                html += "<div class='ko_name'>팔로워" +myGalleryArtistList[i].follower+"명</div>";
		                html += "</div>";
						html += "</div>"
		                html += "<div class='artistlist_item detailgo'>";
		                html += "<a href='artistdetailArtist?artistNum="+myGalleryArtistList[i].artistNum+"'><button type='button' class='btn btn-warning'>Detail</button></a>"
		                html += "</div>";
						html += "</div>";
						html += "<br>";
							html += "<div class='artistlist_art'> ";
							if(myGalleryArtistList[i].artInfo.length===0){
							for(var j=0; j<3;j++){
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/image/artist/artistart/default_art.png' height='250px'/>"
								html += "</div>"
							}
							} else if(myGalleryArtistList[i].artInfo.length===1){
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/"+myGalleryArtistList[i].artInfo[0].artinfoImg+"' height='250px'/>"
								html += "</div>"
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/image/artist/artistart/default_art.png' height='250px'/>"
								html += "</div>"
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/image/artist/artistart/default_art.png' height='250px'/>"
								html += "</div>"
							} else if(myGalleryArtistList[i].artInfo.length===2){
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/"+myGalleryArtistList[i].artInfo[0].artinfoImg+"' height='250px'/>"
								html += "</div>"
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/"+myGalleryArtistList[i].artInfo[1].artinfoImg+"' height='250px'/>"
								html += "</div>"
								html += "<div class='artist_mainart'>";
								html += "<img class='mainart' src='resources/image/artist/artistart/default_art.png' height='250px'/>"
								html += "</div>"
							} else {
								for(var j=0; j<3;j++){
									console.log("ㅋㅋ" + myGalleryArtistList[i].artInfo[j].artinfoImg);
									html += "<div class='artist_mainart'>";
									html += "<img class='mainart' src='resources/"+myGalleryArtistList[i].artInfo[j].artinfoImg+"' height='250px' onerror='this.src=\"resources/image/artist/myartgallery/default_user.png\"'/>"
									html += "</div>"
								}
							}
							html += "</div></div><br><br><br>"
					}
					$(".plus").append(html);
				},
				error : function(request, status, errorData){ 
					 alert("error code : " + request.status + "\n" 
							 + "message : " + request.responseText + "\n" 
							 + "error : " + errorData); 
							 } 
			});
			}	  
	  
		function loadArt(){ 
			$.ajax({
				url : 'myartgalleryart.ajax',
				data : {
					currentPage : currentPage,
					offset : offset
				},
				async:false,
				type : 'POST',
				dataType : 'json',
				success: function(data) {
					var myGalleryArtList = data.myGalleryArtList;
					var maxPageArt = data.maxPageArt;
					var currentPage = data.currentPage;
					console.log("currentPage : " + data.currentPage);
					console.log("maxPageArt : " + data.maxPageArt);
					console.log("offset : " + data.offset);
					if(currentPage==maxPageArt) {
						g_lastPage = true;
					} 
					var html="";
					console.log(myGalleryArtList);
					for(var i=0; i<myGalleryArtList.length;i++){
						html += "<div class='col-4 insList py-3'>";
						html += "<a onclick='contentView("+myGalleryArtList[i].artinfoNum+")' id='replyView' type='button' data-bs-toggle='modal' data-bs-target='#artContent'>";
						html += "<div class='box' style='width : 300px; height:350px; margin-top : 17px'>";
						html += "<div class='likeBox style='width : 300px; height : 350px; margin-top : 17px'>";
						html += "<span><i class='fas fa-heart'></i></span>";
						html += "&nbsp;";
						html += "<span id='pfont'>"+myGalleryArtList[i].artLikeCount+"개</span>";
						html += "<span style='margin-left:60px;'><i class='fas fa-pencil-alt'></i></span>";
						html += "&nbsp;";
						html += "<span id='pfont'>"+myGalleryArtList[i].artCommentCount+"개</span>";
						html += "</div>";
						html += "</div>";
						html += "<img src='resources/"+myGalleryArtList[i].artinfoImg+"' width='300px' height='350px' style='display:inline-block;'/>";
						html += "</a>"
						html += "</div>"
					}
					$(".plusArt").append(html);
				},
				error : function(request, status, errorData){ 
					 alert("error code : " + request.status + "\n" 
							 + "message : " + request.responseText + "\n" 
							 + "error : " + errorData); 
							 } 
			});
			}		
		
	   $("<img/>").mouseover(function(){
	      $(".box").show().append(this);
	   });

	   $(window).resize(function() {
	      resizeProImage();
	   });

	   function resizeProImage() {

	      var sWidth = $(window).width(); 
	  
	      if(sWidth <= 768) {
	        $('#one').hide();
	        $('#one_2').show();
	        $('#profileImgs').css("margin-top", "10%");
	        $('#profileInfo').hide();
	        $('#profileInfo_2').show();
	        $('#profileInfo_3').hide();
	         $('#profileInfo_4').show();

	      }
	      else {
	        $('#one').show();
	        $('#one_2').hide();
	        $('#profileImgs').css("margin-top", "20px;");
	        $('#profileInfo').show();
	        $('#profileInfo_2').hide();
	         $('#profileInfo_3').show();
	         $('#profileInfo_4').hide();
	      }
	   }

	   $("#save").click(function(){
		   $(".plus").html("");
		   g_lastPage = false;
		   currentPage=1;
		   offset=0;
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".postFontArtist").removeClass("active");
	    $(".postFontArt").addClass("active");
	    
	   });

	   $("#post").click(function(){
		   $(".plusArt").html("");
		   g_lastPage = false;
		   currentPage=1;
		   offset=0;
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".postFontArt").removeClass("active");
	    $(".postFontArtist").addClass("active");
	   });

	    $("#save2").click(function(){
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".postFontArtist").removeClass("active");
	    $(".postFontArt").addClass("active");

	   });

	   $("#post2").click(function(){
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".postFontArt").removeClass("active");
	    $(".postFontArtist").addClass("active");

	   });

	   $("#save2").click(function(){
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".glyColorArtist").removeClass("active");
	    $(".glyColorArt").addClass("active");

	   });

	   $("#post2").click(function(){
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".glyColorArt").removeClass("active");
	    $(".glyColorArtist").addClass("active");

	   });
});
function contentView(artinfoNum) {
	console.log("눌렸습니다" + artinfoNum);
	$(".art_content").load('artContent?artinfoNum=' + artinfoNum);
}