<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="header.jsp"%>
			<div class="container-fluid">
			  <div class="row">
			  
			  <c:forEach var="menu" items="${Trailer_dto}">
			  
			    <div class="col-sm-3 d-flex justify-content-center">
			      <div class="card bg-black mt-5" style="background-color: #151515; width: 362px;">
			       <c:if test="${menu.trailer_aws_url eq null}"> 
						<img class="card-img-top img-fluid" src="menu_images/${menu.trailer_image}" alt="Menu Img" style="width: 360px; height: 270px;">
					</c:if>
					<!--  -->
					<c:if test="${menu.trailer_aws_url ne null}">
						<video id=video${menu.trailer_id}  class="video-js vjs-big-play-centered" style="width: 100%;" autoplay muted="muted">
    					<source src="${menu.trailer_aws_url}" type="application/x-mpegURL" >
						</video>
					</c:if>
			        
			        <input type=hidden name="showdate" value="${menu.trailer_launchdate}">
			        <div class="card-body text-center font-weight-bold flex-fill" style="background-color:#151515;">
			          <b class="card-title" style="color:#D8D8D8;">${menu.trailer_name}</b>
					  <p class="card-text" style="color:#D8D8D8;">${menu.trailer_price}원</p>
					  <a  href="trailer_detail.go?trailer_id=${menu.trailer_id}" class="btn btn-primary stretched-link">라이브 예정일시 : 
					  <script>
					 	var showdate = $("input[name=showdate]").val();
					 	showdate = showdate.slice(0,16);
					 	document.write(showdate);
					  </script>
					  </a>
			        </div>
			      </div>
			    </div>
			    <script type="text/javascript">
				var player = videojs('video${menu.trailer_id}');
				player.play();
    </script>
			    
			  </c:forEach>
			  
			  </div>
			</div>
		
	
	
<%@include file="tail.jsp"%>