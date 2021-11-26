$(function() {
	// 아이디 중복검사
	$('#id').keyup(function() {
		var regex = /^[A-Za-z0-9]{4,20}$/;
		var id = $('#id').val(); 
		var data = {id : id} 
		$.ajax({
			type : "post",
			url : "/artistar/member/memberIdChk",
			data : data,
			success : function(result) {
				if (result != 'fail') {
					 if ($('#id').val().length > 20 || $('#id').val().length < 4) {
						 $(".userId.regex").html("아이디는 4~20자 이내로 작성되어야 합니다.");
                         $(".userId.regex").css("color", "red");
                     } else if (!regex.test($('#id').val())) {
                    	  $(".userId.regex").html("아이디는 영문자와 숫자만 입력가능합니다.");
                          $(".userId.regex").css("color", "red");
                     } else {
                    	 $(".userId.regex").html("사용할 수 있는 아이디입니다.");
                         $(".userId.regex").css("color", "blue");
                     }
				} else {
					$(".userId.regex").html("아이디가 이미 존재합니다. 다른 아이디를 사용해주세요.");
                    $(".userId.regex").css("color", "red");	
				}
			}
		});
	});
	
	//이메일 중복검사
	$('#email').keyup(function(){
		var regex = /^[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var email = $('#email').val();			
		var data = {email : email}				
		$.ajax({
			type : "post",
			url : "/artistar/member/memberEmailChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					if (!regex.test($('#email').val())) {           
                        $(".userEmail.regex").html("올바른 이메일 형식이 아닙니다.");
                        $(".userEmail.regex").css("color", "red");
                    }
                    else {
                    	$(".userEmail.regex").html("사용할 수 있는 이메일입니다.");
                        $(".userEmail.regex").css("color", "blue");
                    }
				} else {
					 $(".userEmail.regex").html("이메일이 이미 존재합니다. 다른 이메일을 사용해주세요.");
                     $(".userEmail.regex").css("color", "red");		
				}
			}
		}); 
	});
	
	// 이름 유효성검사
    $("#uname").on("input", function () {
        var regex = /[가-힣]{2,}/;
        var result = regex.exec($("#uname").val());

        if (result != null) {
            $(".userName.regex").html("");
        } else {
            $(".userName.regex").html("한글만 입력 가능합니다.");
            $(".userName.regex").css("color", "red");
        }

    });

    //비밀번호 유효성검사
    $("#pw").on("input", function () {
        var regex = /^[a-zA-Z0-9]{5,20}$/;
        var result = regex.exec($("#pw").val())

        if (result != null) {
            $(".userPassword.regex").html("");
        } else {
            $(".userPassword.regex").html("영어대소문자 및 숫자를 사용하여 5-20자리이내로 입력해주세요");
            $(".userPassword.regex").css("color", "red");
        }
    });

    //비밀번호 확인    
    $("#pwCheck").on("keyup", function () {
        if ($("#userPassword").val() == $("#pwCheck").val()) {
            $(".pwdCheck.regex").html("비밀번호가 일치합니다");
            $(".pwdCheck.regex").css("color", "blue");
        } else {
            $(".pwdCheck.regex").html("비밀번호가 일치하지않습니다");
            $(".pwdCheck.regex").css("color", "red");
        }
    });

    //email유효성 검사
    $("#email").on("input", function () {
        var regex = /^[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        var result = regex.exec($("#email").val());

        if (result != null) {
            $(".userEmail.regex").html("");
        } else {
            $(".userEmail.regex").html("올바른 이메일 형식이 아닙니다");
            $(".userEmail.regex").css("color", "red");
        }
    });

    // 휴대폰 번호 유효성검사
    $("#phone").on("input", function () {
        var regex = /^01\d\d{3,4}\d{4}$/;
        var result = regex.exec($("#phone").val());

        if (result != null) {
            $(".userPhone.regex").html("");
        } else {
            $(".userPhone.regex").html("올바른 핸드폰 번호 형식이 아닙니다");
            $(".userPhone.regex").css("color", "red");
        }

    });
    $("#address").on("input", function () {
        var regex = /[가-힣]{2,}/;
        var result = regex.exec($("#address").val());

        if (result != null) {
            $(".userAddress.regex").html("");
        } else {
            $(".userAddress.regex").html("올바른 주소 형식이 아닙니다");
            $(".userAddress.regex").css("color", "red");
        }

    });
	
	

	// 회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function() {
		var name = $("#uname").val();
        var nickname = $("#nickname").val();
        var id = $("#id").val();
        var pw = $("#pw").val();
        var email = $("#email").val();
        var phone = $("#phone").val();

        var nameregex = /[가-힣]{2,}/;
        var nicknameregex = /^[A-Za-z0-9가-힣]{2,8}$/;
        var idregex = /^[A-Za-z0-9]{4,20}$/;
        var pwregex = /^[a-zA-Z0-9]{5,20}$/;
        var emailregex = /^[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        var phoneregex = /^01\d\d{3,4}\d{4}$/;
    

        var nameregex = nameregex.exec(name);
        if (nameregex == null) {
            alert("이름을 다시 확인해주세요.\n이름은 한글만 입력가능합니다.");
            form.userName.focus();
            retrun;
        }

        var nicknameregex = nicknameregex.exec(nickname);
        if (nicknameregex == null) {
            alert("닉네임을 다시 확인해주세요.\n닉네임은 한글과 영문자만 입력가능합니다.");
            form.userNickname.focus();
            retrun;
        }
    
        var idregex = idregex.exec(id);
        if (idregex == null) {
            alert("아이디를 다시 확인해주세요.\n아이디는 영문자와 숫자, 20자 이내로 입력가능합니다.");
            form.userId.focus();
            return;
        }
        
        var pwregex = pwregex.exec(pw);
        if (pwregex == null) {
            alert("비밀번호를 다시 확인해주세요.\n비밀번호는 영문자와 숫자, 5~20자 이내로 입력가능합니다.");
            form.userPassword.focus();
            return false;
        }
        var emailregex = emailregex.exec(email);
        if (emailregex == null) {
            alert("이메일을 다시 확인해주세요.\nex)aaa123@aaaa.com");
            form.userEmail.focus();
            return false;
        }
        var phoneregex = phoneregex.exec(phone);
        if (phoneregex == null) {
            alert("휴대폰 번호를 다시 확인해주세요.\n휴대폰 번호는 - 를 제외한 숫자 10~11자리만 입력가능합니다.");
            form.userPhone.focus();
            return false;
        }
	
        if($('[name="gender"]:checked').length == 0){
			alert('성별을 선택해주세요.');
			return false;
        }
        
		$("#joinForm").attr("action", "/artistar/member/join");
		$("#joinForm").submit();
	});

	
	
	
	
	
	
	
	
	
	
	
	
	
	window.onload = function() {
		fn_resizeContents();
	};

	// Resize Event
	window.onresize = function() {
		fn_resizeContents();
	};

	var imgs = $(".mainImgWrapper-1 img");
	var imgId = 1;
	setInterval(function() {
		$(".mainImgWrapper-1 img").fadeOut(3000);
		$(imgs[imgId - 1]).fadeIn(3000);
		if (imgId == 3)
			imgId = 1;
		else
			imgId++
	}, 6000);

	// Change Section
	var chnHeight = "90px";
	var fn_changeSection = function(sectionNm) {
		var curSection = (sectionNm == "login") ? "signup" : "login";
		chnHeight = (sectionNm == "login") ? "200px" : "90px";

		$("#content-right").attr("style", "top:" + chnHeight);
		$("#" + sectionNm + "Form").show();
		$("#" + curSection + "Form").hide();
	};

	// Resize Contents Function
	var fn_resizeContents = function() {

		var width = document.body.offsetWidth;

		// Init Contents Section
		$("#content-right").attr("style", "top:" + chnHeight);

		if (width >= 1200) {
			// Contents Section
			$("#content-left").attr("class",
					"col-lg-5 col-sm-offset-1 hidden-sm hidden-xs");
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
			$("#content-right").attr("style",
					"width:50%;margin-left:25%;top:90px;");
		}

		if (width < 735) {
			// Contents Section
			$("#content-right").attr("class", "col-xs-12");
			$("#content-right").attr("style", "top: 0;");
		}
	}
});