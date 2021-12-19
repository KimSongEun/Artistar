$(function() {
	console.log("들어옴");

	$("<img/>").mouseover(function() {
		$(".box").show().append(this);
	});
	
	   $("#pwChangeBtn").click(function(){
		   location.href="/artistar/pwchange";
	   });

	    $("#logoutBtn").click(function(){
	       location.href="/artistar/logout";
	   });

});
