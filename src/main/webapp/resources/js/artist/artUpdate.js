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