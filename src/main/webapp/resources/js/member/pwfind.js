$(function() {
	
	$("#check").click(function(){
	    	var name = $("#uname").val();
	    	var id = $("#id").val();
	        var email = $("#email").val();
	      
	        var nameregex = /[가-힣]{2,}/;
	        var idregex = /^[A-Za-z0-9]{1,20}$/;
	        var emailregex = /^[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	    
	        var nameregex = nameregex.exec(name);
	        if (nameregex == null) {
	            alert("이름을 다시 확인해주세요.\n이름은 한글만 입력가능합니다.");
	            form.uname.focus();
	            return false;
	        }
	
	        var idregex = idregex.exec(id);
	        if (idregex == null) {
	            alert("아이디를 다시 확인해주세요.\n아이디는 영문자와 숫자, 20자 이내로 입력가능합니다.");
	            form.id.focus();
	            return false;
	        }
	        
	        var emailregex = emailregex.exec(email);
	        if (emailregex == null) {
	            alert("이메일을 다시 확인해주세요.\nex)aaa123@aaaa.com");
	            form.email.focus();
	            return false;
	        }
	        
		$("#pwFindForm").attr("action", "/artistar/pwfind");   
		$("#pwFindForm").submit();
	})
})