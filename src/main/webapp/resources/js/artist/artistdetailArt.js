$(function(){
	console.log("되고 있는겨?");
    $(".saveContent").fadeIn();
    $(".postFontArt").addClass("active");
    
    $("#addressEnter").click(function(){
    	console.log("눌렸당!!");
    	$("#artinfo_collection_div").show();
    	
    })
    
    
    $("#artinfo_collection_address_lat").keyup(function(){
    	var faddr_lat = $("#artinfo_collection_address_lat").val();
    	var faddr_lon = $("#artinfo_collection_address_lon").val();
		  map = new google.maps.Map( document.getElementById('map'), {
		      zoom: 18,
		      center: { lat:  parseFloat(faddr_lat),lng: parseFloat(faddr_lon) }
		    });
		  new google.maps.Marker({
			    position: { lat: parseFloat(faddr_lat),lng: parseFloat(faddr_lon) },
			    map: map,
			    label: "소장처"
			  });
    })
    $("#artinfo_collection_address_lon").keyup(function(){
    	var faddr_lat = $("#artinfo_collection_address_lat").val();
    	var faddr_lon = $("#artinfo_collection_address_lon").val();
		  map = new google.maps.Map( document.getElementById('map'), {
		      zoom: 18,
		      center: { lat:  parseFloat(faddr_lat),lng: parseFloat(faddr_lon) }
		    });
		  new google.maps.Marker({
			    position: { lat: parseFloat(faddr_lat),lng: parseFloat(faddr_lon) },
			    map: map,
			    label: "소장처"
			  });
    	
    })
	$('#year').datetimepicker({
		format : 'L',
		viewMode : 'years',
		format : 'YYYY'
	});
    
    var artistNum = $("#artistNum").val();
	
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


	   $("#post").click(function(){
		   location.href="artistdetailArtist?artistNum="+artistNum;
	   });

	   $("#post2").click(function(){
		   location.href="artistdetailArtist?artistNum="+artistNum;

	   });

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
			console.log("followCheck : "+data.followCheck);
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
			$('#artistFollowImg').append(html);
			
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
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
			var followerCount="";
			if(data.result=="success") {
				$('#artistFollowImg').empty();
				html += "<div style='display: inline-block' id='unfollow'>";
				html += "<a role='button' onclick='unfollowProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #F5605C;' class='fas fa-user-check'></i>";
				html += "</a>";
				html += "</div>";	
				if(data.artistProfileFollowerCount== null){
					followerCount=0;
				} else {
				followerCount=data.artistProfileFollowerCount;
				}
			}
			$('#artistFollowImg').append(html);
			$('#followerCount').empty();
			$('#followerCount').append(followerCount);
			/*location.reload();*/
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
			var followerCount="";
			if(data.result=="success") {
				$('#artistFollowImg').empty();
				html += "<div style='display: inline-block' id='follow'>";
				html += "<a role='button' onclick='followProcess("+artistNum+")'> <i style='font-size: 20px; margin-left: 10px; color: #000000;' class='fas fa-user-plus'></i>";
				html += "</a>";
				html += "</div>";
				if(data.artistProfileFollowerCount== null){
					followerCount=0;
				} else {
				followerCount=data.artistProfileFollowerCount;
				}
			}
			$('#artistFollowImg').append(html);
			$('#followerCount').empty();
			$('#followerCount').append(followerCount);
			/*location.reload();*/
		},
		error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData); 
					 } 
	});
	
}

var map;
//var map1;
//	function initMap() {
//		  var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
//		  map = new google.maps.Map( document.getElementById('map'), {
//		      zoom: 18,
//		      center: seoul
//		    });
//		  new google.maps.Marker({
//			    position: seoul,
//			    map: map,
//			    label: "대한민국"
//			  });
///*		var labelVal=$("#artinfo_collection_address").val();
//		var latVal=$("#artinfo_collection_address_lat").val();
//		var lonVal=$("#artinfo_collection_address_lon").val();*/
//		  /*var museum = { lat: parseFloat(latVal) ,lng: parseFloat(lonVal) };*/
//		  var museum = { lat: 37.5642135 ,lng: 127.0016985 };
//		  map1 = new google.maps.Map( document.getElementById('map1'), {
//		      zoom: 18,
//		      center: museum
//		    });
//
//		  new google.maps.Marker({
//		    position: museum,
//		    map: map1,
//		    label: "소장처"
//		  });
//		}
	
	function geoCode() {
		$("#map").show();
			console.log("실행?????");
			$("#lad_lon_info").hide();
			$("#lad_lon_alert").hide();
			var faddr = $("#artinfo_collection_address").val();

			var geocoder;

			geocoder = new google.maps.Geocoder();

			geocoder.geocode( { 'address': faddr}, function(results, status) {

				if (status == google.maps.GeocoderStatus.OK) {
					console.log("OK?");
					var faddr_lat = results[0].geometry.location.lat();	//위도
					var faddr_lon = results[0].geometry.location.lng();	//경도
					console.log("위도 : " + faddr_lat);
					console.log("경도 : " + faddr_lon);
					$("#artinfo_collection_address_lat").val(faddr_lat);
					$("#artinfo_collection_address_lon").val(faddr_lon);
					$("#lad_lon_info").show();
					
					  map = new google.maps.Map( document.getElementById('map'), {
					      zoom: 18,
					      center: { lat:  faddr_lat,lng: faddr_lon }
					    });
					  new google.maps.Marker({
						    position: { lat: faddr_lat ,lng: faddr_lon },
						    map: map,
						    label: "소장처"
						  });
				} else {
					console.log("No?");
					var faddr_lat = "";
					var faddr_lon = "";
					$("#lad_lon_info").show();
					$("#lad_lon_alert").show();

				}
				return;
			});
		}