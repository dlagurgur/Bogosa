<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>
	
<style>

 {
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


textarea {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


select {
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

.form--login textarea{
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}


.form--login select{
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
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
		<form class="form form--login" name="productform" action="trailer_product_insert_pro.go" method="post" role="form" style="width: 700px;"enctype="multipart/form-data" onsubmit="return product_insert_check();">
		<input class="form__input" type="hidden" name="trailer_id" id="trailer_id" maxlength="50" value="${product_dt.trailer_id}" style="color:white;">				
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
				<input style="color:white;" class="form__input" type="file" name="product_image" id="product_image">
			</div>
			<div class="form__field">
				<label for="product_category" class="col-sm-3 col-form-label" style="color:white;">분류</label>
				<select class="from__input" name="product_category"	id="product_category" style="width: 150px; color:white;">
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
			<label for="product_title" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">방송 제목</label>
			<input class="form__input" type="text" name="product_title" id="product_title" maxlength="50" value="${product_dt.trailer_title}" style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_name" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 이름</label>
			<input class="form__input" type="text" name="product_name" id="product_name" maxlength="50" value="${product_dt.trailer_name}" style="color:white;background-color: #cfc4d661;">
		</div>
		<div class="form__field">
			<label for="product_price" class="col-sm-3 col-form-label text-center" style="color:white;background-color: #7f5cad;">상품 가격</label>
			<input class="form__input" type="number" name="product_price" id="product_price" maxlength="20" value="${product_dt.trailer_price}" style="color:white;background-color: #cfc4d661;">
		</div>
		
		<div class="form_field">
			<label for="product_detail" class="col-sm-3 col-form-label text-center fs-5 p-2 mb-1" style="color:white; background-color: #7f5cad; width:140px; border-radius:2rem;">상품 설명</label>
			<textarea class="form-control my-2" name="product_detail" id="product_detail" rows="10" cols="30" style="background-color: #cfc4d6;"></textarea>
		</div>
		<div class="form__field m-1">
			<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">카테고리</p>
			<select class="form-select" name="product_category" id="product_category" style="background-color: #cfc4d6; margin:auto; border-radius:2rem;">
			<option selected>상품의 카테고리를 선택하세요</option>
				<option value="1">가전디지털</option>
				<option value="2">식품</option>
				<option value="3">주방용품</option>
				<option value="4">생활용품</option>
				<option value="5">의류</option>
				<option value="6">취미</option>
				<option value="7">스포츠/레저</option>
			</select>
		</div>
		<div class="input-group mb-3">
			<p class="fs-6 m-2 text-center text-white p-1" style="width:120px;background-color: #7f5cad;border-radius: 1rem;">상품 이미지</p>
			<input type="file"  class="form__input" name="product_image" id="product_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;height:27px;border-radius: 1rem;margin: auto;">
		</div>
		
		<input type="hidden" name="session" id="session" value="${user_id}" />
		<input type="hidden" name="product_id" value="${product_id}" />
		<input type="hidden" name="aws_url" id="aws_url" value="${userDto.a}">
		<input type="hidden" name="user_charn" id="user_charn" value="${userDto.user_charn}">
		<div class="form__field">
			<button class="round-button" style="width: 250px;margin-left: 32%;height: 50px;border-radius: 3rem;" type="submit" >상품 등록</button>
		</div>
	</form>

			
</div>
</div>



<%@include file="tail.jsp"%>