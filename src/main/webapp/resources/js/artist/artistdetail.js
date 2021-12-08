  /*function fn_movePage() {
	   console.log("눌렸습니다");
	      //Loading a progress bar
	      $('#nprogress').show();
	        var wPercent = 0;
	        var intId = setInterval(function() {
	          if(wPercent > 100) {
	            clearInterval(intId);
	            location.href = 'artistedit?artistNum='+pageNm;
	          }
	          $('#nprogress').css("width",  wPercent + "%");
	          wPercent += 0.6;
	        } , 10);
	   }*/

$(function(){
	
	let currentPage=1;
	let offset=0;
	let g_lastPage = false;


	  $(window).on("load", function() {
	      resizeProImage();
	  });   
	  

	  $(window).on("scroll", function(){
		  console.log("스크롤중입니당");
	    var scrollTop=$(window).scrollTop();
	    var windowHeight=$(window).height();    
	    var documentHeight=$(document).height();
	    

	    var isBottom = documentHeight == scrollTop+windowHeight;
		   if($(".postFontArt").hasClass("active")===true){
				if(scrollTop+windowHeight >= documentHeight) {
					console.log("마지막");
					if(!g_lastPage){
						currentPage+=1;
						console.log("currentPage!!!!!!: "+ currentPage);
						offset+=3;
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
	  var artistNum = $("#artistNum").val();
	  console.log("artistNum : "+ artistNum);
		function loadArt(){ 
			console.log("loadArt 함수 시작");
			$.ajax({
				url : 'artistdetail.ajax',
				data : {
					currentPage : currentPage,
					offset : offset,
					artistNum : artistNum
				},
				async:false,
				type : 'POST',
				dataType : 'json',
				success: function(data) {
					var artistProfileArtInfoList = data.artistProfileArtInfoList;
					var maxPageArt = data.maxPageArt;
					var currentPage = data.currentPage;
					console.log("currentPage : " + data.currentPage);
					console.log("maxPageArt : " + data.maxPageArt);
					console.log("offset : " + data.offset);
					if(currentPage==maxPageArt) {
						g_lastPage = true;
					} 
					var html="";
					console.log(artistProfileArtInfoList);
					for(var i=0; i<artistProfileArtInfoList.length;i++){
						html += "<div class='col-4 insList py-3'>";
						html += "<a onclick='contentView("+artistProfileArtInfoList[i].artinfoNum+")' id='replyView' type='button' data-bs-toggle='modal' data-bs-target='#artContent'>";
						html += "<div class='box' style='width : 300px; height : 350px; margin-top : 17px'>";
						html += "<div class='likeBox' style='width : 300px; height : 350px; margin-top : 17px'>";
						html += "<span><i class='fas fa-heart'></i></span>";
						html += "&nbsp;";
						html += "<span id='pfont'>"+artistProfileArtInfoList[i].artLikeCount+"개</span>";
						html += "<span style='margin-left:60px;'><i class='fas fa-pencil-alt'></i></span>";
						html += "&nbsp;";
						html += "<span id='pfont'>"+artistProfileArtInfoList[i].artCommentCount+"개</span>";
						html += "</div>";
						html += "</div>";
						html += "<img src='resources/"+artistProfileArtInfoList[i].artinfoImg+"' width='300px' height='350px' style='display:inline-block;' />";
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
		   /*$(".plus").html("");*/
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".postFontArtist").removeClass("active");
	    $(".postFontArt").addClass("active");
	    
	   });

	   $("#post").click(function(){
		   /*$(".plusArt").html("");*/
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
function loadImg(f) {
    console.log(f.files); 
    if (f.files.length != 0 && f.files[0] != 0) {
        var reader = new FileReader();
        reader.readAsDataURL(f.files[0]);
        reader.onload = function(e) {
            $("#ImgView").attr('src', e.target.result);
        }
    } 
}
function contentView(artinfoNum) {
	console.log("눌렸습니다" + artinfoNum);
	$(".art_content").load('artContent?artinfoNum=' + artinfoNum);
}