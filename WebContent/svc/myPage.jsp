<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>


    <h3 class="fs-4 my-4 text-center text-white">${userDto.user_id}님의 정보</h3>
	<form class="form form--login my-2" name="joinform" method="post" role="form" style="width: 700px; margin:0 auto;">
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
			<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">스트림키</label>
			<input style="color:white;" class="form__input" type="text" value="${userDto.b}" readonly>
		</div>
		<div class="form__field">
			<label for="nickname" class="col-sm-3 col-form-label" style="color:white;">방송서버</label>
			<input style="color:white;" class="form__input" type="text" value="${userDto.c}" readonly>
		</div>
		<div class="form__field">
			<br>
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='update.go'" style="height: 65px;margin-top: 8px;">${btn_modify}</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='delete.go'" style="height: 65px;margin-top: 8px;">${btn_user_delete}</button>
		</div>
		<div class="form__field">
			<br>
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='Order_confirmation.go'" style="height: 65px;margin-top: 8px;">판매기록</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='Order_history_select.go'" style="height: 65px;margin-top: 8px;">주문기록</button>
		</div>
		<div class="form__field">
			<br>
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='product_select.go'" style="height: 65px;margin-top: 8px;">등록한 상품</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='trailer_select.go'" style="height: 65px;margin-top: 8px;">등록한 예고</button>
		</div>
		<div class="form__field">
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='product_insert.go'">방송 시작하기</button>
		</div>
		<div class="form__field">
			<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='trailer_insert.go'">예고편 작성</button>
		</div>
	</form>
		
	 
	
				


<%@include file="tail.jsp"%>