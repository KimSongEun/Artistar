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
	    
	    $('#follow').on('click', function() {
	    	follow(true);
	    	
	    });

	    $('#unfollow').on('click', function() {
	    	follow(false);
	    });

	    var id=$("#id").val();
	    console.log("id============="+id);
	    

	    function follow(check) {
	    	   console.log("check============="+check);
	    	if(check) {
	    		$.ajax({
	    			type: "POST",
	    			url: "/artistar/follow/"+id,
	    			headers: {
	    				"Content-Type": "application/json",
	    				"X-HTTP-Method-Override": "POST"
	    			},
	    			success: function(result) {
	    				console.log("result : " + result);
	    				if(result === "FollowOK"){
	    					$(".follow").html('<button class="followBtn" id="unfollow">언팔로우</button>');
	    					location.href="/artistar/mypost/"+id;
	    					 console.log("location.href============="+location.href);
	    				}
	    			}
	    		});
	    	} else {
	    		$.ajax({
	    			type: "POST",
	    			url: "/artistar/unfollow/"+id,
	    			headers: {
	    				"Content-Type": "application/json",
	    				"X-HTTP-Method-Override": "POST"
	    			},
	    			success: function(result) {
	    				console.log("result : " + result);
	    				if(result === "unFollowOK"){
	    					$(".follow").html('<button class="followBtn" id="follow">팔로우</button>');
	    					location.href="/artistar/mypost/"+id;
	    					console.log("location.href============="+location.href);
	    				}
	    			}
	    		});
	    	}
	    }

});
