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
	<form name="inputform" action="trailer_insert_pro.go" method="post">
		<h3>상품에 대한 정보를 입력하세요</h3>
		<div class="form-group row">		
			<div class="col-xs-2">
				<label for="product_name">상품 명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="trailer_name" id="trailer_name" maxlength="50">
			</div>
			
			
			<div class="col-xs-2">
				<label for="product_name">방제목</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="trailer_title" id="trailer_title" maxlength="50">
			</div>			
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_price">상품 가격</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="trailer_price" id="trailer_price" maxlength="20">
			</div>
		</div>
				<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_price">상품 이미지</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="trailer_aws_url" id="trailer_aws_url" maxlength="20">
			</div>
		</div>
	
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="product_detail">상품 설명</label>
			</div>
			<div class="col-xs-2">
				<textarea class="form-control" name="trailer_detail" id="trailer_detail" rows="10" cols="30">
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