<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		<script src="${project}script.js"></script>
		<script src="//code.jquery.com/jquery.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
		<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
   		<script src="https://vjs.zencdn.net/7.8.2/video.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
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
  background-color: #151515;
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

button {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
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

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form button[type="button"],.form input[type="number"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"],
.form--login button[type="button"] {
  border-radius: 0.25rem;
  padding: 1rem;
}

.form--login label {
  background-color: #1C1C1C;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"],.form input[type="number"], .form--login input[type="password"] {
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login .form input[type="number"]:focus,input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #2E2E2E;
}

.form--login input[type="submit"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
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



.form--login button[type="button"] {
  border-radius: 0.15rem;
  padding: 1rem;
}

.form button[type="button"] {
  width: 100%;
}

.form--login button[type="button"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}

.form--login button[type="button"]:focus, .form--login input[type="button"]:hover {
  background-color: #AC58FA;
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
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/60a75255b1d5182476bb0d70/1f66pj7ph';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>		
		<!-- Container -->

		<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>
		
<video controls id="video-player" style="
    padding-top: 0px;
    padding-left: 0px;
    height: 750px;
    width: 1300px;
    margin-left: 70px;
    margin-top: 20px;
"></video>


  <textarea onkeyup="Check()" id="aaaa" class="commentList" rows="10" cols="50" readonly="true" style="
    height: 664px;
    width: 404px;
    background-color: black;
    color:white;
    margin-bottom: 85px;
    ">

</textarea>
			<div class="container">
				<label for="content">채팅</label>
				<form name="commentInsertForm" method="post">
					<div class="input-group">
						<input type="hidden" name="product_id" value="${Produt_dto.product_id}" /> <input
							type="hidden" name="session" value="${sessionScope.user_id}" /> <input
							type="text" class="input col-11" id="chat_content" name="chat_content"
							placeholder="채팅입력"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="commentInsert()">등록</button>
						</span>
					</div>
				</form>
			</div>



<h1 style="
    padding-left: 60px;
    padding-bottom: 0px;
    color:white;
    margin-bottom: 0px;
    width: 1550px;
    height: 5px;
    margin-top: 20px;
">${Produt_dto.product_name}</h1>

 <!--  

        <input id="inputMessage" type="text" style=" background-color: black; color:white;"/>
        <input type="submit" value="send" onclick="send()" style=" background-color: black; color:white;"/>
-->





			<!-- Menu Item -->
			<div class="menuItem col-lg-6 mt-5">
				<img class="card-img-top img-fluid" src="menu_images/${Produt_dto.product_image}" alt="Menu Img" style="width: 800px;height: 500px;margin-left: 35px;margin-bottom: 0px;border-bottom-width: 50px;padding-bottom: 0px;margin-top: 80;">
			</div>





<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" /> 
<input type="hidden" name="aws_url" id="aws_url" value="${Produt_dto.aws_url}" /> 

<div class="site__container">

    <div class="grid__container">

	<form class="form form--login" id="menuform" name="menuform" role="form" style="width: 870px;margin-left: 100px;margin-bottom: 0px;margin-top: -545;">
      
    	        
        <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">판매자</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.user_id}" readonly>
		</div>
		
		<div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">상품설명</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.product_detail}" readonly>
		</div>
		
		<div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">가격</label>
				<input style="color:white;" class="form__input" type="text" value="${Produt_dto.product_price}원" readonly>
		</div>

		<div class="form__field">
		        <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">카테고리</label>
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
							 <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">수량</label>
								<input type="number" name="qty" class="form__input" value="1" min="1" max="19" style="color:white;">
							
						</div>
					
					
				
					<input type="hidden" name="menu_id" value="${Produt_dto.product_id}">
					<input type="hidden" name="menu_name" value="${Produt_dto.product_name}">
					<input type="hidden" name="menu_image" value="${Produt_dto.product_image}">
					<input type="hidden" name="menu_price" value="${Produt_dto.product_price}">
					<input type="hidden" id="user_id" value="${Produt_dto.user_id}">
		
		


				
					<div class="form__field">
						
						<button type="button" class="btn btn-lg btn-secondary btn-block"  onclick="orderNow(${Produt_dto.product_id})">바로 주문하기</button>
					</div>
					
			</form>
					</div>
			</div>
				
			
	
	</body>
	
	
	
 <script type="text/javascript">
 function Check(){
 var str = $("#aaaa").val();

 var str_arr = str.split("\n");  // 줄바꿈 기준으로 나눔 

 var row = str_arr.length;  // row = 줄 수 

 if(row >10){

 //마지막 입력문자 삭제


 var lastChar = str.slice(0,-1); //열 

 $("#aaaa").val(lastChar)



 }

 }
 
 
//ajax

 function commentInsert(){ //댓글 등록 버튼 클릭시 
  	 var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
  	 CmtInsert(insertData); //Insert 함수호출(아래)
  }

/////패팅 목록 
setInterval(function commentList(){
 	var product_id=$("input[name=product_id").val();
  	var SessionID=$("input[name=session]").val();
  	 var user_id = $('#user_id').val();
  	$.ajax({
         url : 'getProduct_chat.go',
         type : 'get',
         data : {product_id : product_id},
         success : function(data){
             var commentView ='';
             $.each(data, function(key, comment){ 
            	 if(user_id==comment.user_id){
            		 commentView += '방장 '+comment.user_id+' : '+comment.chat_content;
            	 }else{
            		 commentView += comment.user_id+' : '+comment.chat_content; 
            	 }
             	
             
             });
             $(".commentList").html(commentView);
         },
         error : function(error) {

         }
     });
  	},500)


//채팅 등록
 function CmtInsert(insertData){
  	var product_id=$("input[name=product_id").val();
  	if(commentInsertForm.chat_content.value){
  		
  	$.ajax({
         url : 'insertChat_comment.go',
         type : 'post',
         data : insertData,
         success : function(data){
         	if(data == 1) {
         		/*오류메세지 작성*/
            }else{
         	  /// commentList();
         	   $('[name=chat_content]').val('');
            }
         },
     	error : function(error) {
         alert("error : " + error);
     }
     });
  	}else{
  		alert("채팅을 입력해주세요");
  	}
  	}
 
 
 
 
 var aws_url = $('#aws_url').val();
 if (IVSPlayer.isPlayerSupported) {
   const player = IVSPlayer.create();
   player.attachHTMLVideoElement(document.getElementById('video-player'));
   player.load(aws_url);
   player.play();
 }
 
 
 
 /*
 
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
    
    */
  </script>
</html>