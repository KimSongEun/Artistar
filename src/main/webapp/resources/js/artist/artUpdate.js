$(function(){
	geoCode();
	var artinfoNum=$("#artinfoNum").val();
	$(".updatecont").fadeIn();
	$(".delete").click(function(){
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

	function initMap() {
	  var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
	  map = new google.maps.Map( document.getElementById('map'), {
	      zoom: 12,
	      center: seoul
	    });

	  new google.maps.Marker({
	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
	}

	function geoCode() {
			console.log("실행?????");

//			var faddr = '서울특별시 금천구 가산동 371-50';
//			var faddr = 'Barer Str. 29, 80799 München, 독일';
			var faddr = '이렇게 하면 안나와?';

			var geocoder;

			geocoder = new google.maps.Geocoder();

			geocoder.geocode( { 'address': faddr}, function(results, status) {

				if (status == google.maps.GeocoderStatus.OK) {
					console.log("OK?");
					var faddr_lat = results[0].geometry.location.lat();	//위도

					var faddr_lng = results[0].geometry.location.lng();	//경도

				} else {
					console.log("No?");
					var faddr_lat = "";

					var faddr_lng = "";

				}

//				document.frm.sangchaji_faddr_lat.value = faddr_lat;
//
//				document.frm.sangchaji_faddr_lng.value = faddr_lng;



				alert('주소 : ' + faddr + '\n\n위도 : ' + faddr_lat + '\n\n경도 : ' + faddr_lng);

				return;

			});


		}



