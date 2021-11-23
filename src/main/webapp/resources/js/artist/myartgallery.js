/*  $(window).on("scroll", function(){
    var scrollTop=$(window).scrollTop();
    var windowHeight=$(window).height();    
    var documentHeight=$(document).height();
    
    $("#sTop").text("scrollTop:"+scrollTop);
    $("#wHeight").text("windowHeight:"+windowHeight);
    $("#dHeight").text("documentHeight:"+documentHeight);

    var isBottom = documentHeight == scrollTop+windowHeight;
    if(isBottom) {
      $(".loader").show();
      setTimeout(function(){
        $(showHidden[index]).show();
        index++;
        $(".loader").hide();
        $(".loader").hide();
      }, 2000); 
    }
  });*/
$(function(){
	console.log("들어옴");
	const tapContainer = document.querySelector('.about');
	const flex_Container = document.querySelectorAll('.contents_container');
	const taps = document.querySelectorAll('.about > span');


	function openCity(e){
	    let elem = e.target;
	    
	    for (var i = 0; i < flex_Container.length; i++) {
	        flex_Container[i].classList.remove('active');
	        taps[i].classList.remove('on');
	    }
	    
	    if(elem.matches('[class="nick_name"]')){
	        
	        flex_Container[0].classList.add('active');
	        taps[0].classList.add('on');
	        
	    }else if(elem.matches('[class="book_mark"]')){
	        
	        flex_Container[1].classList.add('active');
	        taps[1].classList.add('on');
	        
	    }
	    
	}


	tapContainer.addEventListener('click', openCity);
/*	  $("<img/>").mouseover(function(){
	      $(".box").show().append(this);
	   });

	   $(window).resize(function() {
	      resizeProImage();
	   });

	   function resizeProImage() {

	      var sWidth = $(window).width(); 
	  
	      if(sWidth <= 768) {
	        $('#one').hide();
	        $('#one_2').show();
	        $('#profileImgs').css("margin-top", "10%");
	        $('#profileInfo').hide();
	        $('#profileInfo_2').show();
	        $('#profileInfo_3').hide();
	         $('#profileInfo_4').show();

	      }
	      else {
	        $('#one').show();
	        $('#one_2').hide();
	        $('#profileImgs').css("margin-top", "20px;");
	        $('#profileInfo').show();
	        $('#profileInfo_2').hide();
	         $('#profileInfo_3').show();
	         $('#profileInfo_4').hide();
	      }
	   }

	   $("#save").click(function(){
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".postFont").removeClass("active");
	    $(this).find(".postFont").addClass("active");

	   });

	   $("#post").click(function(){
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".postFont").removeClass("active");
	    $(this).find(".postFont").addClass("active");

	   });

	    $("#save2").click(function(){
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".postFont").removeClass("active");
	    $(this).find(".postFont").addClass("active");

	   });

	   $("#post2").click(function(){
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".postFont").removeClass("active");
	    $(this).find(".postFont").addClass("active");

	   });

	   $("#save2").click(function(){
	    $(".postContent").fadeOut();
	    $(".saveContent").fadeIn();
	    $(".glyColor").removeClass("active");
	    $(this).find(".glyColor").addClass("active");

	   });

	   $("#post2").click(function(){
	    $(".saveContent").fadeOut();
	    $(".postContent").fadeIn();
	    $(".glyColor").removeClass("active");
	    $(this).find(".glyColor").addClass("active");

	   });
*/
});