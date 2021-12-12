$(function(){
	console.log("들어왔당!!");
/*	$('#birth').datepicker({
	    startView: 4,
	    todayBtn: true,
	    language: "ko",
	    orientation: "bottom left"
	});
	
	$('#dead').datepicker({
	    startView: 4,
	    todayBtn: true,
	    language: "ko",
	    orientation: "bottom left"
	});*/
	$(".ko_name").click(function(){
		console.log("눌렸소");
		$(".profileImageUpdateBtn").hide();
		$(".profileImageUpdate").show();
	})
	
	
})

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