$(function() {
	var nicknameCheck=false; 
	var nameCheck = false;  
	var phoneCheck = false;
	var addressCheck = false         
	 
	//닉네임 중복검사
	$('#nickname').keyup(function(){	
		var regex = /^[A-Za-z0-9가-힣]{2,10}$/;
		var nickname = $('#nickname').val();			
		var data = {nickname : nickname}				
		$.ajax({
			type : "post",
			url : "/artistar/memberNicknameChk",
			data : data,
			success : function(result){
				if (result != 'fail') {
					 if ($('#nickname').val().length > 10 || $('#nickname').val().length < 2) {
						 $(".userNickname.regex").html("사용자 이름은 2~10자 이내로 작성되어야 합니다.");
                         $(".userNickname.regex").css("color", "red");
                         nicknameCheck = false;
                    } else if (!regex.test($('#nickname').val())) {
                   	     $(".userNickname.regex").html("사용자 이름은 영문자, 한글, 숫자만 입력가능합니다.");
                         $(".userNickname.regex").css("color", "red");
                         nicknameCheck = false;
                    } else {
                   	    $(".userNickname.regex").html("사용할 수 있는 사용자 이름입니다.");
                        $(".userNickname.regex").css("color", "blue");
                        nicknameCheck = true;
                    }
				} else {
					 if($("#nicknameHidden").val() == $("#nickname").val()){
				    	  nicknameCheck = true;
				      } else{
						   $(".userNickname.regex").html("사용자 이름이 이미 존재합니다. 다른 사용자 이름을 사용해주세요.");
		                   $(".userNickname.regex").css("color", "red");	
		                   nicknameCheck = false;
				      }
				}
			}
		}); 
	});

    // 회원가입 버튼
	$("#updateBtn").click(function() {
		var name = $("#uname").val();
        var nickname = $("#nickname").val();
        var phone = $("#phone").val();
        var address = $("#address").val();

        var nameregex = /[가-힣]{2,}/;
        var nicknameregex = /^[A-Za-z0-9가-힣]{2,10}$/;
        var phoneregex = /^01\d\d{3,4}\d{4}$/;
        var addressregex = /^[가-힣]+$/;
          
        var nameregex = nameregex.exec(name);
        if (nameregex == null) {
            alert("이름을 다시 확인해주세요.\n이름은 한글만 입력가능합니다.");
            nameCheck = false;
            form.uname.focus();
            return false;
        } else{
        	 nameCheck = true;
        }
      
	    if($("#nicknameHidden").val() == $("#nickname").val()){
		   nicknameCheck = true;
	    } 
	    
	    if(!nicknameCheck){
		   alert('사용자 이름을 다시 확인해주세요.');
		   nicknameCheck = false;
		   form.nickname.focus();
	       return false;
	    }  	
       
        if($('[name="gender"]:checked').length == 0){
			alert('성별을 선택해주세요.');
			return false;
        }

        var phoneregex = phoneregex.exec(phone);
        if (phoneregex == null) {
            alert("휴대폰 번호를 다시 확인해주세요.\n휴대폰 번호는 - 를 제외한 숫자 10~11자리만 입력가능합니다.");
            phoneCheck = false;
            form.phone.focus();
            return false;
        } else{
        	phoneCheck = true;
        }
	
        var addressregex = addressregex.exec(address);   
	        if (addressregex != null || address == "") {
	        	addressCheck = true;
	        } else{	        
	        	alert("올바른 주소 형식이 아닙니다");
	            addressCheck = false     
	            form.address.focus();
	            return false;
	        }
        
    	console.log(nameCheck);
    	console.log(nicknameCheck);
    	console.log(phoneCheck);
    	console.log(addressCheck);
    	
    	if(nameCheck&&nicknameCheck&&phoneCheck&&addressCheck){
    		console.log(nameCheck&&nicknameCheck&&phoneCheck&&addressCheck);
    		$("#updateForm").attr("action", "/artistar/memberupdate");
			$("#updateForm").submit();			
    	}

	});
});