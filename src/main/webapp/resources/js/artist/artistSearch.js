$(function() {
	console.log("들어왔나?");
	var selectOption = $("#selectOption").val();
	console.log(selectOption);
 	if(selectOption == "Artist") {
		$("#artistResultView").css("display", "block");
		$("#artResultView").css("display", "none");
		$("#tagsResultView").css("display", "none");
		$("#searchArtist").prop("checked", true);
	} else if(selectOption == "Art") {
		$("#artistResultView").css("display", "none");
		$("#artResultView").css("display", "block");
		$("#tagsResultView").css("display", "none");	
		$("#searchArt").prop("checked", true);
	}  else if(selectOption == "Tag") {
		$("#artistResultView").css("display", "none");
		$("#artResultView").css("display", "none");
		$("#tagsResultView").css("display", "block");
		$("#searchTags").prop("checked", true);
	} else {
		$("#artistResultView").css("display", "block");
		$("#artResultView").css("display", "none");
		$("#tagsResultView").css("display", "none");
		$("#searchArtist").prop("checked", true);
	} 
 	
	$("#searchArtist").click(function() {
		$("#artistResultView").show();
		$("#artResultView").hide();
		$("#tagsResultView").hide();
	});
	$("#searchArt").click(function() {
		$("#artistResultView").hide();
		$("#artResultView").show();
		$("#tagsResultView").hide();
	});
	$("#searchTags").click(function() {
		$("#artistResultView").hide();
		$("#artResultView").hide();
		$("#tagsResultView").show();
	});
});

function contentView(artinfoNum) {
	console.log("눌렸습니다" + artinfoNum);
	$(".art_content").load('artContent?artinfoNum=' + artinfoNum);
}