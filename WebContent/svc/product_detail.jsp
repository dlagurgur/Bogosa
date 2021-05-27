<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<div style="width: auto; margin: 0 auto; margin-top: 30px;">
	<input type="hidden" id="aa" name="aa">
	<input type="hidden" name="menu_id" value="${Produt_dto.product_id}">
	<input type="hidden" name="menu_name" value="${Produt_dto.product_name}">
	<input type="hidden" name="menu_image" value="${Produt_dto.product_image}">
	<input type="hidden" name="menu_price" value="${Produt_dto.product_price}">
	<input type="hidden" id="user_id" value="${Produt_dto.user_id}">
	<input type="hidden" name="trailer_id" value="${Produt_dto.trailer_id}">
	<input type="hidden" id="user_charn" name="user_charn" value="${Produt_dto.user_charn}">
	<input type="hidden" name="aws_url" id="aws_url" value="${Produt_dto.aws_url}" />
	<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" />
	<div class="col">
		<video controls id="video-player" style="padding-top: 0px; padding-left: 0px; height:540px; width: 960px;"></video>
		<div class="col" style="display:inline-block; margin-left: 25px;">
			<textarea onkeyup="changeRGB()" id="aaaa" class="commentList" rows="10" cols="50" 
			readonly style="height: 508px;width: 300px;background-color: #886fd4;color:white;border:none; resize:none;"></textarea>
			<form class="form form--login" name="commentInsertForm" method="post">
				<div class="form__field">
					<input type="hidden" name="product_id" value="${Produt_dto.product_id}" />
					<input type="hidden" name="session" value="${sessionScope.user_id}" />
					<c:if test="${sessionScope.user_id eq null}">
						<input type="text" class="form__input" id="chat_content" name="chat_content" placeholder="로그인을 해주세요" readonly>
						<button class="form__input" type="button">Enter</button>
					</c:if>
					<c:if test="${sessionScope.user_id ne null}">
						<input type="text" class="form_input p-2 text-white" id="chat_content" name="chat_content" placeholder="채팅입력">
						<button class="form_input p-2" style="width: 60px;" type="button" onclick="commentInsert()">Enter</button>
					</c:if>
				</div>
			</form>
		</div>
		<h2 class="fs-4 text-white m0-3 pb-3">${Produt_dto.product_name}</h2>
		<hr>
	</div>
	<div class="grid_container" style="margin:0 auto; width:80%;">
		<div>
			<h2 class="text-center text-white my-5">상품 상세정보</h2>
		</div>
		<form class="form form--login" id="menuform" action="product_detaile_delete.go" name="menuform" role="form" style="width: 800;margin: 0 auto;">
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
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.user_id}" readonly>
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
				<input type="number" name="qty" class="form_input text-center" value="1" min="1" max="19" style="color:white;width: 180px;">
			</div>
			<div class="form__field">
				<button type="button" class="btn btn-lg btn-secondary btn-block" style="width: 250px;margin: 0 auto;" onclick="orderNow(${Produt_dto.product_id})">바로 주문하기</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	var Tawk_API = Tawk_API || {},
		Tawk_LoadStart = new Date();
	(function() {
		var s1 = document.createElement("script"),
			s0 = document.getElementsByTagName("script")[0];
		s1.async = true;
		s1.src = 'https://embed.tawk.to/60a75255b1d5182476bb0d70/1f66pj7ph';
		s1.charset = 'UTF-8';
		s1.setAttribute('crossorigin', '*');
		s0.parentNode.insertBefore(s1, s0);
	})();
</script>	
	
	
 
<script>
	setInterval(function ChennelViewCount() {
		AWS.config.update({
			"accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
			"secretAccessKey": "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",
			"region": "us-east-1"
		});
		// AWS.config.loadFromPath('./config.json');
		AWS.config.region = 'us-east-1'; // 리전
		var ivs = new AWS.IVS();
		var user_charn = $('#user_charn').val();
		var params = {
			'channelArn': user_charn
		};
		ivs.getStream(params, function(err, data) {
			if(err) console.log(err, err.stack); // an error occurred
			else console.log(data);
			var view_count = data.stream.viewerCount
			document.getElementById("aa").value = view_count + "명";
		});
	}, 10000);
	//ajax
	function commentInsert() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		CmtInsert(insertData); //Insert 함수호출(아래)
	}
	/////패팅 목록 
	setInterval(function commentList() {
			var product_id = $("input[name=product_id").val();
			var SessionID = $("input[name=session]").val();
			var user_id = $('#user_id').val();
			$.ajax({
				url: 'getProduct_chat.go',
				type: 'get',
				data: {
					product_id: product_id
				},
				success: function(data) {
					var commentView = '';
					$.each(data, function(key, comment) {
						if(user_id == comment.user_id) {
							commentView += '방장' + comment.user_id + ' : ' + comment.chat_content;
						} else {
							commentView += comment.user_id + ' : ' + comment.chat_content;
						}
					});
					$(".commentList").html(commentView);
				},
				error: function(error) {}
			});
		}, 500)
		//채팅 등록
	function CmtInsert(insertData) {
		var product_id = $("input[name=product_id").val();
		if(commentInsertForm.chat_content.value) {
			$.ajax({
				url: 'insertChat_comment.go',
				type: 'post',
				data: insertData,
				success: function(data) {
					if(data == 1) {
						/*오류메세지 작성*/
					} else {
						/// commentList();
						$('[name=chat_content]').val('');
					}
				},
				error: function(error) {
					alert("error : " + error);
				}
			});
		} else {
			alert("채팅을 입력해주세요");
		}
	}
	var aws_url = $('#aws_url').val();
	if(IVSPlayer.isPlayerSupported) {
		const player = IVSPlayer.create();
		player.attachHTMLVideoElement(document.getElementById('video-player'));
		player.load(aws_url);
		player.play();
	}

</script>

<%@include file="tail.jsp"%>

<!-- /*
 
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8787/Encore/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
        var session = $('#session').val();
    webSocket.onerror = function(event) {
      onError(event)
    };

    webSocket.onopen = function(event) {
      onOpen(event)
    };

    webSocket.onmessage = function(event) {
      onMessage(event)
    };

    function onMessage(event) {
        textarea.value += session + " :  "+ event.data + "\n";
    }

    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
        textarea.value += session + " :  " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
    
    */ -->