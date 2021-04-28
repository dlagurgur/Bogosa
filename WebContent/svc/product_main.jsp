<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		


<style>
.jumbotron{
    -webkit-background-size: 100% 100%;
    -moz-background-size: 100% 100%;
    -o-background-size: 100% 100%;
    background-size: 100% 100%;
}
/* jumbotron image */


</style>
	</head>
	<body>
		
		
		<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1">
			<h1 class="display-5 text-center font-weight-bold pt-4"></h1>
			
		</div>
		
		<%@include file="product_subNav.jsp"%>
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck mt-4 mb-4">
				<c:forEach var="menu" items="${menus}">
				<a class="menuListItem" href="product_detail.go?product_id=${menu.product_id}">
					<div class="card mt-4 mb-4">
						<img class="card-img-top img-fluid" src="menu_images/${menu.product_image}" alt="Menu Img" width="150" height="100">
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
