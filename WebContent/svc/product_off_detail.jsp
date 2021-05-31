<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<body onload="commentList()">
<div style="width: auto; margin: 0 auto; margin-top: 30px;">
	
	
		<h2 class="fs-4 text-white m0-3 pb-3">${Produt_dto.product_name}</h2>
		<hr>
	</div>
	<div class="grid_container" style="margin:0 auto; width:80%;">
		<div>
			<h2 class="text-center text-white my-5">상품 상세정보</h2>
		</div>
	<form class="form form--login" id="product" action="product_detaile_delete.go" name="product" role="form" style="width: 800;margin: 0 auto;">
	<input type="hidden" id="menu_id" name="menu_id" value="${Produt_dto.product_id}">
	<input type="hidden" id="menu_name" name="menu_name" value="${Produt_dto.product_name}">
	<input type="hidden" id="menu_image" name="menu_image" value="${Produt_dto.product_image}">
	<input type="hidden" id="menu_price" name="menu_price" value="${Produt_dto.product_price}">
	<input type="hidden" id="user_id" value="${Produt_dto.user_id}">
	<input type="hidden" name="trailer_id" value="${Produt_dto.trailer_id}">
	<input type="hidden" id="user_charn" name="user_charn" value="${Produt_dto.user_charn}">
	<input type="hidden" name="aws_url" id="aws_url" value="${Produt_dto.aws_url}" />
	<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" />
			<div class="form__field">
				<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">상품명</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.product_name}" readonly>
				<label for="nickname" class="col-sm-3 col-form-label" style="color: white;padding-right: 10px; padding-left: 10px;">카테고리</label>
				<c:if test="${Produt_dto.product_category eq 1}">
					<input style="color:white;" class="form__input" type="text" value="가전디지털" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 2}">
					<input style="color:white;" class="form__input" type="text" value="식품" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 3}">
					<input style="color:white;" class="form__input" type="text" value="주방용품" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 4}">
					<input style="color:white;" class="form__input" type="text" value="생활용품" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 5}">
					<input style="color:white;" class="form__input" type="text" value="의류" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 6}">
					<input style="color:white;" class="form__input" type="text" value="취미" readonly>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 7}">
					<input style="color:white;" class="form__input" type="text" value="스포츠/레저" readonly>
				</c:if>
			</div>
			<div class="form__field">
				<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">판매자</label>
				<a ><input style="color:white;" class="form__input" type="text" value="${Produt_dto.user_id}" readonly></a>
				<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">가격</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.product_price}원" readonly>
			</div>
			<div>
				<img class="rounded mx-auto d-block my-5" src="menu_images/${Produt_dto.product_image}" alt="Menu Img" style="width:1000px; height:auto; margin:0 auto; margin-top:30;">
			</div>
			<div class="form__field" style="color: white; margin-top: 30px; display: grid;">
				<label for="nickname" class="col-sm-3 col-form-label p-0 my-3" style="color:white;background-color: #6495ed00;">상품설명</label>
				<input style="color:white; height: fit-content;" class="form__input" type="text" value="${Produt_dto.product_detail}" readonly>
			</div>
			<div class="form_field mt-5">
				<label for="nickname" class="col-sm-3 col-form-label" style="color:white;margin: auto;width: 70px;margin-left: 37.5%;">수량</label>
				<input type="number" id="qty" name="qty" class="form_input text-center" value="1" min="1" max="19" style="color:white;width: 180px;">
			</div>
			<div class="form__field">
				<button type="button" class="btn btn-lg btn-secondary btn-block" style="width: 250px;margin: 0 auto;" onclick="orderNow(${Produt_dto.product_id})">바로 주문하기</button>
			</div>
			
			<input type="hidden" name="product_id" value="${Produt_dto.product_id}" />
			
		</form>
		
		
			<form class="p-1" name="commentInsertForm" id="form" method="POST" enctype="multipart/form-data" style="margin:0 auto">
					<h2> 리뷰 </h2>
				<div class="input-group">
					<input type="hidden" name="product_id" value="${Produt_dto.product_id}" />
					<input type="hidden" name="session" value="${sessionScope.user_id}" />
				</div>
			</form>
			<div class="commentList p-1" style="width: 960;margin: auto;margin-top: 50;"></div>
	</div>

<script type="text/javascript"> //ajax

	
	/////댓글 목록 
function commentList() {
		var product_id = $("input[name=product_id").val();
		var SessionID = $("input[name=session]").val();
		$.ajax({
			url: 'getReview.go',
			type: 'get',
			data: {
				product_id: product_id
			},
			success: function (data) {
				var commentView = '';
				$.each(data, function (key, comment) {
					
					commentView += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'
					commentView += '</div style="color:white;" id="commentInfo' + comment.review_id + '"><b style="color:white;">' + comment.user_id + ' &nbsp&nbsp 평점: '+comment.review_scope+'/5</b>&nbsp;&nbsp'
					if (SessionID == comment.user_id) {
						commentView += '<a style="color:white;" onclick="commentUpdate(' + comment.review_id + ',\'' + comment.review_content + '\');"> 수정 </a> &nbsp';
						commentView += '<a style="color:white;" onclick="commentDelete(' + comment.review_id + ');"> 삭제 </a>';
					}
					commentView += '<div id="commentContent"> <p style="color:white;"> 내용 : ' + comment.review_content + '</p>';
					
					commentView += '<img class="rounded mx-auto d-block my-5" src="menu_images/'+ comment.review_image +'" style="width:150px; height:150px; margin:0 auto; margin-top:30;">'
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
	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(review_id, review_content) {
		var commentModify = '';
		commentModify += '<div class="input-group">';
		commentModify += '<input type="text" class="form-control" name="comment_content_' + review_id + '" value="' + review_content + '"/>';
		commentModify += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc(' + review_id + ');">수정</button> </span>';
		commentModify += '</div>';
		$('#commentContent').html(commentModify);
	}
	//댓글 수정
	function commentUpdateProc(review_id) {
		var updateContent = $('input[name=comment_content_' + review_id + ']').val();
		var tb_no = $("input[name=product_id").val();
		$.ajax({
			url: 'updateReview.go',
			type: 'post',
			data: {
				'review_content': updateContent,
				'review_id': review_id
			},
			success: function (data) {
				commentList(tb_no); //댓글 수정후 목록 출력 
			}
		});
	}
	//댓글 삭제 
	function commentDelete(review_id) {
		$.ajax({
			url: 'deleteReview.go',
			type: 'post',
			data: {
				review_id: review_id
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
