<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>

		<!-- Container -->
		<div class="container">
		<div class="grid_container" style="margin:0 auto; width:60%;">
		
			<c:if test="${result eq 0}">
	 			<h3 class="fs-4 my-4 text-center text-white">주문이력이 없습니다</h3>
			</c:if>
			<c:if test="${result ne 0}">
			
			<h3 class="fs-4 my-4 text-center text-white">${sessionScope.user_id}님의 주문 목록</h3>
				<table class="table table-sm table-responsive-lg table-striped table-hover text-center mt-3 mb-5 text-white">
					<thead>
						<tr>
							<th scope="col" class="order_no" style="background-color: #7550e6;">주문번호</th>
							<th scope="col" class="order_date" style="background-color: #7550e6;">날짜</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">주문 품목</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">주문 상세 페이지</th>
							<th scope="col" class="menu_name" style="background-color: #7550e6;">리뷰 작성</th>
						</tr>
					</thead>
			
				
				
					<c:forEach var="i" begin="0" end="${fn:length(cusorderlist)-1}" step="1">
					<c:set var="count" value="${counts[i]}"/>
					<c:set var="cusorder" value="${cusorderlist[i]}"/>
							<tr class="text-white" style="height: 40px; vertical-align: middle;">
								<td scope="row">
									${cusorder.order_num}
								</td>
								<td class="py-3" scope="row">
								<fmt:formatDate value="${cusorder.order_date}" pattern="yyyy-MM-dd HH:mm"/>
								</td>
								<td class="py-3" scope="row">
								${cusorder.product_name}
								</td>
								
								<td scope="row">
									<button type="button" class="btn p-1 text-white round-button" style="background-color:#a26de1; width: 120px" onclick="location.href='detailed_order_history.go?order_num=${cusorder.order_num}&order_date=${cusorder.order_date}'">주문 상세정보</button>
								</td>
								
								<td scope="row">
									<button type="button" class="btn p-1 text-white round-button" style="background-color:#55765c; width: 120px" onclick="location.href='product_review.go?product_id=${cusorder.product_id}&product_name=${cusorder.product_name}'">리뷰 작성</button>
									<button id="review_button" type="button" class="btn p-1 text-white round-button" style="background-color:white; width: 120px" >리뷰 작성</button>
								</td>
							</tr>
							<tr id="review_toggle" style="display:none;">
							<td colspan=5>
							<div class="row my-4" style="width:960px; margin:0 auto;">
								<label class="text-center p-1" for="content" style="width:80px; background-color: #8b7fac;font-size: 20;border-radius: 5px;padding: 5px;color: beige">Review</label>
								<h1 id="${cusorder.product_name} "></h1>
								<form class="p-1" action="product_review_pro.go" name="commentInsertForm" id="form" method="POST" enctype="multipart/form-data" style="margin:0 auto">
									<div class="text-center d-flex flex-inline">
										<label class="reviewRatings">5점
											<input type="radio" name="review_score" value="5" checked>	<span class="checkmark"></span>
										</label>
										<label class="reviewRatings">4점
											<input type="radio" name="review_score" value="4">	<span class="checkmark"></span>
										</label>
										<label class="reviewRatings">3점
											<input type="radio" name="review_score" value="3">	<span class="checkmark"></span>
										</label>
										<label class="reviewRatings">2점
											<input type="radio" name="review_score" value="2">	<span class="checkmark"></span>
										</label>
										<label class="reviewRatings">1점
											<input type="radio" name="review_score" value="1">	<span class="checkmark"></span>
										</label>
									</div>
									<input type="file" class="form-control" name="review_image" id="review_image" accept=".gif, .jpg, .png, .jpeg" style="background-color: #cfc4d6;">
									<div class="input-group">
										<input type="hidden" name="session" value="${sessionScope.user_id}" />
										<input type="hidden" id="product_id" name="product_id" />
										<input type="text" class="form-control text-white" id="review_content" name="review_content" placeholder="리뷰"> <span class="input-group-btn">
															<button class="btn btn-default text-white p-0 m-2" type="submit">Enter</button>
														</span>
									</div>
								</form>
								<div class="commentList p-1" style="width: 960;margin: auto;margin-top: 50;"></div>
							</div>
							</td>
						</c:forEach>
				
				</table>
				
	</c:if>
		</div>
		
		</div>
<script type="text/javascript"> //ajax
	function getQuerystring(paramName){
	
		var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
		
		for(var i = 0; _tempArray.length; i++) {
			var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
			
			if(_keyValuePair[0] == paramName){ // _keyValuePair[0] : 파라미터 명
				// _keyValuePair[1] : 파라미터 값
				return _keyValuePair[1];
			}
		}
	}
	document.getElementById("product_id").value = getQuerystring('product_id')
	document.getElementById("product_name").value = getQuerystring('product_name')
	$('#product_name').text(getQuerystring('product_name'));
</script>
		
<script>
$(document).ready(function(){
  $("#review_button").click(function(){
    $("#review_toggle").toggle(300);
  });
});
</script>	
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
<%@include file="tail.jsp"%>
