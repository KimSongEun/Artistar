$(function() {
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
			form.pwCheck.focus();
			return false;
		}

		if ($("#pwOld").val() != $("#pwNow").val()) {
			alert("현재 비밀번호가 일치하지 않습니다.\n다시 확인해주세요.");
		} else {
			$("#pwNewForm").attr("action", "/artistar/pwchange");
			$("#pwNewForm").submit();
		}
	})
})