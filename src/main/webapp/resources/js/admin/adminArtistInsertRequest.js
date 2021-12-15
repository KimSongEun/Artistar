$(function(){
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
	});
	$("#notYet").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").show(500);
		$("#okResultView").hide(500);
		$("#nopeResultView").hide(500);
	});
	$("#ok").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").hide(500);
		$("#okResultView").show(500);
		$("#nopeResultView").hide(500);
	});	
	$("#nope").click(function() {
		$("#allResultView").hide(500);
		$("#notYetResultView").hide(500);
		$("#okResultView").hide(500);
		$("#nopeResultView").show(500);
	});	
	
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
})()
