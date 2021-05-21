<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>
<script src="${project}script.js"></script>
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

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form button[type="button"],.form input[type="number"], .form input[type="reset"] {
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
.form--login button[type="button"],
.form--Login input[type="reset"]
. {
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
.form--login input[type="reset"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
}
.form--login input[type="reset"]:focus, .form--login input[type="reset"]:hover {
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
  max-width: 30rem;
  width: 90%;
}


</style>

</head>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!--enctype="multipart/form-data"-->


<body class="align" style="padding-top: 20px;margin-right: 180px; color:white;">
	<div class="site__container">
	<div class="grid__container">
			<h3 style="
			padding-bottom: 20px;
			width:470px;">상품에 대한 정보를 입력하세요</h3>
		<form class="form form--login" name="productform" action="product_insert_pro.go" method="post" role="form" style="width: 700px;"enctype="multipart/form-data" >				
			<div class="form__field">
				<label for="product_title" class="col-sm-3 col-form-label" style="color:white;" >방송 제목</label>
				<input class="form__input" type="text" name="product_title" id="product_title" maxlength="50" value="${product_dt.trailer_title}" style="color:white;">
			</div>		
			<div class="form__field">		
				<label for="product_name" class="col-sm-3 col-form-label" style="color:white;" >상품 이름</label>
				<input class="form__input" type="text" name="product_name" id="product_name" maxlength="50" value="${product_dt.trailer_name}" style="color:white;">	
			</div>		
			<div class="form__field">
			
				<label for="product_price" class="col-sm-3 col-form-label" style="color:white;">상품 가격</label>
				<input class="form__input" type="number" name="product_price" id="product_price" maxlength="20" value="${product_dt.trailer_price}" style="color:white;">
			</div>	
			<div class="form__field">
			
				<label for="product_image" class="col-sm-3 col-form-label" style="color:white;">상품 이미지 파일</label>
				<input class="form__input" type="file" name="product_image" id="product_image" style="color:white;">
			</div>
			<div class="form__field">
				<label for="product_category" class="col-sm-3 col-form-label" style="color:white;">분류</label>
				<select class="from__input" name="product_category"	id="product_category">
				  <option value="1">가전디지털</option>
				  <option value="2">식품</option>
				  <option value="3">주방용품</option>
				  <option value="4">생활용품</option>
				  <option value="5">의류</option>
				  <option value="6">취미</option>
				  <option value="7">스포츠/레저</option>
				</select>
			</div>
		<div class="form__field">
				<label for="product_detail" class="col-sm-3 col-form-label" style="color:white;">상품 설명</label>
			
				<textarea class="form-control" name="product_detail" id="product_detail" rows="5" cols="30">
				</textarea>
			</div>
		<input type="hidden" name="session" id="session" value="${user_id}" /> 
		<input type="hidden" name="product_id" value="${product_id}" /> 
		<input type="hidden" name="aws_url" id="aws_url" value="${userDto.a}" >
			
		<div class="form__field">
			<input class="btn btn-primary" type="submit" value="등록">
			<input class="btn btn-primary" onclick="location='myPage.go'" type="reset" value="취소">
		</div>
		</form>
	</div>
</div>


</body>



<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->