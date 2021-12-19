$(function() {
	console.log("들어옴");

	$("<img/>").mouseover(function() {
		$(".box").show().append(this);
	});

});
