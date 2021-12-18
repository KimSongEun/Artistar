$(function(){
	$('#artist_birth').datetimepicker({
		format : 'L',
		viewMode : 'years',
		format : 'YYYY-MM-DD'
	});
	
	$('#artist_dead').datetimepicker({
		format : 'L',
		viewMode : 'years',
		format : 'YYYY-MM-DD'
	});
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
		location.href="artistInsertRequest";
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
