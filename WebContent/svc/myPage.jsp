<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->
	<script src="${project}script.js"></script>
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



.site__container {
  -webkit-box-flex: 1;
  -webkit-flex:  1;
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



.form--login button[type="button"] {
  border-radius: 0.15rem;
  padding: 1rem;
}

.form button[type="button"] {
  width: 100%;
}



.form--login button[type="button"] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}

.form--login button[type="button"]:focus, .form--login input[type="button"]:hover {
  background-color: #d44179;
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


 input[type='radio']:checked:before {
  	background:#606468;
  }
  
</style>
</head>
<body class="align" style="padding-top: 20px;margin-right: 180px; color:white;">

  
  <div class="site__container">

    <div class="grid__container">
    <h3 style="
    padding-bottom: 20px;
    width: 470px;
">${userDto.user_id}님의 정보</h3>
	<form class="form form--login" name="joinform" method="post" role="form" style="width: 470px;">
      
    	        
        <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">아이디</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_id}" readonly>
		</div>
	 	
	 	 <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">이름</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_name}" readonly>
		</div>
		
		   <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">권한</label>
		       <c:if test="${userDto.user_corp eq 2}">
					<input style="color:white;" class="form__input" type="text" value="개인" readonly>
					</c:if>
					<c:if test="${userDto.user_corp eq 1}">
					<input style="color:white;" class="form__input" type="text" value="기업" readonly>
					</c:if>
		</div>
	 	 	
	 	 	
	   <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">주소</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_addr}" readonly>
		</div>
		
		
		
		  <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">상세주소</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_addr2}" readonly>
		</div>
	 	
	 	
	 	
	 	
  		<div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">이메일</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_email}" readonly>
		</div>
		
	  <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">전화번호</label>
				<input style="color:white;" class="form__input" type="text" value="${userDto.user_phone}" readonly>
		</div>
		
		
		<div class="form__field">
		<br>
		<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='update.go'" style="height: 65px;margin-top: 8px;" >${btn_modify}</button>&nbsp;&nbsp;					
		<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='delete.go'">${btn_user_delete}</button>
		</div>
		
		<div class="form__field">
		<br>
		<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='Order_confirmation.go'" style="height: 65px;margin-top: 8px;" >판매기록 </button>&nbsp;&nbsp;					
		<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='Order_history_select.go'">주문기록</button>
		</div>
		
		
		<div class="form__field">
					
					<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='product_insert.go'">방송 시작하기</button>
				
			</div>
			
			
	
	 	
				</form>
		
	 
	
				
			</div>
	 </div>

</html>