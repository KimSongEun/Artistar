$(function(){
		$("#alarm").click(function(){
		$("#newAlarm").fadeOut();
		$(".alarmModal").load("alarmContent");
	});
})
/*$(function(){
	
//	var options = {
//		    html: true,
//		    title: "Optional: HELLO(Will overide the default-the inline title)",
//		    //html element
//		    content: $("#popover-content")
//		    //Doing below won't work. Shows title only
//
//		  }
	var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
	var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
//	  return new bootstrap.Popover(popoverTriggerEl, options)
	  return new bootstrap.Popover(popoverTriggerEl)
	})
	var popover = new bootstrap.Popover(document.querySelector('.popover-dismiss'), {
	  trigger: 'focus'
	})
})*/

//Scroll Event
       $(window).on("scroll", function(e) {
         var scrollTop = $(window).scrollTop();
         if(scrollTop > 50) {
        	/*console.log("스크롤");*/
           $('.nav-artistar').addClass("nav-small");
           $('.nav-container').addClass("container-small");

         $('body').addClass("body-small");

         }
         else {
           $('.nav-artistar').removeClass("nav-small");
           $('.nav-container').removeClass("container-small");

           $('body').removeClass("body-small");
         }
       }); 

/*function fn_movePage(pageNm) {
    	  console.log("들어옴");
	      //Loading a progress bar
	      $('#nprogress').show();
	        var wPercent = 0;
	        var intId = setInterval(function() {
	          if(wPercent > 100) {
	            clearInterval(intId);
	            location.href = pageNm + ".html";
	          }
	          $('#nprogress').css("width",  wPercent + "%");
	          wPercent += 0.6;
	        } , 10);
	   }*/