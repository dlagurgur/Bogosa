<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		


<style>



</style>
	</head>
	<body>
		
		
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck mt-4 mb-4">
				<c:forEach var="menu" items="${menus}">
				<a class="menuListItem" href="product_detail.go?product_id=${menu.product_id}">
					<div class="card mt-4 mb-4">
						<img class="card-img-top img-fluid" src="menu_images/${menu.product_image}" alt="Menu Img" style="width: 300px; height: 250px;">
						<div class="card-body text-center font-weight-bold flex-fill">
							<b class="card-title text-danger">${menu.product_name}</b>
							<p class="card-text text-dark">${menu.product_price}원</p>
						</div>
					</div>
				</a>
				</c:forEach>
			</div>
			
		</div>

	</body>
</html>
