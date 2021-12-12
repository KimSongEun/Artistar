$(function() {
	console.log("들어왔나?");
	$("#artistResultView").show();
	$("#artResultView").hide();
	$("#tagsResultView").hide();

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