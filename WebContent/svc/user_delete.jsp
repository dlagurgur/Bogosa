<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->

<style>
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

.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"],
.form--login button[type="button"],
.form--Login input[type="reset"]
. {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login .form input[type="number"]:focus,input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #2E2E2E;
}
.form--login button[type="submit"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}
.form--login button[type="button"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.jb-large { font-size: xx-large; }
.jb-medium { font-size: medium; }
</style>			
	
		<!-- Container -->
		<div class="container max-auto" style="min-height: 100%;">
			<form method="post" name="modify_info_form" action="deletePro.go">
			 <div class="jb-large">
			 	<h2 style="color:white;">회원탈퇴</h2>
			 </div>
			 <div class="jb-medium">
			 	<div class="form__field">
					<input class="form-control col-5" type="password" name="user_pw" placeholder="비밀번호를 입력하세요">&nbsp;&nbsp;
				<div class="form--login">			 	
					<button type="submit" class="btn btn-md btn-secondary">삭제</button>&nbsp;
					<button type="button" class="btn btn-md btn-secondary"
					onclick="location='myPage.go'">취소</button>	
				</div>
			</div>
			</div>
		</form>
			
			</div>
			
		
			<!-- Footer - No Scroll -->
			