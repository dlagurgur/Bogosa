<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		<script src="${project}script.js"></script>
<style type="text/css">
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  background-color: #2c3338;
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}

a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


h3 {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}

.site__container {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 3rem 0;
}

.form input[type="password"], .form input[type="text"], .form input[type="submit"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #363b41;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"], .form--login input[type="password"] {
  background-color: #3b4148;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #434A52;
}
.form--login input[type="submit"] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #d44179;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}

.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

</style>

	</head>
	<body>
		
		<!-- Container -->
<h1 style="
    padding-left: 50px;
    padding-bottom: 0px;
    color:white;
    margin-bottom: 0px;
    width: 1550px;
    height: 5px;
    margin-top: 20px;
">${Produt_dto.product_name}</h1>
		<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>
<video controls id="video-player" style="
    padding-top: 0px;
    padding-left: 0px;
    height: 700px;
    width: 1300px;
    margin-left: 50px;
    margin-top: 50px;
"></video>


  <textarea id="messageWindow" rows="10" cols="50" readonly="true" style="
    height: 664px;
    width: 404px;
    background-color: black;
    color:white;
    margin-bottom: 35px;
    ">

</textarea>

        <input id="inputMessage" type="text" style=" background-color: black; color:white;"/>
        <input type="submit" value="send" onclick="send()" style=" background-color: black; color:white;"/>






			<!-- Menu Item -->
			<div class="menuItem col-lg-6 mt-5">
				<img class="card-img-top img-fluid" src="menu_images/${Produt_dto.product_image}" alt="Menu Img" style="width: 800px;height: 500px;margin-left: 35px;margin-bottom: 0px;border-bottom-width: 50px;padding-bottom: 0px;margin-top: -40;">
			</div>





<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" /> 
<input type="hidden" name="aws_url" id="aws_url" value="${Produt_dto.aws_url}" /> 

<div class="site__container">

    <div class="grid__container">

	<form class="form form--login" name="joinform" method="post" role="form" style="width: 470px;">
      
    	        
        <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">판매자</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.user_id}" readonly>
		</div>
	 	
<div class="form__field">
					
						<h3 class="mb-0"><strong>판매자${Produt_dto.user_id}</strong></h3>
						<h3 class="text dark"><strong>방 제목 ${Produt_dto.product_name}</strong></h3>
						<p class="text-dark pt-3 pl-3 pr-3">상품 내용 ${Produt_dto.product_detail}</p>
						<h3 class="mb-0"><strong>가격 ${Produt_dto.product_price}원</strong></h3>
</div>
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
			</div>
				
			
			
			
	
	</body>
	
 <script type="text/javascript">
 var aws_url = $('#aws_url').val();
 if (IVSPlayer.isPlayerSupported) {
   const player = IVSPlayer.create();
   player.attachHTMLVideoElement(document.getElementById('video-player'));
   player.load(aws_url);
   player.play();
 }
 
 
 
 
 
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8000/Encore/broadcasting');
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
  </script>
</html>