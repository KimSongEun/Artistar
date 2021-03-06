$(function(){
	console.log("들어왔어??");
	$('#artinfo_year').datetimepicker({
		format : 'L',
		viewMode : 'years',
		format : 'YYYY'
	});
	
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
	var artinfoNum=$("#artinfoNum").val();
	$(".deletecont").fadeIn();
	$(".update").click(function(){
		location.href="artUpdate?artinfoNum="+artinfoNum;
	})
	
	$(".ko_name").click(function(){
		console.log("눌렸소");
		$(".profileImageUpdateBtn").hide();
		$(".profileImageUpdate").show();
	})
	 	
	$("#all").click(function() {
		$("#allResultView").show(500);
		$("#notYetResultView").hide(500);
		$("#okResultView").hide(500);
		$("#nopeResultView").hide(500);
		$("#all").prop("checked", true);
	});
	$("#notYet").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").show(500);
		$("#okResultView").hide(500);
		$("#nopeResultView").hide(500);
		$("#notYet").prop("checked", true);
	});
	$("#ok").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").hide(500);
		$("#okResultView").show(500);
		$("#nopeResultView").hide(500);
		$("#ok").prop("checked", true);
	});	
	$("#nope").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").hide(500);
		$("#okResultView").hide(500);
		$("#nopeResultView").show(500);
		$("#nope").prop("checked", true);
	});	
	$(".goOut").click(function() {
		location.href="artDeleteRequest";
	})
	
});

/*function artistInsert(){
	console.log("눌린거여?!?!");
}*/

	function loadImg(f) {
    console.log(f.files); 
    if (f.files.length != 0 && f.files[0] != 0) {
        var reader = new FileReader();
        reader.readAsDataURL(f.files[0]);
        reader.onload = function(e) {
            $("#profileImgView").attr('src', e.target.result);
        }
    } 
}
	
/* global bootstrap: false */
(function () {
  'use strict'
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
})

var map;

function initMap() {
	var labelVal=$("#artinfo_collection_address").val();
	var latVal=$("#artinfo_collection_address_lat").val();
	var lonVal=$("#artinfo_collection_address_lon").val();
	if(labelVal == "" ){console.log("null이야")}
	console.log("labelVal :" + labelVal);
	console.log("latVal :" + latVal);
	console.log("lonVal :" + lonVal);
	
	if (labelVal!="" && latVal!="" && lonVal !="") {
	
	  var museum = { lat: parseFloat(latVal) ,lng: parseFloat(lonVal) };
	  map = new google.maps.Map( document.getElementById('map'), {
	      zoom: 18,
	      center: museum
	    });

	  new google.maps.Marker({
	    position: museum,
	    map: map,
	    label: "소장처"
	  });
	} else {
		  var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
		  map = new google.maps.Map( document.getElementById('map'), {
		      zoom: 18,
		      center: seoul
		    });
		  new google.maps.Marker({
			    position: seoul,
			    map: map,
			    label: "기본위치"
			  });
	}
	}

function geoCode() {
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
				      center: { lat:  parseFloat(faddr_lat),lng: parseFloat(faddr_lon) }
				    });
				  new google.maps.Marker({
					    position: { lat: parseFloat(faddr_lat),lng: parseFloat(faddr_lon) },
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