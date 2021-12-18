$(function(){
	console.log("로링?");
	var artinfoNum=$("#artinfo_num").val();
	$(".updatecont").fadeIn();
	$(".delete").click(function(){
		console.log("삭제 요청 눌림");
		location.href="artDelete?artinfoNum="+artinfoNum;
	})
	$('#artinfo_year').datetimepicker({
		format : 'L',
		viewMode : 'years',
		format : 'YYYY'
	});
	
	$(".ko_name").click(function(){
		console.log("눌렸소");
		$(".profileImageUpdateBtn").hide();
		$(".profileImageUpdate").show();
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
	 
	
});

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
	
	
	var map;

/*	function initMap() {
	  var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
	  map = new google.maps.Map( document.getElementById('map'), {
	      zoom: 20,
	      center: seoul
	    });

	  new google.maps.Marker({
	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
	}*/
	function initMap() {
		var labelVal=$("#artinfo_collection_address").val();
		var latVal=$("#artinfo_collection_address_lat").val();
		var lonVal=$("#artinfo_collection_address_lon").val();
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
		}
	
	function geoCode() {
			console.log("실행?????");
			$("#lad_lon_info").hide();
			$("#lad_lon_alert").hide();
//			var faddr = '서울특별시 금천구 가산동 371-50';
//			var faddr = 'Barer Str. 29, 80799 München, 독일';
//			var faddr = '이렇게 하면 안나와?';
//			var faddr = '1 Rue de la Légion d\'Honneur, 75007 Paris, 프랑스';
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

	$('#exampleModal').on('hide.bs.modal', function(){
		console.log("닫힘");
	})

