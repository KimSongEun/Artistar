$(function(){
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
	var button = document.getElementById('button');
	button.addEventListener('click', changeCenter);

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

	function changeCenter(){
	  var busan = { lat: 35.1379222, lng: 129.05562775 };
	  map.panTo(busan);
	  map.setZoom(14);
	}