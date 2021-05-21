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
	</head>
	<style>
	#a{
		margin-top:100px;
	}

	</style>
	
	<body>
		
		<form class="form form--login" id="menuform" name="menuform" role="form" >
		<!-- Container -->
		<div class="container">
		<c:if test="${result eq 0}">
 			<h1 class="text-center text-dark" id="a">작성 글이 없습니다.</h1>
		</c:if>
		<c:if test="${result ne 0}">
			<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-5 mb-5">
				<thead>
					<tr>
						<th scope="col" class="order_no">방 번호</th>
						<th scope="col" class="order_date">방 제목</th>
						<th scope="col" class="menu_name">상품명 </th>
						<th scope="col" class="menu_name">가격</th>
						<th scope="col" class="menu_name">방송 예정일</th>
						<th scope="col" class="menu_name">방송 시작하기</th>
					</tr>
				</thead>
		
			
			
				<c:forEach var="i" begin="0" end="${fn:length(Trailer_dto)-1}" step="1">
				<c:set var="count" value="${counts[i]}"/>
				<c:set var="cusorder" value="${Trailer_dto[i]}"/>
						<tr>
							<td scope="row">
								${cusorder.trailer_id}
							</td>
							
							<td scope="row">
							${cusorder.trailer_title}
							</td>
							<td scope="row">
							${cusorder.trailer_name}
							</td>
							<td scope="row">
							${cusorder.trailer_price}원
							</td>
							
							<td scope="row">
							${cusorder.trailer_launchdate}
							</td>
							<td scope="row">
							<button type="button" onclick="location.href='trailer_product_insert_form.go?trailer_id=${cusorder.trailer_id}'">방송하기</button>

							</td>
						</tr>
					</c:forEach>
			
			</table>
</c:if>
		</div>
			
					
		</form>
	</body>
	
<script>








$(document).ready(
		function() {
$('.clickableRow').on(
		'click',
		function(event) {
			window.location=$(this).data('href');
		}
	);
}
		
);
</script>
</html>