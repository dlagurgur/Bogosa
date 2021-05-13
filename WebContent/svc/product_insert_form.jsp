<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>
<script src="${project}script.js"></script>


<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<!--enctype="multipart/form-data"-->
<div class="container">
	<form name="inputform" action="product_insert_pro.go" method="post" enctype="multipart/form-data" >
		<h3>상품에 대한 정보를 입력하세요</h3>
		<div class="form-group row">
		
		
		<input class="form-control" type="hidden" name="aws_url" id="aws_url" value="${userDto.a}" >
			<div class="col-xs-2">
				<label for="product_name">상품 명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="product_name" id="product_name" maxlength="50">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_price">상품 가격</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="product_price" id="product_price" maxlength="20">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_image">상품 이미지 파일</label>
			</div>
			<div class="col-xs-2">
				<input class="input" type="file" name="product_image" id="product_image">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_category">분류</label>
			</div>
			<div class="col-xs-2">
				<select name="product_category"	id="product_category">
				  <option value="1">가전디지털</option>
				  <option value="2">식품</option>
				  <option value="3">주방용품</option>
				  <option value="4">생활용품</option>
				  <option value="5">의류</option>
				  <option value="6">취미</option>
				  <option value="7">스포츠/레저</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_detail">상품 설명</label>
			</div>
			<div class="col-xs-2">
				<textarea class="form-control" name="product_detail" id="product_detail" rows="10" cols="30">
				</textarea>
			</div>
			
			<input type="hidden" name="session" value="${user_id}" /> 
			<input type="hidden" name="product_id" value="${product_id}" /> 
			
		</div>
		<div class="form-group row">
			<input class="btn btn-primary" type="submit" value="등록">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	</form>
</div>
	
<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->