<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
	<head>
		<%@include file="header.jsp"%>
	</head>
	<body>
		
		<!-- Container -->
		<div class="container mt-1 pt-5">
		
			<!-- Menu Item -->
			<div class="menuItem col-lg-6 mt-5">
				<img class="menuImg border-0 w-100" src="menu_images/${Produt_dto.product_image}" alt="Menu Img">
			</div>



<!--  아마존 ivs  --> 	
<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>
<video id="video-player" playsinline width= 720 height= 480></video>
<script>
  if (IVSPlayer.isPlayerSupported) {
    const player = IVSPlayer.create();
    player.attachHTMLVideoElement(document.getElementById('video-player'));
    player.load('https://1735a613b59b.us-east-1.playback.live-video.net/api/video/v1/us-east-1.318309370602.channel.8r00mK4nocgM.m3u8');
    player.play();
  }
  
  
 
</script>

<fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
</fieldset>




			<div class="menuContent col-lg-4 mt-5">
				<form name="menuform">
					<div class="text-center">
						<h3 class="mb-0"><strong>판매자${Produt_dto.user_id}</strong></h3>
						<h3 class="text dark"><strong>방 제목 ${Produt_dto.product_name}</strong></h3>
						<p class="text-dark pt-3 pl-3 pr-3">상품 내용 ${Produt_dto.product_detail}</p>
						<h3 class="mb-0"><strong>가격 ${Produt_dto.product_price}원</strong></h3>
			<div class="form-group row">
		       <label  class="col-sm-3 col-form-label">카테고리</label>
		       <c:if test="${Produt_dto.product_category eq 1}">
					<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="가전디지털" readonly></div>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 2}">
						<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="식품" readonly></div>
				</c:if>
				 <c:if test="${Produt_dto.product_category eq 3}">
					<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="주방용품" readonly></div>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 4}">
						<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="생활용품" readonly></div>
				</c:if>
				 <c:if test="${Produt_dto.product_category eq 5}">
					<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="의류" readonly></div>
				</c:if>
				<c:if test="${Produt_dto.product_category eq 6}">
						<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="취미" readonly></div>
				</c:if>
				 <c:if test="${Produt_dto.product_category eq 7}">
					<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="스포츠/레저" readonly></div>
				</c:if>
				
				
				
				</div>
						<div class="row">
							<div class="input-group justify-content-center mt-3 mb-1">
								<p>수량:&ensp;</p><input type="number" name="qty" class="form-control form-control-sm text-center font-weight-bold col-lg-3" value="1" min="1" max="19">
							</div>
						</div>
					
					</div>
				
					<input type="hidden" name="menu_id" value="${Produt_dto.product_id}">
					<input type="hidden" name="menu_name" value="${Produt_dto.product_name}">
					<input type="hidden" name="menu_image" value="${Produt_dto.product_image}">
					<input type="hidden" name="menu_price" value="${Produt_dto.product_price}">
					
				
					<div class="mt-3 text-center">
						
						<button type="button" class="btn btn-warning" onclick="orderNow(${Produt_dto.product_id})"><b>바로 주문하기</b></button>
						<button type="button" class="mt-1 btn-warning" onclick="returnToList()"><b>목록으로 돌아가기</b></button>
					</div>
				</form>
			</div>		
			
			<div class="jumbotron bg-white">
			</div>
		</div>
	</body>
	
 <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8787/Encore/broadcasting');
        var inputMessage = document.getElementById('inputMessage');
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
        textarea.value += "상대 : " + event.data + "\n";
    }

    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }

    function onError(event) {
      alert(event.data);
    }

    function send() {
        textarea.value += "나 : " + inputMessage.value + "\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
    }
  </script>
</html>