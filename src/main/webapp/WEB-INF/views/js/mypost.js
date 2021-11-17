
  var showHidden = [ $(".Hidden"), $(".Hidden1") ] ;
  var index =  0;


  $(window).on("load", function() {
      resizeProImage();
  });   


  $(window).on("scroll", function(){
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

    //Navbar Change
    if(scrollTop > 50) {
      $('.nav-insta').addClass("nav-small");
      $('.nav-container').addClass("container-small");
      $('.nav-fixed-1').stop().hide();
      $('.nav-fixed-2').stop().fadeIn(500);
      $('body').addClass("body-small");
    }
    else {
      $('.nav-insta').removeClass("nav-small");
      $('.nav-container').removeClass("container-small");
      $('.nav-fixed-2').stop().hide();
      $('.nav-fixed-1').stop().fadeIn(500);

      $('body').removeClass("body-small");
    }
  });

   $("<img/>").mouseover(function(){
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


   function fn_movePage(pageNm) {
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
   }