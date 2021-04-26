<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	 <!-- Custom style for this template -->
	<link rel="stylesheet" href="${project}travelers_style.css">
	<script src="${project}script.js"></script>

  </head>
  <c:if test="${sessionScope.user_id eq null}">	    
  <body class="login">
  	<form class="form-signin" method="post" action="loginPro.go" name="loginform" onsubmit="return logincheck()" >
  		<a href="tripList.go">
  			<img class="pt-0 mt-0 mb-4" src="${project}img/login.jpg" alt="logo" width="400" height="250">
  		</a>
     	<input type="text" id="inputId" name="user_id" class="form-control" 
     		placeholder="${str_id}" required autofocus>
 	 	
 	 	<input type="password" id="inputPassword" name="user_pw" class="form-control" 
 	 		placeholder="${str_passwd}" required>
  		
  		<button class="btn btn-lg btn-secondary btn-block" type="submit">${btn_login}</button>
  		<a href="join.go"><u>${page_input}</u></a>
  		<a onclick="window.open('EmailId.go','아이디 찾기','width=400,height=400,location=no,status=no,scrollbars=no');"><u>${EmailId}</u></a>
  		<a onclick="window.open('EmailPasswd.go','비밀번호 찾기','width=400,height=400,location=no,status=no,scrollbars=no');"><u>${EmailPasswd}</u></a>
  		<p class="mt-5 mb-3 text-muted">&copy; 2021-2022</p>	
  
  	</form>
  	
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
  </body>
</c:if>
 <c:if test="${sessionScope.user_id ne null}">
	<c:redirect url="myPage.go"/>		
</c:if>
</html>
   