$(function() {
	
	var modals = document.getElementsByClassName("modal");
	var btns = document.getElementsByClassName("moreBtn");
	var spanes = document.getElementsByClassName("close");
	var funcs = [];


	function Modal(num) {
		return function () {
			btns[num].onclick = function () {
				modals[num].style.display = "block";
				console.log(num);
			};
			spanes[num].onclick = function () {
				modals[num].style.display = "none";
			};
		};
	}

	for (var i = 0; i < btns.length; i++) {
		funcs[i] = Modal(i);
	}

	for (var j = 0; j < btns.length; j++) {
		funcs[j]();
	}
	
	window.onclick = function (event) {
		if (event.target.className == "modal") {
			event.target.style.display = "none";
		}
	};
	
	// 체크박스 전체 선택
	$(".checkbox_group").on("click", "#agreeAll", function () {
		$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});

	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".agree", function () {
		var is_checked = true;

		$(".checkbox_group .agree").each(function () {
			is_checked = is_checked && $(this).is(":checked");
		});

		$("#agreeAll").prop("checked", is_checked);
	});

	$("#nextBtn").click(function () {
		var checkBox = document.getElementById("agreeAll");
		if (checkBox.checked == true) {
			location.href = "join";
		} else {
			alert('이용약관에 모두 동의해주세요');
		}
	});
});