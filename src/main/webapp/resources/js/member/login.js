$(function() {

	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
		
		// alert("로그인 버튼 작동");
		
		/* 로그인 메서드 서버 요청 */
		$("#loginForm").attr("action", "/artistar/member/login");
		$("#loginForm").submit();
		
	});
	
	window.onload = function () {
		fn_resizeContents();
	};

	// Resize Event
	window.onresize = function () {
		fn_resizeContents();
	};

	var imgs = $(".mainImgWrapper-1 img");
	var imgId = 1;
	setInterval(function () {
		$(".mainImgWrapper-1 img").fadeOut(3000);
		$(imgs[imgId - 1]).fadeIn(3000);
		if (imgId == 3) imgId = 1;
		else imgId++
	}, 6000);

	// Resize Contents Function
	var fn_resizeContents = function () {

		var width = document.body.offsetWidth;

		// Init Contents Section
		$("#content-right").attr("style", "top:" + chnHeight);

		if (width >= 1200) {
			// Contents Section
			$("#content-left").attr("class", "col-lg-5 col-sm-offset-1 hidden-sm hidden-xs");
			$("#content-right").attr("class", "col-lg-4");
		}

		if (width >= 992 && width < 1200) {
			// Contents Section
			$("#content-left").attr("class", "col-md-6 hidden-sm hidden-xs");
			$("#content-right").attr("class", "col-md-5");
		}

		if (width < 992 && width >= 768) {
			// Contents Section
			$("#content-right").attr("class", "col-sm-6 col-sm-offset-3");
		}

		if (width >= 735 && width < 768) {
			// Contents Section
			$("#content-right").attr("style", "width:50%;margin-left:25%;top:90px;");
		}

		if (width < 735) {
			// Contents Section
			$("#content-right").attr("class", "col-xs-12");
			$("#content-right").attr("style", "top: 0;");
		}
	}
});