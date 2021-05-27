<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<%@include file="header.jsp" %>
		
		<div class="container-fluid" style="padding: 0;">
			<!-- Carousel (Ads) -->
			<div id="ads" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#ads" data-slide-to="0" class="active"></li>
					<li data-target="#ads" data-slide-to="1" class="active"></li>
					<li data-target="#ads" data-slide-to="2"></li>
					<li data-target="#ads" data-slide-to="3"></li>
					<li data-target="#ads" data-slide-to="4"></li>
					<li data-target="#ads" data-slide-to="5"></li>
					
				</ol>
				<div class="carousel-inner" style="height: 400px; width: 100%;">
					<div class="carousel-item active">
						<img class="d-block h-75 newTrex" src="${project}img/1.PNG" alt="First Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/2.jpg" alt="Second Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/3.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/4.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/5.jpg" alt="Third Slide">
					</div>
					<div class="carousel-item">
						<img class="d-block h-75" src="${project}img/6.jpg" alt="Third Slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#ads" role="button" data-slide="prev">	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#ads" role="button" data-slide="next">	<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>	
				</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="menu" items="${menus}">
					<div class="col-sm-4 d-flex justify-content-center">
						<div class="card bg-black mt-4 mb-4" style="background-color: #151515; width: 362px;">
							<input type="hidden" name="aws_url" id="aws_url" value="${menu.aws_url}" />
							<video autoplay id="video-player" style="width: 360px; height: 270px;" muted="muted"></video>
							<div class="card-body text-center font-weight-bold flex-fill" style="background-color:#151515;"> <b class="card-title" style="color:#D8D8D8;">${menu.product_name}</b>
								<p class="card-text" style="color:#D8D8D8;">${menu.product_price}원</p> <a href="product_detail.go?product_id=${menu.product_id}" class="btn btn-danger stretched-link"> ON AIR </a>
								<p class="card-text mt-4" style="color:#D8D8D8;">${menu.product_title}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<script type="text/javascript">
			var aws_url = $('#aws_url').val();
			if (IVSPlayer.isPlayerSupported) {
			  const player = IVSPlayer.create();
			  player.attachHTMLVideoElement(document.getElementById('video-player'));
			  player.load(aws_url);
			  player.play();
			}
		</script>
		
		<%@include file="tail.jsp" %>
