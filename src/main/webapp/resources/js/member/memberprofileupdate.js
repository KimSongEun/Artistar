$(function() {
	
	$("#photoRemove").click(function(){
		$("#ProfileDeleteForm").attr("action", "/artistar/memberProfileDelete");
		$("#ProfileDeleteForm").submit();
	});
	
	$('#photoEdit').click(function(e) {
      	$("#memberimg").click();
   	});
	
	$("#memberimg").on("change", function() {
		$('#fileUpload').click();
	});

    var fileInput  = document.querySelector( "#file" ),
        button     = document.querySelector( ".input-file-trigger" ),
        the_return = document.querySelector(".file-return");
        fileInput.addEventListener('change', handleImage, false);
	function handleImage(e) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = new Image();
			img.src = event.target.result;
		};
		reader.readAsDataURL(e.target.files[0]);
	}
});