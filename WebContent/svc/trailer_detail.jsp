<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
		
<body onload="commentList()">
	<div class="container">
		<div class="row my-4" style="margin:0 auto;">
			<video id=video class="video-js vjs-big-play-centered" controls>
				<source src="${Trailer_dto.trailer_aws_url}" type="application/x-mpegURL">
			</video>
			<h1 class="fs-4 my-3 p-0 text-white" style="width:960px; margin:0 auto;">${Trailer_dto.trailer_name}
		</h1>
			<h1 class="fs-6 my-0 p-0" style="width:960px; margin:0 auto; color: #cd9fff;">라이브 예정 : ${Trailer_dto.trailer_launchdate}
		</h1>
			<script>
				var player = videojs('video');
				    // player.play();
			</script>
		</div>
		<div class="row my-4" style="margin:0 auto;">
			<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" />
			<input type="hidden" name="aws_url" id="aws_url" value="${Trailer_dto.trailer_aws_url}" />
			<form class="form form--login p-0" id="menuform" name="menuform" role="form" style="width: 960px; margin:0 auto;">
				<div class="form__field">
					<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">판매자</label>
					<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.user_id}" readonly>
				</div>
				<div class="form__field">
					<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">가격</label>
					<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.trailer_price}원" readonly>
				</div>
				<div class="form__field">
					<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">상품설명</label>
					<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.trailer_detail}" readonly>
				</div>
				<input type="hidden" name="menu_id" value="${Trailer_dto.trailer_id}">
				<input type="hidden" name="menu_name" value="${Trailer_dto.trailer_name}">
				<input type="hidden" name="menu_price" value="${Trailer_dto.trailer_price}">
			</form>
		</div>
		<div class="row my-4" style="width:960px; margin:0 auto;">
			<label class="text-center p-1" for="content" style="width:80px; background-color: #8b7fac;font-size: 20;border-radius: 5px;padding: 5px;color: beige">comment</label>
			<form class="p-1" name="commentInsertForm" method="post" style="margin:0 auto">
				<div class="input-group">
					<input type="hidden" name="trailer_id" value="${Trailer_dto.trailer_id}" />
					<input type="hidden" name="session" value="${sessionScope.user_id}" />
					<input type="text" class="form-control text-white" id="comment_content" name="comment_content" placeholder="댓글"> <span class="input-group-btn">
							<button class="btn btn-default text-white p-0 m-2" type="button"
								onclick="commentInsert()">Enter</button>
						</span>
				</div>
			</form>
			<div class="commentList p-1" style="width: 960;margin: auto;margin-top: 50;"></div>
		</div>
	</div>




 <script type="text/javascript"> //ajax
 
	function commentInsert() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		CmtInsert(insertData); //Insert 함수호출(아래)
	}
	/////댓글 목록 
	function commentList() {
		var trailer_id = $("input[name=trailer_id").val();
		var SessionID = $("input[name=session]").val();
		$.ajax({
			url: 'commentSelect.go',
			type: 'get',
			data: {
				trailer_id: trailer_id
			},
			success: function (data) {
				var commentView = '';
				$.each(data, function (key, comment) {
					commentView += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
					commentView += '</div style="color:white;" id="commentInfo' + comment.comment_id + '"><b style="color:white;">' + comment.user_id + '</b>&nbsp;&nbsp;';
					if (SessionID == comment.user_id) {
						commentView += '<a style="color:white;" onclick="commentUpdate(' + comment.comment_id + ',\'' + comment.comment_content + '\');"> 수정 </a> &nbsp';
						commentView += '<a style="color:white;" onclick="commentDelete(' + comment.comment_id + ');"> 삭제 </a>';
					}
					commentView += '<div id="commentContent"> <p style="color:white;">' + comment.comment_content + '</p>';
					commentView += '</div></div>'
				});
				$(".commentList").html(commentView);
			},
			error: function (error) {
				alert("댓글을 입력해주세요!");
			}
		});
	}
	//댓글 등록
	function CmtInsert(insertData) {
		var trailer_id = $("input[name=trailer_id").val();
		if (commentInsertForm.comment_content.value) {
			$.ajax({
				url: 'commentInsert.go',
				type: 'post',
				data: insertData,
				success: function (data) {
					if (data == 1) {
						/*오류메세지 작성*/
					} else {
						commentList();
						$('[name=comment_content]').val('');
					}
				},
				error: function (error) {
					alert("로그인해주세요");
				}
			});
		} else {
			alert("댓글을 입력해주세요");
		}
	}
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(comment_id, comment_content) {
		var commentModify = '';
		commentModify += '<div class="input-group">';
		commentModify += '<input type="text" class="form-control" name="comment_content_' + comment_id + '" value="' + comment_content + '"/>';
		commentModify += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc(' + comment_id + ');">수정</button> </span>';
		commentModify += '</div>';
		$('#commentContent').html(commentModify);
	}
	//댓글 수정
	function commentUpdateProc(comment_id) {
		var updateContent = $('input[name=comment_content_' + comment_id + ']').val();
		var tb_no = $("input[name=trailer_id").val();
		$.ajax({
			url: 'commentUpdate.go',
			type: 'post',
			data: {
				'comment_content': updateContent,
				'comment_id': comment_id
			},
			success: function (data) {
				commentList(tb_no); //댓글 수정후 목록 출력 
			}
		});
	}
	//댓글 삭제 
	function commentDelete(comment_id) {
		$.ajax({
			url: 'commentDelete.go',
			type: 'post',
			data: {
				comment_id: comment_id
			},
			success: function (data) {
				commentList(); //댓글 삭제후 목록 출력 
			},
			error: function (error) {
				alert("error : " + error);
			}
		});
	}

 </script>

  <%@include file="tail.jsp"%>