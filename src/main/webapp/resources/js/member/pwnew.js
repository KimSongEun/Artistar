$(function(){    	

 
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
           if ($("#pw").val() == $("#pwCheck").val()) {
               $(".pwdCheck.regex").html("비밀번호가 일치합니다");
               $(".pwdCheck.regex").css("color", "blue");
           } else {
               $(".pwdCheck.regex").html("비밀번호가 일치하지않습니다");
               $(".pwdCheck.regex").css("color", "red");
           }
       });
   
	$("#check").click(function() {
			var pw = $("#pw").val();
			var pwregex = /^[a-zA-Z0-9]{5,20}$/;

			var pwregex = pwregex.exec(pw);
			if (pwregex == null) {
				alert("비밀번호를 다시 확인해주세요.\n비밀번호는 영문자와 숫자, 5~20자 이내로 입력가능합니다.");
				form.pw.focus();
				return false;
			}
			
			 if ($("#pw").val() != $("#pwCheck").val()) {
				 alert("입력된 새 비밀번호가 일치하지 않습니다.\n다시 확인해주세요.");
				 form.pw.focus();
					return false;
			 }
		
			 $("#pwNewForm").attr("action", "/artistar/pwnew");
			    
				$("#pwNewForm").submit();
		})
   })