	$(function() {
		var postNum = "${postdetail.postNum }";
		// 처음 댓글 로딩
		getComment();
		
		// 댓글 목록 함수 ===================================================
		function getComment() {
			var dataclist = {"postNum" : postNum}
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postcomment",
				type: "POST",
				data: dataclist,
				dataType: "json",
				success: function(data){
					console.log(data);
					// 댓글 입력창 비우기
					$("#comment").val("");
					// 댓글 값 가져오기
					var str;
					$(data).each(function(){
						str +=	"<p>" + this.postCommentNum + "</p>"
							+	"<p>" + this.postComment + "</p>"
							+	"<p>" + this.id + "</p>"
							+	"<p>" + this.postCommentDate + "</p>"
							+	'<input type="hidden" value="' + this.postCommentNum + '" class="val-commentDel">'
							+	'<input type="submit" value="삭제" class="btn-commentDel">'
					});
					$("#comment-container").html(str);
					
					// 댓글 삭제
					$(".btn-commentDel").click(function() {
						delComment()
					});

				}
			});
		}
		
		// 댓글 작성 시 =====================================================
		$(".btn-comment").click(function() {
			// 댓글 유효성 검사
			if($("#comment").val() == "") {
				alert("댓글을 입력해 주세요!");
			} else {
				var comment = $("#comment").val();
				console.log("comment: " + comment);
				// 보낼 데이터 설정
				var dataAddc = {"postComment" : comment, "postNum" : postNum};
				console.log(dataAddc);
				// ajax
				$.ajax({
					url: "${pageContext.request.contextPath}/post/postaddc",
					type: "POST",
					data: dataAddc,
					dataType: "json",
					success: function() {
						getComment();
					}
				});
			}
		});
		
		// 댓글 삭제 함수 ====================================================
		function delComment() {
			var postCommentNum = $(".val-commentDel").val();
			console.log("댓글 삭제 postCommentNum: " + postCommentNum);
			// 보낼 데이터 설정
			var dataDelc = {"postCommentNum" : postCommentNum, "postNum" : postNum};
			console.log(dataDelc);
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postdelc",
				type: "POST",
				data: dataDelc,
				dataType: "json",
				success: function() {
					getComment();
				}
			});
		}
		
		// 좋아요 ==========================================================
		let checked;
		
		// 하트 클릭 시 =======================================================
		$("#id-check-like").click(function() {
			// 좋아요 체크박스 체크 여부
			checked = $("#id-check-like").is(":checked");
			console.log(checked);
			// 보낼 데이터 설정
			var datalike;
			if(checked) {
				datalike = {"likeCheck" : 1, "postNum" : postNum};
			} else {
				datalike = {"likeCheck" : 0, "postNum" : postNum};
			}
			console.log(datalike);
			// ajax
			$.ajax({
				url: "${pageContext.request.contextPath}/post/postlike",
				type: "POST",
				data: datalike,
				success: changeHeart()
			});
		});
		
		// 하트 이미지 바꾸기 함수 ================================================
		function changeHeart() {
			if(checked == true) {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_full.png");
				} else {
				$("#heart").attr("src", "${pageContext.request.contextPath}/resources/image/post/heart_empty.png");
				}
			};
	});